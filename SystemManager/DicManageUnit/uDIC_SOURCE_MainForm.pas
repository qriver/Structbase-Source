unit uDIC_SOURCE_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, RzButton, ExtCtrls, RzTabs,
  StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxContainer, cxTextEdit,
  cxImageComboBox, cxMaskEdit, cxCalendar, cxSpinEdit,fBaseForm, cxStyles,
  cxCustomData, cxFilter, cxData, DBClient, ImgList,
  cxPC, Mask, cxLocalization;


type
  TDIC_SOURCE_MainForm = class(TBaseForm)
    RzToolbar1: TRzToolbar;
    RzBtnLookup: TRzToolButton;
    RzSpacer1: TRzSpacer;
    RzBtnCount: TRzToolButton;
    RzSpacer2: TRzSpacer;
    RzSpacer3: TRzSpacer;
    rzPageCondition: TRzPageControl;
    TabSheet1: TRzTabSheet;
    pnlCondition: TPanel;
    DataSource1: TDataSource;
    RzSpacer4: TRzSpacer;
    btnAddnew: TRzToolButton;
    btnDelete: TRzToolButton;
    btnModify: TRzToolButton;
    btnDisplay: TRzToolButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    RzToolbar3: TRzToolbar;
    cxSpinPageNo: TcxSpinEdit;
    cxSpinPageNum: TcxSpinEdit;
    CDS_TABLE: TClientDataSet;

DIC_SOURCEAPPID:TStringField; 
DIC_SOURCEDICCHINESENAME:TStringField; 
DIC_SOURCEDICFILENAME:TStringField; 
DIC_SOURCEDICFILTERSQL:TStringField; 
DIC_SOURCEDICID:TStringField; 
DIC_SOURCEDICKEYFIELD:TStringField; 
DIC_SOURCEDICLEVELMODE:TStringField; 
DIC_SOURCEDICNAME:TStringField; 
DIC_SOURCEDICPY:TStringField; 
DIC_SOURCEDICSOURCETABLE:TStringField; 
DIC_SOURCEDICVALFIELD:TStringField; 
DIC_SOURCESTARTUP_LOAD:TStringField; 
    TabSheetDataModify: TRzTabSheet;
    edtAPPID: TMaskEdit;
    lbl1: TStaticText;
    cxGrid1DBTableView1APPID: TcxGridDBColumn;
    cxGrid1DBTableView1DICCHINESENAME: TcxGridDBColumn;
    cxGrid1DBTableView1DICFILENAME: TcxGridDBColumn;
    cxGrid1DBTableView1DICFILTERSQL: TcxGridDBColumn;
    cxGrid1DBTableView1DICID: TcxGridDBColumn;
    cxGrid1DBTableView1DICKEYFIELD: TcxGridDBColumn;
    cxGrid1DBTableView1DICLEVELMODE: TcxGridDBColumn;
    cxGrid1DBTableView1DICNAME: TcxGridDBColumn;
    cxGrid1DBTableView1DICPY: TcxGridDBColumn;
    cxGrid1DBTableView1DICSOURCETABLE: TcxGridDBColumn;
    cxGrid1DBTableView1DICVALFIELD: TcxGridDBColumn;
    cxGrid1DBTableView1STARTUP_LOAD: TcxGridDBColumn;
    cxLocalizer1: TcxLocalizer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBtnLookupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxSpinPageNoClick(Sender: TObject);
    procedure btnAddnewClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnDisplayClick(Sender: TObject);

  private
    { Private declarations }
    Const _TableName='DIC_SOURCE';
          _PkFieldName='DICID';
          _DBTYPE='ACCESS';
    procedure RefreshGrid(Const PageNo:String);
    procedure ShowDataModifyForm(umode:integer) ;
  public
    { Public declarations }
  end;


var
  DIC_SOURCE_MainForm: TDIC_SOURCE_MainForm;

implementation

uses uDIC_SOURCE_Form;    //


{$R *.dfm}



