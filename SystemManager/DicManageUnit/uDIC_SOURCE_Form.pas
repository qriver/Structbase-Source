{
  代码引擎模版
  Written by SkyJacker
  2007-03-01 09:48:58
}

unit uDIC_SOURCE_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ExtCtrls,fBaseForm,Mask, DB;

type actionType=(fAddNew,fUpdate,fDelete,fDisplay);

type
  TDIC_SOURCE_Form = class(TBaseForm)
    btnClose: TButton;
    btnSave:  TButton;
    Panel1: TPanel;
    
    lbl1: TStaticText;
    edtAPPID: TMaskEdit;
    lbl2: TStaticText;
    edtDICCHINESENAME: TMaskEdit;
    lbl3: TStaticText;
    edtDICFILENAME: TMaskEdit;
    lbl4: TStaticText;
    edtDICFILTERSQL: TMaskEdit;
    lbl5: TStaticText;
    edtDICID: TMaskEdit;
    lbl6: TStaticText;
    edtDICKEYFIELD: TMaskEdit;
    lbl7: TStaticText;
    edtDICLEVELMODE: TMaskEdit;
    lbl8: TStaticText;
    edtDICNAME: TMaskEdit;
    lbl9: TStaticText;
    edtDICPY: TMaskEdit;
    lbl10: TStaticText;
    edtDICSOURCETABLE: TMaskEdit;
    lbl11: TStaticText;
    edtDICVALFIELD: TMaskEdit;
    lbl12: TStaticText;
    edtSTARTUP_LOAD: TMaskEdit;
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
  DIC_SOURCE_Form: TDIC_SOURCE_Form;

implementation
  

{$R *.dfm}



procedure TDIC_SOURCE_Form.FormCreate(Sender: TObject);
begin
  mRegistCntrl(panel1,'DIC_SOURCE') 
end;

procedure TDIC_SOURCE_Form.FormDestroy(Sender: TObject);
begin
  //
end;

procedure TDIC_SOURCE_Form.FormShow(Sender: TObject);
begin
  //
end;

procedure TDIC_SOURCE_Form.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TDIC_SOURCE_Form.setActionType(ftype: ActionType);
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
       edtDICID.readonly:=True;
       whereSql:=' where DICID ='+ sysutils.QuotedStr(fPkFieldValue);
       mDisplayRecord(panel1,wheresql);
       btnSave.visible:=True;
   end;

   if ftype=fDelete then
   begin

   end;

   if ftype=fDisplay then
   begin
       edtDICID.readonly:=True;
       whereSql:=' where DICID ='+ sysutils.QuotedStr(fPkFieldValue);
       mDisplayRecord(panel1,wheresql);
       btnSave.visible:=False;
   end;


end;

procedure TDIC_SOURCE_Form.btnSaveClick(Sender: TObject);
var i:integer;
begin
   if fActionType=fAddNew then
      //i:=mInsertRecord(panel1,'DIC_SOURCE');
       i:=mInsertRecord(panel1 );


   if fActionType=fUpdate then
     // i:= mUpdateRecord(panel1,'DIC_SOURCE');
         i:= mUpdateRecord(panel1);
   if i=0 then 
   begin
          panel1.Enabled :=false;
          showmessage('保存成功!') 
   end else
         showmessage('保存失败!') ;
   
end;

procedure TDIC_SOURCE_Form.btnAddNewClick(Sender: TObject);
begin
    setActionType(fAddNew);
end;

procedure TDIC_SOURCE_Form.bttModifyClick(Sender: TObject);
begin
    setActionType(fUpdate);
end;



end.
