unit CommonBpl_DBFormBaseEx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  Mask,
  strUtils,
  extctrls,
  DBClient,
  DBpl_IDBProvide,
  Struct_LoginUser,
  uStructbaseFrameWork,
  CommonBpl_DBFormBase,
  CommonBpl_BaseType,
  Struct_BaseForm_Function,
  Struct_BaseForm_FunctionEx;

type
  TDBFormBaseEx = class(TDBFormBase)
  private


    { Private declarations }



  public
    { Public declarations }

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
uses ActiveX;
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

end.
