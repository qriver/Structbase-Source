unit fResourceForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, ComCtrls,fBaseForm, Buttons, uChildMainForm;

type
  TResourceForm = class(TBaseForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    pnl3: TPanel;
    txt6: TStaticText;
    txtlbl2: TStaticText;
    edtResource_name: TMaskEdit;
    txtlbl3: TStaticText;
    edtParent_id: TMaskEdit;
    edtResource_id: TMaskEdit;
    btnSave: TBitBtn;
    txt1: TStaticText;
    edtRESOURCE_ENGNAME: TMaskEdit;
    edtGLDW: TMaskEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    edtFORMATSTR: TMaskEdit;
    memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    FState:String  ;
    fprimaryId:String;
    fparentId:String;
    InputOverEvent:TNotifyEvent;
  public
    { Public declarations }
     procedure setState(state:String);
     property  primaryId: String read fprimaryId write fprimaryId;
     property  parentId: String read fparentId write fparentId;
     property  OnInputOver : TNotifyEvent read InputOverEvent write InputOverEvent;
  end;

var
  ResourceForm: TResourceForm;

implementation
 //uses uSystemFunction;
{$R *.dfm}

procedure TResourceForm.FormCreate(Sender: TObject);
begin
  self.mRegistCntrl(pnl3,'RESOURCE_LIST');
  self.parentId:='';
  self.primaryId:='';
end;

procedure TResourceForm.setState(state: String);
var sql:String;

begin
  self.FState:=state;
  if state='ADDNEW' then
  begin
     self.edtResource_id.Enabled:=true;
     self.mCleanPanel(pnl3);
     if self.parentId<>'' then    self.mSetDbControlDefaultValue('edtParent_id',parentId);
     //    mgetDbControl('edtParent_id').setDefaultValue(parentId);
     parentId:='';
  end;
  if state='UPDATE' then
  begin
     self.edtResource_id.Enabled:=false;
     sql:=' where resource_id='''+primaryId+'''';
     self.mDisplayRecord(pnl3,sql);
     self.memo1.Lines.Text:=self.edtFORMATSTR.Text;
     primaryId:='';
  end;
  self.Visible:=true;
end;

procedure TResourceForm.btnSaveClick(Sender: TObject);
var dbAnswer:integer;
begin
  inherited;
  self.edtFORMATSTR.Text:=self.memo1.Lines.Text;
  if self.fstate='ADDNEW' then
  begin
          dbAnswer:=self.mInsertRecord(pnl3,'RESOURCE_LIST');
  end;
  if self.fstate='UPDATE' then
  begin
      dbAnswer:=self.mUpdateRecord(pnl3,'RESOURCE_LIST');
  end;

  if   dbAnswer<>0 then
         showmessage('数据保存失败')
  else
  begin
     showmessage('数据保存成功');
   //  uSystemFunction.registLocalDicCds;
  end;

  self.Visible:=false;
  OnInputOver(self);
end;



end.
