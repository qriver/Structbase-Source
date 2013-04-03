unit CommonBpl_DBFormBaseEx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  DB,
  DBCLIENT,
  Mask,
  strUtils,
  extctrls,
  DBpl_IDBProvide,
  Struct_LoginUser,
  uStructbaseFrameWork,
  CommonBpl_DBFormBase,
  CommonBpl_BaseType,
  cxGridDBTableView,
  Struct_BaseForm_Function,
  Struct_BaseForm_FunctionEx;

type
  TDBFormBaseEx = class(TDBFormBase)
  private



    { Private declarations }



  public
    { Public declarations }
     procedure mTranslateGrid(AGrid: TcxGridDBTableView; aTableName: String);

    procedure mRegistCntrl(aPanel: TPanel; aTableName: String); overload;
    procedure mRegistCntrl(regMaskeditList: TStringList; aTableName: String);overload;
    procedure mRegistCntrl(aControl: TMaskEdit;  aTableName, aAppName: string);overload;
    procedure mUnRegistCntrl(aControl: TMaskEdit);


    procedure mDisplayRecord(aPanel: TPanel; whereSql: string); overload;
    procedure mDisplayRecord(uCDS: TClientDataSet; dbCntrls: array of TDBControl);overload;
    procedure mDisplayRecord(aPanel: TPanel; uCDS: TClientDataSet); overload;

    procedure mOpenInputProxy(aPanel: TPanel; dataInputCntl: TCustomForm); overload;
    procedure mOpenInputProxy(aControl: TMaskEdit;dataInputCntl: TCustomForm);overload;
    procedure mOpenInputProxy(aControl: TMaskEdit);overload;
    procedure mOpenInputProxy(aPanel: TPanel);overload;
    procedure mCloseInputProxy(aPanel: TPanel);overload;
    procedure mCloseInputProxy(aControl: TMaskEdit);overload;

   function mUpdateRecord(dbCntrls: array of TDBControl):integer;  overload;
   function mUpdateRecord(aPanel:TPanel):integer;    overload;
    function mUpdateRecord(aPanel:TPanel;uTableName:String):integer;    overload;
   function mInsertRecord(dbCntrls: array of TDBControl):integer;  overload;
   function mInsertRecord(aPanel:TPanel):integer;    overload;
   function mInsertRecord(aPanel: TPanel; aTableName:String): integer;overload;

   function  mGetSqlStr(aPanel: TPanel): String;

   function  mGetLoginUser: TLoginUser;
   function  mDBProvide: IDBProvideInterface;

    procedure mSetUserAuth(aUserId: String; aForm: TDBFormBase);
    function mHaveAppAuth(authString: String): Boolean;
    function mHaveModuleAuth(authString: String): Boolean;
    function mGetGuid: String;
    procedure mSetDbControlDefaultValue(controlName, strValue: string);
    function mDBControl(uMaskCntlName: String): TDBControl;

    procedure  mCleanPanel(panel1:TPanel);
  end;

var
  DBFormBaseEx: TDBFormBaseEx;

implementation
uses

ActiveX;
{$R *.dfm}

{ TDBFormBaseEx }





{ TDBFormBaseEx }



procedure TDBFormBaseEx.mRegistCntrl(aPanel: TPanel; aTableName: String);
begin
     RegistCntrls(self,aPanel,aTablename,self.getAppId);
end;

function TDBFormBaseEx.mDBProvide: IDBProvideInterface;
begin
    result :=structbase.Applications.find(self.getAppId).DBProvide;
end;

procedure TDBFormBaseEx.mDisplayRecord(uCDS: TClientDataSet;
  dbCntrls: array of TDBControl);
begin
  DisplayRecord(ucds,dbcntrls);
end;

procedure TDBFormBaseEx.mRegistCntrl(regMaskeditList: TStringList;
  aTableName: String);
begin
   RegistCntrls(self,regMaskeditList,aTablename,self.getAppId);
end;

procedure TDBFormBaseEx.mCleanPanel(panel1: TPanel);
begin
    cleanPanel(panel1);
end;

procedure TDBFormBaseEx.mCloseInputProxy(aControl: TMaskEdit);
begin
      CloseInputProxy(aControl);
end;

procedure TDBFormBaseEx.mDisplayRecord(aPanel: TPanel; whereSql: string);
begin
   DisplayRecord( self,aPanel, whereSql);
end;

function TDBFormBaseEx.mGetLoginUser: TLoginUser;
begin
   result:=StructBase.LoginUser;
end;