procedure TDIC_SOURCE_MainForm.RefreshGrid(const PageNo: String);
var strSql,strPageSql,strFrist,strLast:String;
begin

  self.btnAddnew.Enabled:=true;
  self.btnDelete.Enabled:=true;
  self.btnModify.Enabled:=true;
  self.btnDisplay.Enabled:=true;
  cds_table.Close;


  strFrist:=(cxSpinPageNo.Value-1)*cxSpinPageNum.Value+1;
  strLast:=(cxSpinPageNo.Value)*cxSpinPageNum.Value ;

  //strSql:=self.mGetSqlByPanel(pnlCondition) ;
   strSql:=self.mGetSqlStr(pnlCondition) ;
  if _DBTYPE<>'ACCESS' then
  begin
      strPageSql:='select * from  (';
      strPageSql:=strPageSql+'select a.*,rownum rn from (%s) a ';
      strPageSql:=strPageSql+' where rownum<=%s )';
      strPageSql:=strPageSql+'where rn>=%s';
      strSql:=format(strPageSql,[strSql,strLast,strFrist]);
  end;
  screen.Cursor:= crHourGlass;
  self.mDBProvide.SelectCommand(cds_table,strSql,0);
  screen.Cursor:= crDefault;
  cxGrid1DBTableView1.DataController.KeyFieldNames:=self._PkFieldName;
 // RzPageMain.Enabled:=true;
  self.rzPageCondition.ActivePage:=TabSheet1;
end;



procedure TDIC_SOURCE_MainForm.btnAddnewClick(Sender: TObject);
begin
  inherited;
  TabSheetDataModify.Caption:='新增记录';
  DIC_SOURCE_Form.actionType:=faddnew;
  ShowDataModifyForm(0);
end;

procedure TDIC_SOURCE_MainForm.btnDisplayClick(Sender: TObject);
begin
  inherited;
  with  cxGrid1DBTableView1.DataController  do
  begin
     DIC_SOURCE_Form.pkFieldValue:=DataSet.FieldByName(KeyFieldNames).Value;
  end;
   DIC_SOURCE_Form.actionType:=fDisplay;
     TabSheetDataModify.Caption:='数据浏览';
   ShowDataModifyForm(0);
end;

procedure TDIC_SOURCE_MainForm.btnModifyClick(Sender: TObject);
begin
  inherited;
  with  cxGrid1DBTableView1.DataController  do
  begin
     DIC_SOURCE_Form.pkFieldValue:=DataSet.FieldByName(KeyFieldNames).Value;
  end;
  TabSheetDataModify.Caption:='修改记录';
  DIC_SOURCE_Form.actionType:=fupdate;
  ShowDataModifyForm(0);
end;

procedure TDIC_SOURCE_MainForm.cxSpinPageNoClick(Sender: TObject);
begin
  inherited;
  RefreshGrid(cxSpinPageNo.Value);
end;


procedure TDIC_SOURCE_MainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  cxGrid1DBTableView1.DataController.DataSource:=nil;
  CDS_TABLE.Close;
  DIC_SOURCE_MainForm:=NIL;

 // Application.Terminate;
end;



procedure TDIC_SOURCE_MainForm.FormCreate(Sender: TObject);
begin
  inherited;
  DIC_SOURCE_Form:=TDIC_SOURCE_Form.create(self);


  if sysutils.FileExists(GetCurrentDir+'\DevLocal.ini') then
  begin
      cxLocalizer1.FileName:=GetCurrentDir+'\DevLocal.ini';
      cxLocalizer1.Active:=true;
      cxLocalizer1.Locale:=2052;
  end;
  DIC_SOURCE_Form:=TDIC_SOURCE_Form.create(self);
       
  self.btnDelete.Enabled:=false;
  self.btnModify.Enabled:=false;
  self.btnDisplay.Enabled:=false;

  self.mRegistCntrl(pnlCondition,_TableName);
  self.rzPageCondition.ActivePage:=TabSheet1;
  TabSheetDataModify.TabVisible:=False;
end;

procedure TDIC_SOURCE_MainForm.RzBtnLookupClick(Sender: TObject);
var strSql:String;
begin
  inherited;
  cxSpinPageNo.Value:=1;
  RefreshGrid(cxSpinPageNo.Value);
  TabSheetDataModify.TabVisible:=False;
end;




procedure TDIC_SOURCE_MainForm.ShowDataModifyForm(umode:integer);
begin
if umode=0 then   //  显示在本窗体内
begin
  DIC_SOURCE_Form.Parent:=TabSheetDataModify;
  DIC_SOURCE_Form.Align:=alClient;
  DIC_SOURCE_Form.BorderStyle:=bsnone;

  TabSheetDataModify.TabVisible:=True;
  self.rzPageCondition.ActivePage:=TabSheetDataModify;

end;
if umode=1 then   //  独立窗体
begin
   DIC_SOURCE_Form.Parent:=nil;
 // DIC_SOURCE_Form.Align:=alClient;
 // DIC_SOURCE_Form.BorderStyle:=bsnone;
  TabSheetDataModify.TabVisible:=False;

  self.rzPageCondition.ActivePage:=TabSheet1;
end;

DIC_SOURCE_Form.Show;
  DIC_SOURCE_Form.SetFocus;

end;

end.
