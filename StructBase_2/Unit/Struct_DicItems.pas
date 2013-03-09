unit Struct_DicItems;

interface
uses Struct_DicBaseItem,classes;

Type
  TDicItems = Class
  private
    DicItemChain: TStringList;
  public
    procedure AddDicItem(uDicBase:TDicBaseItem);
    function  find(uDicId: String): TDicBaseItem;
    Constructor Create;
    Destructor Destroy; override;
  end;

implementation

{ TDicItems }



procedure TDicItems.AddDicItem(uDicBase: TDicBaseItem);
var
  I: Integer;
begin
   I := DicItemChain.IndexOf(uDicBase.dicId);
   if I<0 then   DicItemChain.AddObject( uDicBase.dicId,uDicBase);
end;



constructor TDicItems.Create;
begin
   DicItemChain:=TStringList.Create;
end;

destructor TDicItems.Destroy;
var I:integer;
begin
  for I := 0 to DicItemChain.Count - 1 do
  begin
     TDicBaseItem(DicItemChain.Objects[I]).Free;
  end;
  DicItemChain.Free;
  inherited;
end;

function TDicItems.find(uDicId: String): TDicBaseItem;
var
  I: Integer;
begin
  DicItemChain.Sort;
  I := DicItemChain.IndexOf(uDicId);
  if I < 0 then
    Result := nil
  else
    Result := TDicBaseItem(DicItemChain.Objects[I]);
end;



end.
