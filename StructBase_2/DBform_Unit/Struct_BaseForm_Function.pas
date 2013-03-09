unit Struct_BaseForm_Function;

interface

uses
  DB,
  Controls,
  variants,
  cxGridDBTableView ,
  commonBpl_PublicFun,
  uStructbaseFrameWork,
  DBpl_IDBProvide,
  CommonBpl_BaseType,
  CommonBpl_DBFormBase,
  strUtils,
  sysUtils,
  DBClient,
  classes,
  Forms,
  extCtrls,
  Mask;

Const
  Auth_App_Prefix = 'APP_';
  Auth_Moudle_Prefix = 'MOD_';
  Auth_Function_Prefix = 'FUN_';

Type
  TDBControlArray = array of TDBControl;

procedure _RegistCntrl(aForm: TDBFormBase; aControl: TMaskEdit;
  aTableName, aAppName: string);
procedure _unRegistCntrl(aForm: TDBFormBase; aControl: TMaskEdit);

procedure _DisplayRecord(uCDS: TClientDataSet; dbCntrls: array of TDBControl);
function _UpdateRecord(dbCntrls: array of TDBControl): integer;
function _InsertRecord(dbCntrls: array of TDBControl): integer;

function _GetSqlStr(dbCntrls: array of TDBControl): String;

procedure _OpenCtrlInputProxy(aForm: TDBFormBase; aControl: TMaskEdit;
  dataInputCntl: TObject);
procedure _CloseInputProxy(aControl: TMaskEdit);

function AnalyseDataStr(ucntl: TDBControl): String;

function _GetDBControlArrayFromPanel(aForm: TDBFormBase; aPanel: TPanel)
  : TDBControlArray;

procedure _SetUserAuth(aUserId: String; aForm: TDBFormBase);
function _HaveModuleAuth(authString: String): Boolean;
function _HaveAppAuth(authString: String): Boolean;

procedure _TranslateGrid( aForm: TDBFormBase;AGrid: TcxGridDBTableView;
  aTableName: String);
implementation

uses
  Dialogs,
  Struct_CntlDataInput,
  Struct_DicBaseItem;

procedure _RegistCntrl(aForm: TDBFormBase; aControl: TMaskEdit;
  aTableName, aAppName: string);
var
  i: integer;
var
  uName: String;
var
  dbCntrl: TDBControl;
begin
  uName := aControl.Name;
  if aForm.dbControls.find(uName) = nil then
  begin
    dbCntrl := aForm.dbControls.AddNew(aControl, aAppName, aTableName);
  end;
end;

procedure _unRegistCntrl(aForm: TDBFormBase; aControl: TMaskEdit);
var
  i: integer;
var
  uName: String;
var
  dbCntrl: TDBControl;
begin
  uName := aControl.Name;
  if aForm.dbControls.find(uName) <> nil then
  begin
    aForm.dbControls.RemoveDbControl(uName);
  end;

end;

procedure _DisplayRecord(uCDS: TClientDataSet; dbCntrls: array of TDBControl);
var
  i, j: integer;
var
  ucntl: TDBControl;
begin
  for i := 0 to length(dbCntrls) - 1 do
  begin
    ucntl := dbCntrls[i];
    ucntl.cntlObjct.Text := uCDS.fieldbyname(ucntl.fieldname).AsString;
    ucntl.originalValue := ucntl.cntlObjct.Text; // 保存原始值
    // 日期型字符
    if ucntl.fieldMetaBase.fieldType = 'D' then
      if ucntl.cntlObjct.Text = '' then
        ucntl.cntlObjct.EditMask := '!9999-99-99 99:99:99;0;_'
      else
        ucntl.cntlObjct.EditMask := '';
    // 字典数据
    if ucntl.fieldMetaBase.dicId <> '' then
    begin
      ucntl.realValue := ucntl.cntlObjct.Text; // 保存字典原值
      ucntl.cntlObjct.Text := ucntl.dicMetaBase.translateDicValue
        (ucntl.realValue);
    end;

  end;
end;

procedure _OpenCtrlInputProxy(aForm: TDBFormBase; aControl: TMaskEdit;
  dataInputCntl: TObject);
var
  dataInput: TStruct_CntlDataInput;
begin
  if dataInputCntl = nil then
    dataInputCntl := structbase.CntlDataInput;
  if dataInputCntl.ClassName = 'TStruct_CntlDataInput' then
  begin
    if aForm.dbControls.find(aControl.name).fieldMetaBase.dicId <> '' then
      aControl.OnEnter := aForm.DBCntlOnEnterListener;
  end;

  if dataInputCntl <> nil then
  begin
    // 此处增加其它字典输入代理的代码
  end;
end;

procedure _CloseInputProxy(aControl: TMaskEdit);
begin
  aControl.OnEnter := nil;
end;

function _UpdateRecord(dbCntrls: array of TDBControl): integer;
var
  aTableName, uAppName, strTmp, strSql, strWhere: String;
var
  dbprovide: IDBProvideInterface;
var
  i: integer;
var
  ucntl: TDBControl;
