unit Struct_DBControls;

interface

uses Mask, classes, dbclient, CommonBpl_BaseType,Struct_DicBaseItem;

Type
  TDbControls = Class
  private
    DbControlChain: TStringList;
    function getDBControl(idx: integer): TDBControl;
    function getCount: integer;
  public
    procedure InsertDbControl(uDBControl: TDBControl);
    function AddNew(aControl: TMaskEdit; uAppName, uTableName: String)
      : TDBControl;
    procedure RemoveDbControl(uName: String); overload;
    procedure RemoveDbControl(idx: integer); overload;
    function find(uName: String): TDBControl;
    property Items[Index: integer]: TDBControl read getDBControl;
    property count: integer read getCount;
    Constructor Create;
    Destructor Destroy; override;
  end;

implementation

uses sysutils,
  dialogs,
  DB,
  uStructbaseFrameWork,
  variants;
{ TDicDataSets }

procedure TDbControls.InsertDbControl(uDBControl: TDBControl);
var
  I: integer;
  uName: String;
begin
  uName := uppercase(uDBControl.cntlObjct.name);
  I := DbControlChain.IndexOf(uName);
  if I < 0 then
    DbControlChain.AddObject(uName, uDBControl);
end;

function TDbControls.AddNew(aControl: TMaskEdit; uAppName, uTableName: String)
  : TDBControl;
var
  dbCntrl: TDBControl;
var
  cdsTable: TClientDataset;
begin
  dbCntrl := TDBControl.Create;
  DbControlChain.AddObject(aControl.name, dbCntrl); // DbControlChain负责释放
  dbCntrl.appName := uAppName;
  dbCntrl.tablename := uTableName;
  dbCntrl.fieldname := copy(aControl.name, 4, length(aControl.name) - 3);
  dbCntrl.cntlObjct := aControl;
  dbCntrl.dataInputCntl:=structbase.CntlDataInput;
  dbcntrl.allowDataInputProxy:=false;
  dbCntrl.fieldMetaBase := TDbFormFieldBase.Create;
 // dbCntrl.dicMetaBase := TDicBaseItem.Create;    引用DicItems中的数据

  with structbase.Applications.find(uAppName).MetaSource do
  begin
    cdsTable := getTableDefineCDS(dbCntrl.appName, dbCntrl.tablename);
  end;
  cdsTable.First;
  cdsTable.Filtered := false;

  if cdsTable.Locate('AppId;TableName;ColName', VarArrayOf
      ([dbCntrl.appName, uppercase(dbCntrl.tablename), dbCntrl.fieldname]),
    [loCaseInsensitive, loCaseInsensitive, loCaseInsensitive]) = false then
  begin
      showmessage('错误发生在数据控件注册:' + dbCntrl.fieldname + ',没有定义,检查TableDefine');
  end
  else
  begin
    with cdsTable do
    begin
      dbCntrl.fieldMetaBase.fieldChinese := fieldbyname('colChineseName')
        .asstring;
      dbCntrl.fieldMetaBase.fieldname := fieldbyname('colName').asstring;
      dbCntrl.fieldMetaBase.fieldType := fieldbyname('colType').asstring;
      dbCntrl.fieldMetaBase.fieldLen := fieldbyname('colLength').asstring;
      dbCntrl.fieldMetaBase.fieldPkFlag := fieldbyname('pkflag').asstring;
      dbCntrl.fieldMetaBase.dicId := fieldbyname('dicId').asstring;
      dbCntrl.fieldMetaBase.tablename := fieldbyname('tablename').asstring;
      // dbcntl.fieldMetaBase.schemaName:=self.getAppSchema(appid);
    end;
  end;

  if dbCntrl.fieldMetaBase.dicId <> '' then
  begin
      dbCntrl.dicMetaBase:=structbase.DicItems.find(dbCntrl.fieldMetaBase.dicId);
  end;

   result := dbCntrl;
end;

constructor TDbControls.Create;
begin
  DbControlChain := TStringList.Create;
end;

destructor TDbControls.Destroy;
var
  I: integer;
var
  dbcntl: TDBControl;
begin
  for I := 0 to DbControlChain.count - 1 do
  begin
    dbcntl := TDBControl(DbControlChain.Objects[I]);
    if dbcntl.fieldMetaBase <> nil then
           dbcntl.fieldMetaBase.Free;
   // if dbcntl.dicMetaBase <> nil then
   //        dbcntl.dicMetaBase.Free;
    TDBControl(DbControlChain.Objects[I]).Free;
  end;
  DbControlChain.Free;
  inherited;
end;

function TDbControls.find(uName: String): TDBControl;
var
  I: integer;
begin

  DbControlChain.Sort;
  I := DbControlChain.IndexOf(uppercase(uName));
  if I < 0 then
    result := nil
  else
    result := TDBControl(DbControlChain.Objects[I]);
end;

function TDbControls.getCount: integer;
begin
  result := DbControlChain.count;
end;

function TDbControls.getDBControl(idx: integer): TDBControl;
begin
  if idx <= DbControlChain.count - 1 then
    result := TDBControl(DbControlChain.Objects[idx])
  else
    result := nil;

end;

procedure TDbControls.RemoveDbControl(idx: integer);
begin
  if idx <= DbControlChain.count - 1 then
  begin
    TDBControl(DbControlChain.Objects[idx]).Free;
    DbControlChain.Delete(idx);
  end;
end;

procedure TDbControls.RemoveDbControl(uName: String);
var
  I: integer;
begin
  DbControlChain.Sort;
  I := DbControlChain.IndexOf(uppercase(uName));
  if I > 0 then
  begin
    TDBControl(DbControlChain.Objects[I]).Free; // 释放对象
    DbControlChain.Delete(I);
  end;
end;

end.
