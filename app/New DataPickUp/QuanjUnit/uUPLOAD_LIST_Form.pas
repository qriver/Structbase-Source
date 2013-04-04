{
  代码引擎模版
  Written by SkyJacker
  2007-03-01 09:48:58
}

unit uUPLOAD_LIST_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ExtCtrls,fBaseForm,Mask, RzButton, DB;

type actionType=(fAddNew,fUpdate,fDelete,fDisplay);

type
  TUPLOAD_LIST_Form = class(TBaseForm)
    btnClose: TButton;
    btnSave:  TButton;
    panel1: TPanel;
    txtlbl2: TStaticText;
    edtResource_id: TMaskEdit;
    txt1: TStaticText;
    edtPOLICE_ID: TMaskEdit;
    txt2: TStaticText;
    edtDWBM: TMaskEdit;
    txt5: TStaticText;
    edtUPLOAD_TIME: TMaskEdit;
    txt4: TStaticText;
    edtFROM_DW: TMaskEdit;
    edtDESCRIPTION: TMaskEdit;
    txt3: TStaticText;
    StaticText1: TStaticText;
    edtLSH: TMaskEdit;
    RzBitBtn1: TRzBitBtn;
    edtTitle1: TStaticText;
    edtTitle: TMaskEdit;
    StaticText2: TStaticText;
    edtLXDH: TMaskEdit;
    txt6: TStaticText;
    edtJLTS: TMaskEdit;
    txt7: TStaticText;
    edtSJZT: TMaskEdit;
    edtSHZT: TMaskEdit;
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
  UPLOAD_LIST_Form: TUPLOAD_LIST_Form;

implementation
  

{$R *.dfm}



procedure TUPLOAD_LIST_Form.FormCreate(Sender: TObject);
begin
  mRegistCntrl(panel1,'UPLOAD_LIST') 
end;

procedure TUPLOAD_LIST_Form.FormDestroy(Sender: TObject);
begin
  //
end;

procedure TUPLOAD_LIST_Form.FormShow(Sender: TObject);
begin
  //
end;

procedure TUPLOAD_LIST_Form.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TUPLOAD_LIST_Form.setActionType(ftype: ActionType);
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
       edtLSH.readonly:=True;
       whereSql:=' where LSH ='+ sysutils.QuotedStr(fPkFieldValue);
       self.mOpenInputProxy(panel1);
       mDisplayRecord(panel1,wheresql);
       btnSave.visible:=True;
       panel1.Enabled :=True;
   end;

   if ftype=fDelete then
   begin

   end;

   if ftype=fDisplay then
   begin
       edtLSH.readonly:=True;
       whereSql:=' where LSH ='+ sysutils.QuotedStr(fPkFieldValue);
       mDisplayRecord(panel1,wheresql);
       self.mCloseInputProxy(panel1);
       btnSave.visible:=False;
       panel1.Enabled :=True;
   end;


end;

procedure TUPLOAD_LIST_Form.btnSaveClick(Sender: TObject);
var i:integer;
begin
   if fActionType=fAddNew then
      i:=mInsertRecord(panel1,'UPLOAD_LIST');

   
   if fActionType=fUpdate then
      i:= mUpdateRecord(panel1,'UPLOAD_LIST');

   if i=0 then 
   begin
          panel1.Enabled :=false;
          showmessage('保存成功!') 
   end else
         showmessage('保存失败!') ;
   
end;

procedure TUPLOAD_LIST_Form.btnAddNewClick(Sender: TObject);
begin
    setActionType(fAddNew);
end;

procedure TUPLOAD_LIST_Form.bttModifyClick(Sender: TObject);
begin
    setActionType(fUpdate);
end;



end.
