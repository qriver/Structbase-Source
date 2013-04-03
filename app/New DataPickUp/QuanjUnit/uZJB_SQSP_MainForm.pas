unit uZJB_SQSP_MainForm;

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
  TZJB_SQSP_MainForm = class(TBaseForm)
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
   
ZJB_SQSPBGYY:TWideStringField; 
ZJB_SQSPBGZT:TWideStringField; 
ZJB_SQSPBZLDBH:TWideStringField; 
ZJB_SQSPFH:TWideStringField; 
ZJB_SQSPFHHZ:TWideStringField; 
ZJB_SQSPID:TWideStringField; 
ZJB_SQSPJLTS:TWideStringField; 
ZJB_SQSPJLX:TWideStringField; 
ZJB_SQSPLDH:TWideStringField; 
ZJB_SQSPMAP_X:TWideStringField; 
ZJB_SQSPMAP_Y:TWideStringField; 
ZJB_SQSPMPH:TWideStringField; 
ZJB_SQSPMPHZ:TWideStringField; 
ZJB_SQSPMPQZ:TWideStringField; 
ZJB_SQSPSPDW:TWideStringField; 
ZJB_SQSPSPR:TWideStringField; 
ZJB_SQSPSPSJ:TWideStringField; 
ZJB_SQSPSPTHYY:TWideStringField; 
ZJB_SQSPSPZT:TWideStringField; 
ZJB_SQSPSQDW:TWideStringField; 
ZJB_SQSPSQLB:TWideStringField; 
ZJB_SQSPSQR:TWideStringField; 
ZJB_SQSPSQSJ:TWideStringField; 
ZJB_SQSPSSJWQ:TWideStringField; 
ZJB_SQSPSSXQ:TWideStringField; 
ZJB_SQSPZLHZ:TWideStringField; 
ZJB_SQSPZLQZ:TWideStringField; 
    TabSheetDataModify: TRzTabSheet;
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
    Const _TableName='ZJB_SQSP';
          _PkFieldName='ID';
          _DBTYPE='ACCESS';
    procedure RefreshGrid(Const PageNo:String);
    procedure ShowDataModifyForm(umode:integer) ;
  public
    { Public declarations }
  end;


var
  ZJB_SQSP_MainForm: TZJB_SQSP_MainForm;

implementation

uses uZJB_SQSP_Form;    //


{$R *.dfm}



procedure TZJB_SQSP_MainForm.RefreshGrid(const PageNo: String);
var strSql,strPageSql,strFrist,strLast:String;
begin

  self.btnAddnew.Enabled:=true;
  self.btnDelete.Enabled:=true;
  self.btnModify.Enabled:=true;
  self.btnDisplay.Enabled:=true;
  cds_table.Close;


  strFrist:=(cxSpinPageNo.Value-1)*cxSpinPageNum.Value+1;
  strLast:=(cxSpinPageNo.Value)*cxSpinPageNum.Value ;

  strSql:=self.mGetSqlByPanel(pnlCondition) ;

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



procedure TZJB_SQSP_MainForm.btnAddnewClick(Sender: TObject);
begin
  inherited;
  TabSheetDataModify.Caption:='新增记录';
  ZJB_SQSP_Form.actionType:=faddnew;
  ShowDataModifyForm(0);
end;

procedure TZJB_SQSP_MainForm.btnDisplayClick(Sender: TObject);
begin
  inherited;
  with  cxGrid1DBTableView1.DataController  do
  begin
     DIC_SOURCE_Form.pkFieldValue:=DataSet.FieldByName(KeyFieldNames).Value;
  end;
  
  ZJB_SQSP_Form.actionType:=fDisplay;
  TabSheetDataModify.Caption:='数据浏览';
  ShowDataModifyForm(0);
end;

procedure TZJB_SQSP_MainForm.btnModifyClick(Sender: TObject);
begin
  inherited;
  with  cxGrid1DBTableView1.DataController  do
  begin
     ZJB_SQSP_Form.pkFieldValue:=DataSet.FieldByName(KeyFieldNames).Value;
  end;
  TabSheetDataModify.Caption:='修改记录';
  ZJB_SQSP_Form.actionType:=fupdate;
  ShowDataModifyForm(0);
end;

procedure TZJB_SQSP_MainForm.cxSpinPageNoClick(Sender: TObject);
begin
  inherited;
  RefreshGrid(cxSpinPageNo.Value);
end;


procedure TZJB_SQSP_MainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  cxGrid1DBTableView1.DataController.DataSource:=nil;
  CDS_TABLE.Close;
  ZJB_SQSP_MainForm:=NIL;
end;



procedure TZJB_SQSP_MainForm.FormCreate(Sender: TObject);
begin
  inherited;
  
  ZJB_SQSP_Form:=TZJB_SQSP_Form.create(self);
  if sysutils.FileExists(GetCurrentDir+'\DevLocal.ini') then
  begin
      cxLocalizer1.FileName:=GetCurrentDir+'\DevLocal.ini';
      cxLocalizer1.Active:=true;
      cxLocalizer1.Locale:=2052;
  end;
  
 
       
  self.btnDelete.Enabled:=false;
  self.btnModify.Enabled:=false;
  self.btnDisplay.Enabled:=false;

  self.mRegistCntrl(pnlCondition,_TableName);
  self.rzPageCondition.ActivePage:=TabSheet1;
  TabSheetDataModify.TabVisible:=False;
end;

procedure TZJB_SQSP_MainForm.RzBtnLookupClick(Sender: TObject);
var strSql:String;
begin
  inherited;
  cxSpinPageNo.Value:=1;
  RefreshGrid(cxSpinPageNo.Value);
  TabSheetDataModify.TabVisible:=False;
end;




procedure TZJB_SQSP_MainForm.ShowDataModifyForm(umode:integer);
begin
if umode=0 then   //  显示在本窗体内
begin
  ZJB_SQSP_Form.Parent:=TabSheetDataModify;
  ZJB_SQSP_Form.Align:=alClient;
  ZJB_SQSP_Form.BorderStyle:=bsnone;
  TabSheetDataModify.TabVisible:=True;
  self.rzPageCondition.ActivePage:=TabSheetDataModify;
end;
if umode=1 then   //  独立窗体
begin
   ZJB_SQSP_Form.Parent:=nil;
 // ZJB_SQSP_Form.Align:=alClient;
 // ZJB_SQSP_Form.BorderStyle:=bsnone;
  TabSheetDataModify.TabVisible:=False;

  self.rzPageCondition.ActivePage:=TabSheet1;
end;

ZJB_SQSP_Form.Show;


end;

end.
