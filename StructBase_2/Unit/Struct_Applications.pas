unit Struct_Applications;

interface

uses Struct_Application, Windows, SysUtils, Classes, Variants,WideStrings;

Type
  TStruct_Applications = Class
  private
    ApplicationChain: TStringList;
    function getApplication(Index: Integer): TStruct_Application;
  public
    property Items[Index: Integer]: TStruct_Application read getApplication;
    procedure AddApplication(uApp:TStruct_Application);
    function find(uAppName: String): TStruct_Application;
    Constructor Create;
    Destructor Destroy; override;
  end;

implementation

{ TStruct_Applications }

procedure TStruct_Applications.AddApplication(uApp: TStruct_Application);
var
  I: Integer;
begin
  I := ApplicationChain.IndexOf(uapp.AppId);
  if I<0 then   ApplicationChain.AddObject(uapp.AppId,uapp);
end;

constructor TStruct_Applications.Create;
begin
  ApplicationChain := TStringList.Create;
end;

destructor TStruct_Applications.Destroy;
var I:integer;
begin
  for I := 0 to ApplicationChain.Count - 1 do
  begin
     TStruct_Application(ApplicationChain.Objects[I]).Free;
  end;
  ApplicationChain.Free;
  inherited;
end;

function TStruct_Applications.find(uAppName: String): TStruct_Application;
var
  I: Integer;
begin
  ApplicationChain.Sort;
  I := ApplicationChain.IndexOf(uAppName);
  if I < 0 then
    Result := nil
  else
    Result := TStruct_Application(ApplicationChain.Objects[I]);
end;

function TStruct_Applications.getApplication(Index: Integer)
  : TStruct_Application;
begin
  Result := TStruct_Application(ApplicationChain.Objects[Index]);
end;

end.
