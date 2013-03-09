unit Struct_BaseForm_FunctionEx;

interface

uses
  Forms,
  DBClient,
  Struct_BaseForm_Function,
  CommonBpl_DBFormBase,
  CommonBpl_BaseType,
  classes,
  extCtrls,
  Mask;

procedure RegistCntrls(aForm: TDBFormBase; cntrlList: TStringList;
  aTableName, aAppName: string); overload;
procedure RegistCntrls(aForm: TDBFormBase; APanel: TPanel;
  aTableName, aAppName: string); overload;
procedure RegistCntrl(aForm: TDBFormBase; aControl: TMaskEdit;
  aTableName, aAppName: string); overload;

procedure UnRegistCntrl(aForm: TDBFormBase; aControl: TMaskEdit);

procedure DisplayRecord(uCDS: TClientDataSet; dbCntrls: array of TDBControl);
  overload;
procedure DisplayRecord(aForm: TDBFormBase; cntrlList: TStringList;
  whereSql: string); overload;
procedure DisplayRecord(aForm: TDBFormBase; cntrlList: TStringList;
  ACDS: TClientDataSet); overload;
procedure DisplayRecord(aForm: TDBFormBase; APanel: TPanel; whereSql: string);
  overload;
procedure DisplayRecord(aForm: TDBFormBase; APanel: TPanel;
  ACDS: TClientDataSet);overload


function buildSelectSql(aForm: TDBFormBase; cntrlList: TStringList): String;
overload;
function buildSelectSql(aForm: TDBFormBase; APanel: TPanel): String; overload;

procedure  OpenInputProxy(aForm: TDBFormBase; aControl: TMaskEdit;
  dataInputCntl: TObject);     overload


 procedure  OpenInputProxy(aForm: TDBFormBase;aPanel:TPanel;
  dataInputCntl: TObject);      overload


procedure  CloseInputProxy(aControl: TMaskEdit); overload;
procedure  CloseInputProxy(aPanel: TPanel);overload;

procedure  CleanPanel( APanel: TPanel);

implementation

procedure RegistCntrl(aForm: TDBFormBase; aControl: TMaskEdit;
  aTableName, aAppName: string);
begin
  _RegistCntrl(aForm, aControl, aTableName, aAppName);
end;

procedure RegistCntrls(aForm: TDBFormBase; cntrlList: TStringList;
  aTableName, aAppName: string);
var
  i, j, idx: integer;
var
  haveRec: Boolean;
var
  strSql, strTmp: String;
var
  myObject: TObject;
var
  uCntrlMapItem: TCntrlMapItem;
begin
  for i := 0 to cntrlList.count - 1 do
  begin
    myObject := cntrlList.Objects[i];
    if myObject.ClassName = 'TMaskEdit' then
    begin
      _RegistCntrl(aForm, myObject as TMaskEdit, aTableName, aAppName);
    end;

  end;
end;

procedure RegistCntrls(aForm: TDBFormBase; APanel: TPanel;
  aTableName, aAppName: string);
var
  i: integer;
begin
  for i := 0 to APanel.ControlCount - 1 do
  begin
    if APanel.Controls[i].ClassName = 'TMaskEdit' then
    begin
      with (APanel.Controls[i] as TMaskEdit) do
      begin
        _RegistCntrl(aForm, APanel.Controls[i] as TMaskEdit, aTableName,
          aAppName);
      end;
    end;
  end;
end;

function buildSelectSql(aForm: TDBFormBase; cntrlList: TStringList): String;
var
  strSql, strTmp, tablename: String;
var
  i: integer;
var
  myObject: TObject;
begin
  if cntrlList = nil then
    exit;

  myObject := (cntrlList.Objects[0] as TMaskEdit);
  strTmp := (myObject as TMaskEdit).Name;

  tablename := aForm.dbControls.find(strTmp).tablename;
  strSql := ' ';
  for i := 0 to cntrlList.count - 1 do
  begin
    myObject := cntrlList.Objects[i];
    if myObject.ClassName = 'TMaskEdit' then
    begin
      strTmp := (myObject as TMaskEdit).Name;
      strTmp := copy(strTmp, 4, length(strTmp) - 3);
      strSql := strSql + strTmp + ',';
    end;
  end;
  strSql := copy(strSql, 1, length(strSql) - 1);
  strSql := 'select ' + strSql + ' from ' + tablename;

  result := strSql;
end;

function buildSelectSql(aForm: TDBFormBase; APanel: TPanel): String;
var
  strSql, strTmp, tablename: String;
var
  i: integer;
var
  myObject: TObject;
begin
  strSql := ' ';
  for i := 0 to APanel.ControlCount - 1 do
  begin
    myObject := APanel.Controls[i];
    if myObject.ClassName = 'TMaskEdit' then
    begin
      myObject := (APanel.Controls[i] as TMaskEdit);
      strTmp := (myObject as TMaskEdit).Name;
      tablename := aForm.dbControls.find(strTmp).tablename;

      strTmp := copy(strTmp, 4, length(strTmp) - 3);
      strSql := strSql + strTmp + ',';
    end;
  end;
  strSql := copy(strSql, 1, length(strSql) - 1);
  strSql := 'select ' + strSql + ' from ' + tablename;

  result := strSql;

end;

procedure DisplayRecord(uCDS: TClientDataSet; dbCntrls: array of TDBControl);
begin
  _DisplayRecord(uCDS, dbCntrls);