function TDBFormBaseEx.mGetSqlStr(aPanel: TPanel): String;
var aryCntl:TDBControlArray;
begin
    aryCntl:= _GetDBControlArrayFromPanel(self,apanel);
    result:=_GetSqlStr(aryCntl);
end;

function TDBFormBaseEx.mInsertRecord(dbCntrls: array of TDBControl): integer;
begin
     result :=_insertRecord(dbCntrls);
end;

function TDBFormBaseEx.mInsertRecord(aPanel: TPanel): integer;
var aryCntl:TDBControlArray;
begin
    aryCntl:= _GetDBControlArrayFromPanel(self,apanel);
    result :=_insertRecord(aryCntl);
end;

function TDBFormBaseEx.mInsertRecord(aPanel: TPanel;aTableName:String): integer;
var aryCntl:TDBControlArray;
begin
    aryCntl:= _GetDBControlArrayFromPanel(self,apanel);
    result :=_insertRecord(aryCntl);
end;

procedure TDBFormBaseEx.mOpenInputProxy(aPanel: TPanel);
begin
     OpenInputProxy(self, aPanel,structbase.CntlDataInput);
end;

procedure TDBFormBaseEx.mOpenInputProxy(aControl: TMaskEdit);
begin
     OpenInputProxy(self, aControl,structbase.CntlDataInput);
end;

procedure TDBFormBaseEx.mOpenInputProxy(aControl: TMaskEdit;
  dataInputCntl: TCustomForm);
begin
     OpenInputProxy(self, aControl,dataInputCntl);
end;

procedure TDBFormBaseEx.mOpenInputProxy(aPanel: TPanel;
  dataInputCntl: TCustomForm);
begin
     OpenInputProxy(self, aPanel,dataInputCntl);
end;

procedure TDBFormBaseEx.mRegistCntrl(aControl: TMaskEdit; aTableName,
  aAppName: string);
begin
    registCntrl(self,aControl,atablename,self.getAppId);
end;

procedure TDBFormBaseEx.mUnRegistCntrl( aControl: TMaskEdit );
begin
     unRegistCntrl(self,aControl);
end;



function TDBFormBaseEx.mUpdateRecord(aPanel: TPanel;
  uTableName: String): integer;
begin
  result:=self.mUpdateRecord(apanel);
end;

function TDBFormBaseEx.mUpdateRecord(dbCntrls: array of TDBControl): integer;
begin
  result:=_UpdateRecord(dbCntrls);
end;

function TDBFormBaseEx.mUpdateRecord(aPanel: TPanel): integer;
var i:integer;
var aryCntl:TDBControlArray;
var myObject:Tmaskedit;
begin
    aryCntl:= _GetDBControlArrayFromPanel(self,apanel);

    result:=_UpdateRecord(aryCntl);

end;


procedure  TDBFormBaseEx.mCloseInputProxy(aPanel: TPanel);
var i:integer;
begin
 for i := 0 to APanel.ControlCount - 1 do
    begin
      if APanel.Controls[i].ClassName = 'TMaskEdit' then
      begin
             CloseInputProxy(APanel.Controls[i] as Tmaskedit);
      end;
    end;
end;

procedure TDBFormBaseEx.mSetUserAuth(aUserId: String;aForm:TDBFormBase);
begin
   _setUserAuth(aUserId,self);
end;


function TDBFormBaseEx.mHaveAppAuth(authString: String): Boolean;
begin
   result:=_HaveAppAuth(authString);

end;

function TDBFormBaseEx.mHaveModuleAuth(authString: String): Boolean;
begin
      result:=mHaveModuleAuth(authString);
end;


function TDBFormBaseEx.mGetGuid: String;
 var
  I   : Integer;
  sGUID  : string;
  TmpGUID: TGUID;
begin
     if CoCreateGUID(TmpGUID) = S_OK then
      sGUID := GUIDToString(TmpGUID)
    else
      ShowMessage('Create GUID error!');
     Sguid:=replacestr(Sguid,'{','');
     Sguid:=replacestr(Sguid,'}','');
     Sguid:=replacestr(Sguid,'-','');
     result:=sguid;
end;

procedure TDBFormBaseEx.mSetDbControlDefaultValue
  (controlName, strValue: string);
begin
    with dbcontrols.find(controlName) do
    begin
          dicCodeValue:=strValue;
    end;

end;


function TDBFormBaseEx.mDBControl(uMaskCntlName:String):TDBControl;
 begin
   result:=dbcontrols.find(uMaskCntlName);
 end;


