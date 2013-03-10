{
  代码引擎模版
  Written by SkyJacker
  2007-03-01 09:48:58
}

unit uAPP_NAME_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ExtCtrls,fBaseForm,Mask, DB;

type actionType=(fAddNew,fUpdate,fDelete,fDisplay);

type
  TAPP_NAME_Form = class(TBaseForm)
    btnClose: TButton;
    btnSave:  TButton;
    Panel1: TPanel;
    
    lbl1: TStaticText;
    edtAPPID: TMaskEdit;
    lbl2: TStaticText;
    edtAPPNAME: TMaskEdit;
    lbl3: TStaticText;
    edtDATASOURCE: TMaskEdit;
    lbl4: TStaticText;
    edtDB_SCHEMA: TMaskEdit;
    lbl5: TStaticText;
    edtMETA_DATASOURCE: TMaskEdit;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure bttModifyClick(Sender: TObject);
    procedure btnAddNewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    
  private
    { Private declarations }
     
     fActionType:actionType;
     fPkFieldValue:String;
     
    
    
     procedure setActionType(ftype:actionType);
  public
    { Public declarations }
    
    
     property   actionType: actionType read factionType write setActionType;
     property   pkFieldValue: String read fPkFieldValue write fPkFieldValue;
  end;

var
  APP_NAME_Form: TAPP_NAME_Form;

implementation
  

{$R *.dfm}



procedure TAPP_NAME_Form.FormCreate(Sender: TObject);
begin
  mRegistCntrl(panel1,'APP_NAME') 
end;

procedure TAPP_NAME_Form.FormDestroy(Sender: TObject);
begin
  //
end;

procedure TAPP_NAME_Form.FormShow(Sender: TObject);
begin
  //
end;

procedure TAPP_NAME_Form.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TAPP_NAME_Form.setActionType(ftype: ActionType);
var whereSql:String;
begin
   fActionType:=ftype;
   if ftype=fAddNew then
   begin
       self.mCleanPanel(panel1);
       self.mOpenInputProxy(panel1);
       btnSave.visible:=True;
       panel1.Enabled :=True;
   end;

   if ftype=fUpdate then
   begin
       edtAPPID.readonly:=True;
       self.mOpenInputProxy(panel1);
       whereSql:=' where APPID ='+ sysutils.QuotedStr(fPkFieldValue);
       mDisplayRecord(panel1,wheresql);
       btnSave.visible:=True;
       panel1.Enabled :=True;
   end;

   if ftype=fDelete then
   begin

   end;

   if ftype=fDisplay then
   begin
       edtAPPID.readonly:=True;
       whereSql:=' where APPID ='+ sysutils.QuotedStr(fPkFieldValue);
       mDisplayRecord(panel1,wheresql);
        self.mCloseInputProxy(panel1);
       btnSave.visible:=False;
       panel1.Enabled :=True;
   end;


end;

procedure TAPP_NAME_Form.btnSaveClick(Sender: TObject);
var i:integer;
begin
   if fActionType=fAddNew then
      i:=mInsertRecord(panel1,'APP_NAME');

   
   if fActionType=fUpdate then
      i:= mUpdateRecord(panel1,'APP_NAME');

   if i=0 then 
   begin
          panel1.Enabled :=false;
          showmessage('保存成功!') 
   end else
         showmessage('保存失败!') ;
   
end;

procedure TAPP_NAME_Form.btnAddNewClick(Sender: TObject);
begin
    setActionType(fAddNew);
end;

procedure TAPP_NAME_Form.bttModifyClick(Sender: TObject);
begin
    setActionType(fUpdate);
end;



end.
