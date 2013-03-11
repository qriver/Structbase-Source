unit DBpl_DBProvides;

interface

uses Struct_Application,
  DBpl_IDBProvide,

  Windows, SysUtils, Classes, Variants, WideStrings;

Type
  TDBpl_DBProvides = Class(TObject)
  private
    FDBClassChain: TStringList;
  //  FDBProvideList: array of IDBProvideInterface;
    function getDBProvide(Index: Integer): TDBpl_DBProvides;
  public
    property Items[Index: Integer]: TDBpl_DBProvides read getDBProvide;
    procedure AddDBProvide(uName, uDbtype, uUrl: string);
    function find(uDBProvideName: String): IDBProvideInterface;
    function ItemCount: Integer;
    Constructor Create;
    Destructor Destroy; override;
    procedure LoadDBProvideFromXmlFile(uName: String);
  end;

implementation

uses
  uStructbaseFrameWork,
  DBpl_ImplIDBProvide_QJ,
  DBpl_ImplIDBProvide_Odac,
  DBpl_ImplIDBProvide_Access;
{ TDBpl_DBProvides }

procedure TDBpl_DBProvides.AddDBProvide(uName, uDbtype, uUrl: string);
var
  qjDBProvide: TQjDBProvide;
var
  accessDBProvide: TAccessDBProvide;
var
  odacDBProvide: TOdacDBProvide;
var
  uIDBPrivode: IDBProvideInterface;
var
  idx: Integer;
begin
  FDBClassChain.Sort;
  if (FDBClassChain.find(uName, idx)) then // 已经注册过,不能重复注册
  begin
    exit;
  end;

  if uDbtype = 'JAVA' then
  begin
    try
      qjDBProvide := TQjDBProvide.Create(); // 实例化1个 DBProvide的实现(QJ版本)
      qjDBProvide.setUrl(uUrl);
      FDBClassChain.AddObject(uName, qjDBProvide);
    finally

    end
  end;

  if uDbtype = 'ADO' then
  begin
    accessDBProvide := TAccessDBProvide.Create;
    accessDBProvide.setUrl(uUrl);
    FDBClassChain.AddObject(uName, accessDBProvide);
  end;

  if uDbtype = 'ODAC' then
  begin
    odacDBProvide := TOdacDBProvide.Create;
    odacDBProvide.setUrl(uUrl);
    FDBClassChain.AddObject(uName, odacDBProvide);
  end;

end;

constructor TDBpl_DBProvides.Create;
begin
  FDBClassChain := TStringList.Create;

end;

destructor TDBpl_DBProvides.Destroy;
var
  I: Integer;
var
  classname: String;
begin
  inherited;
  for I := 0 to FDBClassChain.Count - 1 do
  begin
      classname := (FDBClassChain.Objects[I]).classname;

      if uppercase(classname) = uppercase('TQjDBProvide') then
      begin

    (FDBClassChain.Objects[I] as TQjDBProvide) .Destroy;
      end;

        if uppercase(classname) = uppercase('TAccessDBProvide') then
      (FDBClassChain.Objects[I] as TAccessDBProvide).Destroy;


        if uppercase(classname) = uppercase('TOdacDBProvide') then
      (FDBClassChain.Objects[I] as TOdacDBProvide).Destory;

  end;
  FDBClassChain.free;

end;

function TDBpl_DBProvides.find(uDBProvideName: String): IDBProvideInterface;
var
  idx: Integer;
var
  classname: string;
begin
//  if length(FDBProvideList) < FDBClassChain.Count then
  //  setlength(FDBProvideList, FDBClassChain.Count);

  FDBClassChain.Sort;
  if FDBClassChain.IndexOf(uDBProvideName) <0 then
  begin
  result:=nil;
  exit;
  end;
  classname := (FDBClassChain.Objects[FDBClassChain.IndexOf(uDBProvideName)])
    .classname;

  if uppercase(classname) = uppercase('TQjDBProvide') then
  begin
    result :=
      FDBClassChain.Objects[FDBClassChain.IndexOf(uDBProvideName)]
      as TQjDBProvide;
  end;

  if uppercase(classname) = uppercase('TAccessDBProvide') then
    result :=
      FDBClassChain.Objects[FDBClassChain.IndexOf(uDBProvideName)]
      as TAccessDBProvide;

  if uppercase(classname) = uppercase('TOdacDBProvide') then
   result :=
      FDBClassChain.Objects[FDBClassChain.IndexOf(uDBProvideName)]
      as TOdacDBProvide;

//  result := FDBProvideList[FDBClassChain.IndexOf(uDBProvideName)];

end;

function TDBpl_DBProvides.getDBProvide(Index: Integer): TDBpl_DBProvides;
begin

end;

function TDBpl_DBProvides.ItemCount: Integer;
begin
  result := self.FDBClassChain.Count;
end;

procedure TDBpl_DBProvides.LoadDBProvideFromXmlFile(uName: String);
begin
  structbase.loadDBProvide(uName);
end;

end.
