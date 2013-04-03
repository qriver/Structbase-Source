{
  代码引擎模版
  Written by SkyJacker
  2007-03-01 09:48:58
}

unit uCnMainCodeEngine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ExtCtrls,fBaseForm,Mask;

type actionType=(fAddNew,fUpdate,fDelete,fDisplay);

type
  TGRIDDING_DJ_MainForm = class(TBaseForm)
    btnClose: TButton;
    btnSave:  TButton;
    Panel1: TPanel;
    
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
  GRIDDING_DJ_MainForm: TGRIDDING_DJ_MainForm;

implementation
  

{$R *.dfm}



procedure TGRIDDING_DJ_MainForm.FormCreate(Sender: TObject);
begin
  mRegistCntrl(panel1,'MyTableName') 
end;

procedure TGRIDDING_DJ_MainForm.FormDestroy(Sender: TObject);
begin
  //
end;

procedure TGRIDDING_DJ_MainForm.FormShow(Sender: TObject);
begin
  //
end;

procedure TGRIDDING_DJ_MainForm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TGRIDDING_DJ_MainForm.setActionType(ftype: ActionType);
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
       edtPK_FieldName.readonly:=True;
       whereSql:=' where PK_FieldName ='+ sysutils.QuotedStr(fPkFieldValue);
       mDisplayRecord(panel1,wheresql);
       btnSave.visible:=True;
   end;

   if ftype=fDelete then
   begin

   end;

   if ftype=fDisplay then
   begin
       edtPK_FieldName.readonly:=True;
       whereSql:=' where PK_FieldName ='+ sysutils.QuotedStr(fPkFieldValue);
       mDisplayRecord(panel1,wheresql);
       btnSave.visible:=False;
   end;


end;

procedure TGRIDDING_DJ_MainForm.btnSaveClick(Sender: TObject);
var i:integer;
begin
   if fActionType=fAddNew then
      i:=mInsertRecord(panel1,'MyTableName');

   
   if fActionType=fUpdate then
      i:= mUpdateRecord(panel1,'MyTableName');

   if i=0 then 
   begin
          panel1.Enabled :=false;
          showmessage('保存成功!') 
   end else
         showmessage('保存失败!') ;
   
end;

procedure TGRIDDING_DJ_MainForm.btnAddNewClick(Sender: TObject);
begin
    setActionType(fAddNew);
end;

procedure TGRIDDING_DJ_MainForm.bttModifyClick(Sender: TObject);
begin
    setActionType(fUpdate);
end;



end.