procedure TDBFormBaseEx.mDisplayRecord(aPanel: TPanel; uCDS: TClientDataSet);
var i:integer;
var aryCntl:TDBControlArray;
var myObject:Tmaskedit;
begin
    aryCntl:= _GetDBControlArrayFromPanel(self,apanel);
    displayRecord(ucds,aryCntl);
end;


procedure TDBFormBaseEx.mTranslateGrid(AGrid: TcxGridDBTableView;
  aTableName: String);
var
  i, j: integer;
var
  fieldName,fieldTypes, fieldNames, displayNames, dicID: String;
  // var dicCDS:array of TClientDataSet;
var
  uDiccds, uTableDefine: TClientDataSet;
var
  ACDS: TDataSet;
var
  aDBControl: TDbControl;
var
  idx : integer;
var
  T: TStringField;
var
  tmpField: array of TField;
var listDisplayName,listFieldName:TStringList;
var
  strDicId, strDicKey, strDicValue: String;

begin
  with Structbase.Applications.find(self.getAppId).MetaSource do
  begin
     uTableDefine := getTableDefineCDS(self.getAppId, aTableName);
  end;

  ACDS := AGrid.DataController.DataSet;
  aTableName := uppercase(aTableName);

  setlength(tmpField, acds.FieldDefs.count);

  listFieldName:=TStringList.Create;
  listDisplayName:=TStringList.Create;
  for i := 0 to   acds.FieldDefs.count - 1 do
  begin
      if acds.FieldList.IndexOf(ACDS.FieldDefs[i].Name)>=0  then
      begin
          displayNames := displayNames + ACDS.FieldByName(ACDS.FieldDefs[i].Name)
              .DisplayLabel + ',';
          fieldNames := fieldNames+ ACDS.FieldDefs[i].Name + ',';
      end;
  end;
  listDisplayName.CommaText := displayNames;
  listFieldName.CommaText:= fieldNames;


  acds.close;
  acds.Fields.Clear;
  for i := 0 to  acds.FieldDefs.count - 1 do
  begin
   fieldName :=acds.FieldDefs[i].DisplayName;

   tmpField[i]:=acds.FieldDefs[i].CreateField(ACDS,nil,fieldName ) ;
   if i< listDisplayName.Count-1 then
        tmpField[i].DisplayLabel:= listDisplayName[listFieldName.IndexOf(fieldName)];

   uTableDefine.First;
   uTableDefine.filtered := false;
    if    uTableDefine.Locate('AppId;TableName;ColName', VarArrayOf
               ([self.getAppId, aTableName, fieldName]), [loCaseInsensitive,
               loCaseInsensitive, loCaseInsensitive])
    then
               strDicId := uTableDefine.FieldByName('dicId').AsString
    else
       strDicId:='';

    if (strDicId <> '') then
    begin
      with Structbase.Applications.find(self.getAppId).MetaSource do
      begin
        with getDicDefineCDS do
        begin
          First;
          filtered := false;
          Locate('dicid', VarArrayOf([strDicId]), [loCaseInsensitive]);
          strDicKey := FieldByName('dicKeyField').AsString;
          strDicValue := FieldByName('dicValField').AsString;
        end;
//        uDiccds := getDicCds(strDicId);
         uDiccds :=structbase.DicItems.find(strDicId).dicDataSet;
      end;

      T := TStringField.Create(ACDS);


   //  uDiccds :=  StructUtil.getApplication(self.getAppId).MetaSource.getDicCdsCopy(adbcontrol.dicMetaBase.dicId,self);
     T.LookupDataSet := uDiccds;
     T.Name := fieldName + '_DIC';
     T.fieldName := fieldName + '_DIC';
     T.DataSet := ACDS;
     T.FieldKind := fklookup;
     T.KeyFields := fieldName ;
     T.Size:=udiccds.FieldByName(strDicValue).Size;
     T.LookupKeyFields := strDicKey;
     T.LookupResultField := strDicValue;
     T.Lookup := true;
     if i< listDisplayName.Count-1 then
         T.DisplayLabel:=listDisplayName[i];

     for j := 0 to AGrid.ColumnCount - 1 do
     begin
        if AGrid.Columns[j].DataBinding.fieldName = fieldName then
        begin
           AGrid.Columns[j].DataBinding.fieldName := T.fieldName;
           AGrid.Columns[j].Caption := T.DisplayLabel;
        end;
      end;

    end;
    aDBControl.Free;
  end;

  ACDS.Open;
  listDisplayName.Free;
  listFieldName.Free;
end;


end.
