unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ExtCtrls,
  RzPanel,
  RzButton,

  //uAuth_MainForm,
  RzTabs;

type
  TMainForm = class(TForm)
    tbrMain: TRzToolbar;
    btn1: TRzToolButton;
    btn2: TRzToolButton;
    rzspcr1: TRzSpacer;
    pnl2: TPanel;
    imlVisualStyles: TImageList;
    imlTray: TImageList;
    imlGroup: TImageList;
    imlMain: TImageList;
    btn3: TRzToolButton;
    rzpgcntrl1: TRzPageControl;
    codeEngide: TRzToolButton;
    btnAppSetup: TRzToolButton;
    btnDataSource: TRzToolButton;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure rzpgcntrl1Close(Sender: TObject; var AllowClose: Boolean);
    procedure codeEngideClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAppSetupClick(Sender: TObject);
    procedure btnDataSourceClick(Sender: TObject);

  private
    procedure LoadFormInPage(var aform: TForm);

    { Private declarations }

  public
    { Public declarations }
  end;

 var
    MainForm: TMainForm ;

implementation
uses
     uAPP_NAME_MainForm,
    uAPP_DATASOURCE_MainForm,
    dicManager,
    uDIC_SOURCE_MainForm,
    uCnMainCodeEngine,
    uTableDefine,
    uDbConnect;



{$R *.dfm}



procedure TMainForm.btn1Click(Sender: TObject);
begin

    if not assigned(DIC_SOURCE_MainForm) then
              DIC_SOURCE_MainForm:= TDIC_SOURCE_MainForm.create(self);

  self.LoadFormInPage(TForm(DIC_SOURCE_MainForm));

end;


procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  application.Terminate;
end;

procedure TMainForm.FormCreate(Sender: TObject);

begin
   self.Width:=1024;
   self.Height:=768;


end;

procedure TMainForm.btn2Click(Sender: TObject);

begin

    if not assigned(TableFrom) then
        TableFrom:=TFrmTableDefine.create(self);
    self.LoadFormInPage(TForm(TableFrom));

end;

procedure TMainForm.btn3Click(Sender: TObject);
begin
{
    if  not assigned(authMainForm) then
         authMainForm:=TauthMainForm.create(self);
    self.LoadFormInPage(TForm(authMainForm));
    }
end;

procedure TMainForm.btnAppSetupClick(Sender: TObject);
begin
//APP_DATASOURCE_MainForm: TAPP_DATASOURCE_MainForm
  //APP_NAME_MainForm: TAPP_NAME_MainForm;
if  not assigned(APP_NAME_MainForm) then
         APP_NAME_MainForm:=TAPP_NAME_MainForm.create(self);
    self.LoadFormInPage(TForm(APP_NAME_MainForm));
end;

procedure TMainForm.btnDataSourceClick(Sender: TObject);
begin
//APP_DATASOURCE_MainForm: TAPP_DATASOURCE_MainForm
  //APP_NAME_MainForm: TAPP_NAME_MainForm;
if  not assigned(APP_DATASOURCE_MainForm) then
         APP_DATASOURCE_MainForm:=TAPP_DATASOURCE_MainForm.create(self);
    self.LoadFormInPage(TForm(APP_DATASOURCE_MainForm));
end;

procedure TMainForm.codeEngideClick(Sender: TObject);
begin
if  not assigned(CnMainCodeEngine) then
         CnMainCodeEngine:=TCnMainCodeEngine.create(self);
    self.LoadFormInPage(TForm(CnMainCodeEngine));
end;

procedure TMainForm.LoadFormInPage(var aform : TForm);
var i:integer;
var myrzTab:TRzTabSheet;
begin
  {$IFNDEF NDEBUG}
    // cndebugger.TraceMsgWithLevel('regcls:'+aname,3);
    // cndebugger.TraceObject(cls);
  {$ENDIF}
  for i := 0 to rzpgcntrl1.PageCount - 1 do
  begin
     if rzpgcntrl1.Pages[i].Tag=aform.Handle then
     begin
         rzpgcntrl1.Pages[i].TabVisible:=true;
         rzpgcntrl1.ActivePage.Show;
       // rzpgcntrl1.ActivePage:=rzpgcntrl1.Pages[i];
        exit;
     end;

  end;
  myrzTab:=TRzTabSheet.Create(self);
  myrzTab.PageControl:=rzpgcntrl1;

  myrzTab.Caption:=aform.Caption;
  aform.Parent:= rzpgcntrl1.Pages[rzpgcntrl1.pagecount-1];
  rzpgcntrl1.Pages[rzpgcntrl1.pagecount-1].Tag:=aform.Handle;
  aform.BorderStyle:=bsNone;
  aform.Align:=alClient;
  aform.Show;
  rzpgcntrl1.ActivePage:= rzpgcntrl1.Pages[rzpgcntrl1.pagecount-1];

end;



procedure TMainForm.rzpgcntrl1Close(Sender: TObject; var AllowClose: Boolean);
  var i:integer;
  var clsType:String;
begin
 inherited;
     clsType:=(sender as TRzPageControl).ActivePage.Controls[0].ClassName;
    TForm((sender as TRzPageControl).ActivePage.Controls[0]).close;
    (sender as TRzPageControl).ActivePage.Controls[0].Free;
    (sender as TRzPageControl).ActivePage.Data:=nil;
    (sender as TRzPageControl).ActivePage.Free;
    //if clstype='TEquipmentForm' then  equipmentForm:=nil

end;

end.
