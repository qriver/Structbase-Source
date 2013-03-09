{
  代码引擎模版
  Written by SkyJacker
  2007-03-01 09:48:58
}

unit <#UnitName>;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ExtCtrls,fBaseForm<#AddUseGlobal>;

type actionType=(fAddNew,fUpdate,fDelete,fDisplay);

type
  <#TFormName> = class(TBaseForm)
    btnClose: TButton;
    btnSave:  TButton;
    Panel1: TPanel;
    <#AddControl>
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure bttModifyClick(Sender: TObject);
    procedure btnAddNewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    <#AddFormFuncHead>
  private
    { Private declarations }
     
     fActionType:actionType;
     fPkFieldValue:String;
     
    <#AddPrivateData>
    <#AddPrivateFunc>
     procedure setActionType(ftype:actionType);
  public
    { Public declarations }
    <#AddPublicData>
    <#AddPublicFunc>
     property   actionType: actionType read factionType write setActionType;
     property   pkFieldValue: String read fPkFieldValue write fPkFieldValue;
  end;

var
  <#FormName>: <#TFormName>;

implementation
  <#AddUseLocal>

{$R *.dfm}

<#AddGlobalFunc>

procedure <#TFormName>.FormCreate(Sender: TObject);
begin
  mRegistCntrl(panel1,'<#TableName>') 
end;

procedure <#TFormName>.FormDestroy(Sender: TObject);
begin
  //
end;

procedure <#TFormName>.FormShow(Sender: TObject);
begin
  //
end;

procedure <#TFormName>.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure <#TFormName>.setActionType(ftype: ActionType);
var whereSql:String;
begin
   fActionType:=ftype;
   if ftype=fAddNew then
   begin
       self.mCleanPanel(panel1);
       btnSave.visible:=True;
   end;

   if ftype=fUpdate then
   begin
       edt<#PkFieldName>.readonly:=True;
       whereSql:=' where <#PkFieldName> ='+ sysutils.QuotedStr(fPkFieldValue);
       mDisplayRecord(panel1,wheresql);
       btnSave.visible:=True;
   end;

   if ftype=fDelete then
   begin

   end;

   if ftype=fDisplay then
   begin
       edt<#PkFieldName>.readonly:=True;
       whereSql:=' where <#PkFieldName> ='+ sysutils.QuotedStr(fPkFieldValue);
       mDisplayRecord(panel1,wheresql);
       btnSave.visible:=False;
   end;


end;

procedure <#TFormName>.btnSaveClick(Sender: TObject);
var i:integer;
begin
   if fActionType=fAddNew then
      i:=mInsertRecord(panel1,'<#TableName>');

   
   if fActionType=fUpdate then
      i:= mUpdateRecord(panel1,'<#TableName>');

   if i=0 then 
   begin
          panel1.Enabled :=false;
          showmessage('保存成功!') 
   end else
         showmessage('保存失败!') ;
   
end;

procedure <#TFormName>.btnAddNewClick(Sender: TObject);
begin
    setActionType(fAddNew);
end;

procedure <#TFormName>.bttModifyClick(Sender: TObject);
begin
    setActionType(fUpdate);
end;

<#AddFormFunc>

end.