end;

procedure UnRegistCntrl(aForm: TDBFormBase; aControl: TMaskEdit);
begin
  _UnRegistCntrl(aForm, aControl);
end;

procedure DisplayRecord(aForm: TDBFormBase; APanel: TPanel;
  ACDS: TClientDataSet);
var
  strSql, strTmp: String;
var
  i, j: integer;
var
  myObject: TMaskEdit;
var
  aryCntl: array of TDBControl;
begin
  for i := 0 to APanel.ControlCount - 1 do
  begin
    if APanel.Controls[i].ClassName = 'TMaskEdit' then
    begin
      myObject := APanel.Controls[i] as TMaskEdit;
      with myObject do
      begin
        strTmp := Name;
        setLength(aryCntl, length(aryCntl) + 1);
        aryCntl[length(aryCntl) - 1] := aForm.dbControls.find(myObject.name);
      end;
    end;
  end;
  _DisplayRecord(ACDS, aryCntl);
end;

procedure DisplayRecord(aForm: TDBFormBase; cntrlList: TStringList;
  ACDS: TClientDataSet); overload;
var
  strSql, strTmp: String;
var
  i, j: integer;
var
  myObject: TMaskEdit;
var
  aryCntl: array of TDBControl;
begin
  for i := 0 to cntrlList.count - 1 do
  begin
    myObject := (cntrlList.Objects[i] as TMaskEdit);
    with myObject do
    begin
      strTmp := Name;
      setLength(aryCntl, length(aryCntl) + 1);
      aryCntl[length(aryCntl) - 1] := aForm.dbControls.find(myObject.name);
    end;
  end;
  _DisplayRecord(ACDS, aryCntl);
end;

procedure DisplayRecord(aForm: TDBFormBase; cntrlList: TStringList;
  whereSql: string); overload;
var
  strSql, strTmp: String;
var
  i, j: integer;
var
  myObject: TMaskEdit;
var
  aryCntl: array of TDBControl;
var
  tmpCDS: TClientDataSet;
begin
  strSql := buildSelectSql(aForm, cntrlList) + ' ' + whereSql;
  tmpCDS := TClientDataSet.Create(nil);
  aForm.mDbProvide.SelectCommand(tmpCDS, strSql, 0);

  for i := 0 to cntrlList.count - 1 do
  begin
    myObject := (cntrlList.Objects[i] as TMaskEdit);
    with myObject do
    begin
      strTmp := Name;
      setLength(aryCntl, length(aryCntl) + 1);
      aryCntl[length(aryCntl) - 1] := aForm.dbControls.find(myObject.name);
    end;
  end;
  _DisplayRecord(tmpCDS, aryCntl);
  tmpCDS.Free;
end;

procedure DisplayRecord(aForm: TDBFormBase; APanel: TPanel; whereSql: string);
var
  strSql, strTmp: String;
var
  i, j: integer;
var
  myObject: TMaskEdit;
var
  aryCntl: array of TDBControl;
var
  tmpCDS: TClientDataSet;
begin
  try
    strSql := buildSelectSql(aForm, APanel) + ' ' + whereSql;
    tmpCDS := TClientDataSet.Create(nil);
    aForm.mDbProvide.SelectCommand(tmpCDS, strSql, 0);

    for i := 0 to APanel.ControlCount - 1 do
    begin
      if APanel.Controls[i].ClassName = 'TMaskEdit' then
      begin
        myObject := (APanel.Controls[i] as TMaskEdit);
        with myObject do
        begin
          strTmp := Name;
          setLength(aryCntl, length(aryCntl) + 1);
          aryCntl[length(aryCntl) - 1] := aForm.dbControls.find(myObject.name);
        end;
      end;

    end;
    _DisplayRecord(tmpCDS, aryCntl);
  finally
    tmpCDS.Free;
  end;

end;

procedure  OpenInputProxy(aForm: TDBFormBase; aControl: TMaskEdit;
      dataInputCntl: TObject);
begin
   _OpenCtrlInputProxy(aForm, aControl,dataInputCntl) ;
end;

procedure  OpenInputProxy(aForm: TDBFormBase;aPanel:TPanel;dataInputCntl: TObject);
var i:integer;
var myObject:TMaskedit;
begin
   for i := 0 to APanel.ControlCount - 1 do
    begin
      if APanel.Controls[i].ClassName = 'TMaskEdit' then
      begin
        myObject := (APanel.Controls[i] as TMaskEdit);
        with myObject do
        begin
            _OpenCtrlInputProxy(aForm, myObject,dataInputCntl) ;
        end;
      end;

    end;
end;


procedure  CloseInputProxy(aControl: TMaskEdit);
begin
  _CloseInputProxy(aControl);
end;

procedure  CloseInputProxy(aPanel: TPanel);
var i:integer;
begin
 for i := 0 to APanel.ControlCount - 1 do
    begin
      if APanel.Controls[i].ClassName = 'TMaskEdit' then
      begin
             _CloseInputProxy(APanel.Controls[i] as TMaskedit);
      end;
    end;
end;


procedure  CleanPanel( APanel: TPanel);
var
  i: integer;
begin
  for i := 0 to APanel.ControlCount - 1 do
  begin
    if APanel.Controls[i].ClassName = 'TMaskEdit' then
    begin
      with (APanel.Controls[i] as TMaskEdit) do
       text:='';
      end;
    end;
  end;


end.
