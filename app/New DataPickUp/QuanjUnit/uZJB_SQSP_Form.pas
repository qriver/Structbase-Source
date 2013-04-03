{
  代码引擎模版
  Written by SkyJacker
  2007-03-01 09:48:58
}

unit uZJB_SQSP_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ExtCtrls,fBaseForm,Mask;

type actionType=(fAddNew,fUpdate,fDelete,fDisplay);

type
  TZJB_SQSP_Form = class(TBaseForm)
    btnClose: TButton;
    btnSave:  TButton;
    Panel1: TPanel;
    
    lbl1: TStaticText;
    edtBGYY: TMaskEdit;
    lbl2: TStaticText;
    edtBGZT: TMaskEdit;
    lbl3: TStaticText;
    edtBZLDBH: TMaskEdit;
    lbl4: TStaticText;
    edtFH: TMaskEdit;
    lbl5: TStaticText;
    edtFHHZ: TMaskEdit;
    lbl6: TStaticText;
    edtID: TMaskEdit;
    lbl7: TStaticText;
    edtJLTS: TMaskEdit;
    lbl8: TStaticText;
    edtJLX: TMaskEdit;
    lbl9: TStaticText;
    edtLDH: TMaskEdit;
    lbl10: TStaticText;
    edtMAP_X: TMaskEdit;
    lbl11: TStaticText;
    edtMAP_Y: TMaskEdit;
    lbl12: TStaticText;
    edtMPH: TMaskEdit;
    lbl13: TStaticText;
    edtMPHZ: TMaskEdit;
    lbl14: TStaticText;
    edtMPQZ: TMaskEdit;
    lbl15: TStaticText;
    edtSPDW: TMaskEdit;
    lbl16: TStaticText;
    edtSPR: TMaskEdit;
    lbl17: TStaticText;
    edtSPSJ: TMaskEdit;
    lbl18: TStaticText;
    edtSPTHYY: TMaskEdit;
    lbl19: TStaticText;
    edtSPZT: TMaskEdit;
    lbl20: TStaticText;
    edtSQDW: TMaskEdit;
    lbl21: TStaticText;
    edtSQLB: TMaskEdit;
    lbl22: TStaticText;
    edtSQR: TMaskEdit;
    lbl23: TStaticText;
    edtSQSJ: TMaskEdit;
    lbl24: TStaticText;
    edtSSJWQ: TMaskEdit;
    lbl25: TStaticText;
    edtSSXQ: TMaskEdit;
    lbl26: TStaticText;
    edtZLHZ: TMaskEdit;
    lbl27: TStaticText;
    edtZLQZ: TMaskEdit;
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
  ZJB_SQSP_Form: TZJB_SQSP_Form;

implementation
  

{$R *.dfm}



procedure TZJB_SQSP_Form.FormCreate(Sender: TObject);
begin
  mRegistCntrl(panel1,'ZJB_SQSP') 
end;

procedure TZJB_SQSP_Form.FormDestroy(Sender: TObject);
begin
  //
end;

procedure TZJB_SQSP_Form.FormShow(Sender: TObject);
begin
  //
end;

procedure TZJB_SQSP_Form.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TZJB_SQSP_Form.setActionType(ftype: ActionType);
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

procedure TZJB_SQSP_Form.btnSaveClick(Sender: TObject);
var i:integer;
begin
   if fActionType=fAddNew then
      i:=mInsertRecord(panel1,'ZJB_SQSP');

   
   if fActionType=fUpdate then
      i:= mUpdateRecord(panel1,'ZJB_SQSP');

   if i=0 then 
   begin
          panel1.Enabled :=false;
          showmessage('保存成功!') 
   end else
         showmessage('保存失败!') ;
   
end;

procedure TZJB_SQSP_Form.btnAddNewClick(Sender: TObject);
begin
    setActionType(fAddNew);
end;

procedure TZJB_SQSP_Form.bttModifyClick(Sender: TObject);
begin
    setActionType(fUpdate);
end;



end.
