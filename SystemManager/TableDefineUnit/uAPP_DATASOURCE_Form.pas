{
  代码引擎模版
  Written by SkyJacker
  2007-03-01 09:48:58
}

unit uAPP_DATASOURCE_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ExtCtrls,fBaseForm,Mask, DB;

type actionType=(fAddNew,fUpdate,fDelete,fDisplay);

type
  TAPP_DATASOURCE_Form = class(TBaseForm)
    btnClose: TButton;
    btnSave:  TButton;
    Panel1: TPanel;
    
    lbl1: TStaticText;
    edtAUTOLOAD: TMaskEdit;
    lbl2: TStaticText;
    edtCONNECTIONSTR: TMaskEdit;
    lbl3: TStaticText;
    edtID: TMaskEdit;
    lbl4: TStaticText;
    edtSOURCE_CHINESE: TMaskEdit;
    lbl5: TStaticText;
    edtSOURCE_NAME: TMaskEdit;
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
  APP_DATASOURCE_Form: TAPP_DATASOURCE_Form;

implementation
  

{$R *.dfm}



procedure TAPP_DATASOURCE_Form.FormCreate(Sender: TObject);
begin
  mRegistCntrl(panel1,'APP_DATASOURCE') 
end;

procedure TAPP_DATASOURCE_Form.FormDestroy(Sender: TObject);
begin
  //
end;

procedure TAPP_DATASOURCE_Form.FormShow(Sender: TObject);
begin
  //
end;

procedure TAPP_DATASOURCE_Form.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TAPP_DATASOURCE_Form.setActionType(ftype: ActionType);
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
       edtID.readonly:=True;
       whereSql:=' where ID ='+ sysutils.QuotedStr(fPkFieldValue);
       mDisplayRecord(panel1,wheresql);
       btnSave.visible:=True;
   end;

   if ftype=fDelete then
   begin

   end;

   if ftype=fDisplay then
   begin
       edtID.readonly:=True;
       whereSql:=' where ID ='+ sysutils.QuotedStr(fPkFieldValue);
       mDisplayRecord(panel1,wheresql);
       btnSave.visible:=False;
   end;


end;

procedure TAPP_DATASOURCE_Form.btnSaveClick(Sender: TObject);
var i:integer;
begin
   if fActionType=fAddNew then
      i:=mInsertRecord(panel1,'APP_DATASOURCE');

   
   if fActionType=fUpdate then
      i:= mUpdateRecord(panel1,'APP_DATASOURCE');

   if i=0 then 
   begin
          panel1.Enabled :=false;
          showmessage('保存成功!') 
   end else
         showmessage('保存失败!') ;
   
end;

procedure TAPP_DATASOURCE_Form.btnAddNewClick(Sender: TObject);
begin
    setActionType(fAddNew);
end;

procedure TAPP_DATASOURCE_Form.bttModifyClick(Sender: TObject);
begin
    setActionType(fUpdate);
end;



end.
