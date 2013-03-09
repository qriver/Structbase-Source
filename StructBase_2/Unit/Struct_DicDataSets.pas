unit Struct_DicDataSets;

interface
uses classes,dbclient;
Type
  TDicDataSets = Class
  private
    DicDataSetChain: TStringList;
    function getDicDataSet(Index: Integer): TClientDataSet;
  public
    property Items[Index: Integer]: TClientDataSet read getDicDataSet;
    procedure AddDicDataSet(uDicDs:TClientDataSet);
    function find(uDicFileName: String): TClientDataSet;
    Constructor Create;
    Destructor Destroy; override;
  end;

implementation

{ TDicDataSets }

procedure TDicDataSets.AddDicDataSet(uDicDs: TClientDataSet);
var
  I: Integer;
begin
   I := DicDataSetChain.IndexOf(uDicDs.filename);
   if I<0 then   DicDataSetChain.AddObject(uDicDs.filename,uDicDs);
   uDicDs.filename:='';
end;

constructor TDicDataSets.Create;
begin
    DicDataSetChain:=TStringList.Create;
end;

destructor TDicDataSets.Destroy;
var I:integer;
begin
  for I := 0 to DicDataSetChain.Count - 1 do
  begin
     TClientDataSet(DicDataSetChain.Objects[I]).Free;
  end;
  DicDataSetChain.Free;
  inherited;
end;

function TDicDataSets.find(uDicFileName: String): TClientDataSet;
var
  I: Integer;
begin
  DicDataSetChain.Sort;
  I := DicDataSetChain.IndexOf(uDicFileName);
  if I < 0 then
    Result := nil
  else
    Result := TClientDataSet(DicDataSetChain.Objects[I]);

end;

function TDicDataSets.getDicDataSet(Index: Integer): TClientDataSet;
begin

end;

end.
