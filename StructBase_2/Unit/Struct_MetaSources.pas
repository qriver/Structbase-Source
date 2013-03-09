unit Struct_MetaSources;

interface

uses Struct_MetaSource, Windows, SysUtils, Classes, Variants, MaskUtils,
     SqlTimSt, FMTBcd,
     WideStrings;

Type
  TStructMetaSources = Class
  private
    MetaSourceChain: TStringList;
    function getMetaSource(Index: Integer): TStruct_MetaSource;
  public
    property Items[Index: Integer]: TStruct_MetaSource read getMetaSource;
    procedure AddMetaSource(uMetaSource:TStruct_MetaSource);
    function  find(uMetaSourceId: String): TStruct_MetaSource ;
    Constructor Create;
    Destructor Destroy; override;
  end;

implementation

{ TStruct_Applications }

procedure TStructMetaSources.AddMetaSource(uMetaSource: TStruct_MetaSource);
var
  I: Integer;
begin
  I := MetaSourceChain.IndexOf(uMetaSource.MetaSourceId);
  if I<0 then   MetaSourceChain.AddObject(uMetaSource.MetaSourceId,uMetaSource);
end;

constructor TStructMetaSources.Create;
begin
  MetaSourceChain := TStringList.Create;
end;

destructor TStructMetaSources.Destroy;
var I:integer;
begin
  for I := 0 to MetaSourceChain.Count - 1 do
  begin
    TStruct_MetaSource(MetaSourceChain.Objects[I]).free;
  end;
  MetaSourceChain.Free;
  inherited;


end;

function TStructMetaSources.find(uMetaSourceId: String): TStruct_MetaSource;
var
  I: Integer;
begin
  I := MetaSourceChain.IndexOf(uMetaSourceId);
  if I < 0 then
    Result := nil
  else
    Result := TStruct_MetaSource(MetaSourceChain.Objects[I]);
end;

function TStructMetaSources.getMetaSource(Index: Integer)
  : TStruct_MetaSource;
begin
  Result := TStruct_MetaSource(MetaSourceChain.Objects[Index]);
end;


end.
