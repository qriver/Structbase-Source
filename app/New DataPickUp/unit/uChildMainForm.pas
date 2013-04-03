unit uChildMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, RzGroupBar, RzTabs;

type
  TChildMainForm = class(TForm)
    Panel1: TPanel;
    RzGroupBar1: TRzGroupBar;
    RzGroup2: TRzGroup;
    RzGroup3: TRzGroup;
    RzGroup4: TRzGroup;
    rzpgcntrl1: TRzPageControl;
    RzGroup5: TRzGroup;
    procedure over(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure RzGroup5Items0Click(Sender: TObject);
    procedure rzpgcntrl1Close(Sender: TObject; var AllowClose: Boolean);
    procedure RzGroup1Items0Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure RzGroupBar1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure LoadFormInPage(var aform: TForm);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChildMainForm: TChildMainForm;

implementation
uses
uProfile,
dbClient,
fDataResForm,
//ufrmUpLoadRes,
     uStructbaseFrameWork,
     uGRIDDING_JC_MainForm,
     uGRIDDING_SP_MainForm,
     uGRIDDING_DJ_MainForm;
{$R *.dfm}

procedure TChildMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var i:integer;
begin
  CDSGriddingPOlice.free;
  for i := 0 to rzpgcntrl1.PageCount - 1 do
           (rzpgcntrl1.Pages[i].Controls[0] as TForm).Close;


end;

procedure TChildMainForm.FormCreate(Sender: TObject);
var cds:TCLIENTDATASET;
var sql:String;
begin

   structbase.LoadAppInstance('DATACOLLECT');

   cds:=TclientDataset.Create(self);
   sql:='select * from resource_list where zxbs=''0''';
  // StructUtil.getApplication(uProfile.Const_AppId).
  //            DBProvide.SelectCommand(cds,sql,0);

  //资源列表字典，因为与metadatasource不在同一个数据源，因此只能在app装载时手工load
  structbase.Applications.find(uProfile.Const_AppId).DBProvide.SelectCommand(cds,sql,0);
  // StructUtil.registDicCDS(Const_AppId,Const_DicId_Resource,cds);
  structbase.DicItems.find(Const_DicId_Resource).dicDataSet:=cds;

end;

procedure TChildMainForm.over(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  Index, i: Integer;
begin
  Index := TRzGroup(Sender).ItemAtPos(Point(X, Y));
  if Index >= 0 then
  begin
    TRzGroup(Sender).Items[Index].FontStyle := TRzGroup(Sender)
      .Items[Index].FontStyle + [fsUnderLine];
    TRzGroup(Sender).Items[Index].FontColor := clRed;
  end
  else
  begin
    for i := 0 to TRzGroup(Sender).Items.Count - 1 do
    begin
      TRzGroup(Sender).Items[i].FontStyle := TRzGroup(Sender)
        .Items[i].FontStyle - [fsUnderLine];
      TRzGroup(Sender).Items[i].FontColor := clBlack;
    end;
  end;
end;

procedure TChildMainForm.RzGroup1Items0Click(Sender: TObject);
var strSql:String;
begin
       if not assigned(GRIDDING_DJ_MainForm) then
              GRIDDING_DJ_MainForm:= TGRIDDING_DJ_MainForm.create(self);
              self.LoadFormInPage(TForm(GRIDDING_DJ_MainForm));

end;

procedure TChildMainForm.RzGroup5Items0Click(Sender: TObject);
//数据资源类别
begin
   if not assigned(frmDataRes) then
              frmDataRes:= TfrmDataRes.create(self);

    self.LoadFormInPage(TForm(frmDataRes));
end;

procedure TChildMainForm.RzGroupBar1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  Index, i: Integer;
begin
  Index := TRzGroup(Sender).ItemAtPos(Point(X, Y));
  if Index >= 0 then
  begin
    TRzGroup(Sender).Items[Index].FontStyle := TRzGroup(Sender)
      .Items[Index].FontStyle + [fsUnderLine];
    TRzGroup(Sender).Items[Index].FontColor := clRed;
  end
  else
  begin
    for i := 0 to TRzGroup(Sender).Items.Count - 1 do
    begin
      TRzGroup(Sender).Items[i].FontStyle := TRzGroup(Sender)
        .Items[i].FontStyle - [fsUnderLine];
      TRzGroup(Sender).Items[i].FontColor := clBlack;
    end;
  end;
end;


procedure TChildMainForm.rzpgcntrl1Close(Sender: TObject;
  var AllowClose: Boolean);
  var i:integer;
  var clsType:String;
begin
 inherited;
     clsType:=(sender as TRzPageControl).ActivePage.Controls[0].ClassName;
     TForm((sender as TRzPageControl).ActivePage.Controls[0]).close;
    (sender as TRzPageControl).ActivePage.Controls[0].Free;
    (sender as TRzPageControl).ActivePage.Data:=nil;
    (sender as TRzPageControl).ActivePage.Free;

end;

procedure TChildMainForm.LoadFormInPage(var aform : TForm);
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
        // rzpgcntrl1.ActivePage.Show;
         rzpgcntrl1.ActivePage:=rzpgcntrl1.Pages[i];
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

end.
