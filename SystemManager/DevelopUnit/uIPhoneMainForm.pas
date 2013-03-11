unit uIPhoneMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Spin, ImageViewYM, RzTabs;
type
  TIPhoneMainForm = class(TForm)
    rzpgcntrl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure rzpgcntrl1Close(Sender: TObject; var AllowClose: Boolean);
  private
    procedure LoadFormInPage(var aform: TForm);
    procedure btnLinkDBClick(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
    dvym : TImageViewYM;//DragViewYM
  end;

var
  IPhoneMainForm: TIPhoneMainForm;

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

procedure TIPhoneMainForm.btnLinkDBClick(Sender: TObject);
begin
if dvym.ItemCaption='数据字典' then
begin
    if not assigned(DIC_SOURCE_MainForm) then
              DIC_SOURCE_MainForm:= TDIC_SOURCE_MainForm.create(self);

  self.LoadFormInPage(TForm(DIC_SOURCE_MainForm));
end;

if dvym.ItemCaption=' 表定义 ' then
begin
   if not assigned(TableFrom) then
        TableFrom:=TFrmTableDefine.create(self);
     self.LoadFormInPage(TForm(TableFrom));
end;
if dvym.ItemCaption='权限管理' then
begin
   if not assigned(TableFrom) then
        TableFrom:=TFrmTableDefine.create(self);
     self.LoadFormInPage(TForm(TableFrom));
end;
if dvym.ItemCaption='代码生成' then
begin
if  not assigned(CnMainCodeEngine) then
         CnMainCodeEngine:=TCnMainCodeEngine.create(self);
    self.LoadFormInPage(TForm(CnMainCodeEngine));
end;
if dvym.ItemCaption='系统设置' then
begin
if  not assigned(APP_NAME_MainForm) then
         APP_NAME_MainForm:=TAPP_NAME_MainForm.create(self);
    self.LoadFormInPage(TForm(APP_NAME_MainForm));
end;
if dvym.ItemCaption='数据源定义' then
begin
if  not assigned(APP_DATASOURCE_MainForm) then
         APP_DATASOURCE_MainForm:=TAPP_DATASOURCE_MainForm.create(self);
    self.LoadFormInPage(TForm(APP_DATASOURCE_MainForm));
end;


end;

procedure TIPhoneMainForm.FormCreate(Sender: TObject);
var ss:String;
begin
   self.Width:=1024;
   self.Height:=768;

  dvym := TImageViewYM.Create(Self);
  dvym.Parent := TabSheet1;
  dvym.Align := alClient;

//  dvym.BuildComponents;
//  dvym.subClick := myClick;
 // dvym.OnItemClick := myClick;

  dvym.ColCount := 10;
  dvym.CellWidth:= 60;
  dvym.CellHeight:= 60;
  dvym.CRDistance := 10;



  dvym.AddItem( '数据字典', '61' );
  dvym.AddItem( ' 表定义 ', '62' );
  dvym.AddItem( '权限管理', '63' );
  dvym.AddItem( '代码生成', '54' );
  dvym.AddItem( '系统设置', '65' );
  dvym.AddItem( '数据源定义', '66' );
//  dvym.HCTS := False;
  dvym.BuildComponents;
  dvym.loadBackPic(sysutils.GetCurrentDir+ '\1.jpg');
//  dvym.HCTS := True;
   dvym.OnItemClick:=btnLinkDBClick;

end;


procedure TIPhoneMainForm.LoadFormInPage(var aform : TForm);
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
procedure TIPhoneMainForm.rzpgcntrl1Close(Sender: TObject;
  var AllowClose: Boolean);
  var i:integer;
  var clsType:String;
begin
 inherited;
    if self.rzpgcntrl1.ActivePageIndex=0 then exit;


     clsType:=(sender as TRzPageControl).ActivePage.Controls[0].ClassName;

     TForm((sender as TRzPageControl).ActivePage.Controls[0]).close;
    (sender as TRzPageControl).ActivePage.Controls[0].Free;
    (sender as TRzPageControl).ActivePage.Data:=nil;
    (sender as TRzPageControl).ActivePage.Free;

     self.rzpgcntrl1.ActivePageIndex:=0;
end;

end.