begin
  try
    uAppName := dbCntrls[0].appName;
    dbprovide := structbase.Applications.find(uAppName).dbprovide;
    aTableName := dbCntrls[0].tablename;
    // dbprovide:=self.getApplication(uappname).DBProvide;
    // dbprovide.SelectCommand(cds,usql,0);
    strSql := ' update ' + aTableName + ' set ';
    for i := 0 to length(dbCntrls) - 1 do
    begin
      ucntl := dbCntrls[i];
      // ucntl.cntlObjct.Text:=cds.fieldbyname(ucntl.fieldname).AsString;
      // ucntl.originalValue:=ucntl.cntlObjct.Text; //保存原始值
      // 日期型字符
      if ucntl.fieldMetaBase.fieldPkFlag = 'Y' then
      begin
        strWhere := ' where ' + ucntl.fieldname + '=''' +
          ucntl.cntlObjct.Text + '''';
      end;
      if (ucntl.fieldMetaBase.fieldType = 'D') then
      begin
        strSql := strSql + ucntl.fieldname + '=''' + FormatDateStr
          (ucntl.cntlObjct.Text) + '''';
      end;

      if (ucntl.fieldMetaBase.fieldType = 'C') then
      begin
        strSql := strSql + ucntl.fieldname + '=''' + ucntl.cntlObjct.Text +
          '''';
      end;

      if ucntl.fieldMetaBase.fieldType = 'N' then
      begin
        strSql := strSql + ucntl.fieldname + '=' + ucntl.cntlObjct.Text + '';
      end;
      // 字典数据
      if (ucntl.fieldMetaBase.dicId <> '') or
        (ucntl.fieldMetaBase.fieldType = 'M') then
      begin
        strSql := strSql + ucntl.fieldname + '=''' + ucntl.realValue + '''';
      end;
      if i <> length(dbCntrls) - 1 then
        strSql := strSql + ',';
    end;
    strSql := strSql + strWhere;

  finally
    result := dbprovide.ExecuteSql(strSql);
  end;

end;

function _InsertRecord(dbCntrls: array of TDBControl): integer;
var
  uAppName, strTmp, strSql, strSql1, strSql2, aTableName: String;
var
  dbprovide: IDBProvideInterface;

var
  i: integer;
var
  ucntl: TDBControl;
begin
  try
    uAppName := dbCntrls[0].appName;
    dbprovide := structbase.Applications.find(uAppName).dbprovide;
    aTableName := dbCntrls[0].tablename;

    strSql := ' insert into ' + aTableName;
    for i := 0 to length(dbCntrls) - 1 do
    begin
      ucntl := dbCntrls[i];
      // ucntl.cntlObjct.Text:=cds.fieldbyname(ucntl.fieldname).AsString;
      // ucntl.originalValue:=ucntl.cntlObjct.Text; //保存原始值
      strSql1 := strSql1 + ucntl.fieldname;
      // 日期型字符

      if (ucntl.fieldMetaBase.fieldType = 'D') or
        (ucntl.fieldMetaBase.fieldType = 'C') then
      begin

        if ucntl.fieldMetaBase.fieldPkFlag = 'Y' then
        begin
          if ucntl.cntlObjct.Text <> '' then
          begin
            {
              showmessage('唯一关键字MASKEDIT值不为空,请检查!');
              exit;
              }
            strSql2 := strSql2 + '''' + ucntl.cntlObjct.Text + '''';
          end
          else
            strSql2 := strSql2 + 'sys_guid()';
        end
        else
          strSql2 := strSql2 + '''' + ucntl.cntlObjct.Text + '''';

      end;
      if ucntl.fieldMetaBase.fieldType = 'N' then
      begin
        strSql2 := strSql2 + ucntl.cntlObjct.Text;
      end;
      // 字典数据
      if (ucntl.fieldMetaBase.dicId <> '') or
        (ucntl.fieldMetaBase.fieldType = 'M') then
      begin
        strSql2 := strSql2 + '''' + ucntl.realValue + '''';
      end;
      if i <> length(dbCntrls) then
      begin
        strSql2 := strSql2 + ',';
        strSql1 := strSql1 + ',';
      end;
    end;
    strSql := strSql + '(' + strSql1 + ')  values (' + strSql2 + ')';

  finally
    result := dbprovide.ExecuteSql(strSql);
  end;

end;

function _GetSqlStr(dbCntrls: array of TDBControl): String;
var
  uAppName, strTmp: String;
var
  dbprovide: IDBProvideInterface;

var
  i: integer;
var
  ucntl: TDBControl;
var
  strField, strValue, strWhere, strTableName, aTableName: String;
begin
  try
    uAppName := dbCntrls[0].appName;
    dbprovide := structbase.Applications.find(uAppName).dbprovide;
    aTableName := dbCntrls[0].tablename;

    for i := 0 to length(dbCntrls) - 1 do
    begin
      ucntl := dbCntrls[i] as TDBControl;
      strTableName := ucntl.tablename;
      if ucntl.dicMetaBase.dicId <> '' then
        strValue := ucntl.realValue
      else
        strValue := ucntl.cntlObjct.Text;

      strField := ucntl.fieldname;
      if pos('%', strValue) > 0 then
        strTmp := strField + ' like ' + QuotedStr(strValue)
      else if ucntl.fieldMetaBase.fieldType = 'N' then
        strTmp := strField + ' = ' + strValue
      else if ucntl.fieldMetaBase.fieldType = 'D' then
        strTmp := AnalyseDataStr(ucntl)
      else if strValue <> '' then
        strTmp := strField + ' = ' + QuotedStr(strValue);

      if i = 0 then
        strWhere := ' where ' + strTmp
      else if strTmp <> '' then
        if strWhere = ' where ' then
          strWhere := strWhere + strTmp
        else
          strWhere := strWhere + ' and ' + strTmp;
      strTmp := '';
    end;
    if strWhere = ' where ' then
      strWhere := '';
    strWhere := 'select * from ' + strTableName + strWhere;
  finally
    result := strWhere;
  end;
end;

function AnalyseDataStr(ucntl: TDBControl): String;
var
  strBegin, strEnd, strValue, strField: String;
begin
  strField := ucntl.fieldname;
  strValue := ucntl.cntlObjct.Text;
  if pos('-', strValue) > 0 then
  begin
    strBegin := leftstr(strValue, length(strValue) - pos('-', strValue));

    strEnd := rightstr(strValue, pos('-', strValue) - 1);

    strValue := strField + '>=' + QuotedStr(strBegin);
    strValue := strValue + ' and ' + strField + '<=' + QuotedStr(strEnd);
    result := strValue;
  end
  else
    result := strField + '=' + ucntl.cntlObjct.Text;
end;

function _GetDBControlArrayFromPanel(aForm: TDBFormBase; aPanel: TPanel)
  : TDBControlArray;
var
  i: integer;
var
  aryCntl: array of TDBControl;
var
  myObject: TMaskEdit;
begin
  for i := 0 to aPanel.ControlCount - 1 do
  begin
    if aPanel.Controls[i].ClassName = 'TMaskEdit' then
    begin
      myObject := aPanel.Controls[i] as TMaskEdit;
      setLength(aryCntl, length(aryCntl) + 1);
      aryCntl[length(aryCntl) - 1] := aForm.dbControls.find(myObject.name);
    end;
  end;
  result:=TDBControlArray(aryCntl);
end;

procedure _SetUserAuth(aUserId: String; aForm: TDBFormBase);
var
  sql, authid: string;
  cdsAuth: TClientDataSet;
begin
  try
    cdsAuth := TClientDataSet.Create(nil);

    sql := 'select * from  GROUP_AUTHORITY a ';
    sql := sql + ' where a.GROUP_id=''10000'' or exists ';
    sql := sql +
      ' ( select * from  group_user b where b.user_id=%s and a.group_id=b.group_id) ';
    sql := format(sql, [QuotedStr(aUserId)]);

    with    structbase.Applications.find(aform.getAppId).MetaSource.dbProvide  do
    begin
           SelectCommand(cdsAuth, sql, 0);
    end;

    cdsAuth.First;
    repeat
      Forms.Application.ProcessMessages;
      authid := uppercase(cdsAuth.fieldbyname('Auth_id').AsString);
       structbase.UserAuthList.Add(authid);

      cdsAuth.Next;
    until cdsAuth.eof;
  finally
    cdsAuth.Free;
  end;

end;


function _HaveAppAuth(authString: String): Boolean;
var i:integer;
begin
   {$IFNDEF NDEBUG}
       for i := 0 to uUserAuthList.Count - 1 do
            cndebugger.TraceMsg(uUserAuthList.Strings[i]);
            cndebugger.TraceMsg(authString);
   {$ENDIF}
  if structbase.UserAuthList.IndexOf(uppercase(authString)) > -1 then
    result := true
  else
    result := false;
end;

function _HaveModuleAuth(authString: String): Boolean;
begin
 {$IFNDEF NDEBUG}
    if  structbase.UserAuthList.IndexOf(Auth_Moudle_Prefix+uppercase(authString)) > -1 then
      result := true
  else
       result := false;
 {$ENDIF}
end;



procedure _TranslateGrid( aForm: TDBFormBase;AGrid: TcxGridDBTableView;
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
  with structbase.Applications.find(aForm.getAppid).MetaSource do
  begin
    uTableDefine := getTableDefineCDS(aForm.getAppid, aTableName);
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
               ([aForm.getAppId, aTableName, fieldName]), [loCaseInsensitive,
               loCaseInsensitive, loCaseInsensitive])
    then
               strDicId := uTableDefine.FieldByName('dicId').AsString
    else
       strDicId:='';

    if (strDicId <> '') then
    begin
      with structbase.Applications.find(aForm.getAppid).MetaSource  do
      begin
        with getDicDefineCDS do
        begin
          First;
          filtered := false;
          Locate('dicid', VarArrayOf([strDicId]), [loCaseInsensitive]);
          strDicKey := FieldByName('dicKeyField').AsString;
          strDicValue := FieldByName('dicValField').AsString;
        end;
         uDiccds :=structbase.DicItems.find(strDicId).dicCloneCursorDataSet;
       // uDiccds := getDicCds(strDicId);
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
