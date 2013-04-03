unit uGRIDDING_DJ_MainForm;

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
  TGRIDDING_DJ_MainForm = class(TBaseForm)
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
    GRIDDING_DJDESCRIPTION:TStringField;
    GRIDDING_DJDWBM:TStringField;
    GRIDDING_DJDWMC:TStringField;
    GRIDDING_DJGLDW:TStringField;
    GRIDDING_DJLSH:TStringField;
    GRIDDING_DJLXDH:TStringField;
    GRIDDING_DJPOLICE_ID:TStringField;
    GRIDDING_DJPOLICE_NAME:TStringField;
    GRIDDING_DJRESOURCE_ID:TStringField;
    GRIDDING_DJSHDW:TStringField;
    GRIDDING_DJSHSJ:TStringField;
    GRIDDING_DJSHSM:TStringField;
    GRIDDING_DJSHZT:TStringField;
    GRIDDING_DJSH_RYBH:TStringField;
    GRIDDING_DJSH_RYXM:TStringField;
    GRIDDING_DJSSWG:TStringField;
    GRIDDING_DJTITLE:TStringField;
    GRIDDING_DJUPLOAD_TIME:TStringField;
    TabSheetDataModify: TRzTabSheet;
    cxLocalizer1: TcxLocalizer;
    txt4: TStaticText;
    edtSSWG: TMaskEdit;
    txt3: TStaticText;
    edtSHZT: TMaskEdit;
    cxGrid1DBTableView1DWBM: TcxGridDBColumn;
    cxGrid1DBTableView1DWMC: TcxGridDBColumn;
    cxGrid1DBTableView1GLDW: TcxGridDBColumn;
    cxGrid1DBTableView1LXDH: TcxGridDBColumn;
    cxGrid1DBTableView1POLICE_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1RESOURCE_ID: TcxGridDBColumn;
    cxGrid1DBTableView1SHDW: TcxGridDBColumn;
    cxGrid1DBTableView1SHSJ: TcxGridDBColumn;
    cxGrid1DBTableView1SHSM: TcxGridDBColumn;
    cxGrid1DBTableView1SHZT: TcxGridDBColumn;
    cxGrid1DBTableView1SH_RYBH: TcxGridDBColumn;
    cxGrid1DBTableView1SH_RYXM: TcxGridDBColumn;
    cxGrid1DBTableView1SSWG: TcxGridDBColumn;
    cxGrid1DBTableView1TITLE: TcxGridDBColumn;
    cxGrid1DBTableView1UPLOAD_TIME: TcxGridDBColumn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRIPTION: TcxGridDBColumn;
    cxGrid1DBTableView1LSH: TcxGridDBColumn;
    cxGrid1DBTableView1POLICE_ID: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBtnLookupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxSpinPageNoClick(Sender: TObject);
    procedure btnAddnewClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnDisplayClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }
    listFieldDisplay:TStringList;
    listFieldName :TStringList;

    Const _TableName='GRIDDING_DJ';
          _PkFieldName='LSH';
          _DBTYPE='ACCESS';

    procedure RefreshGrid(Const PageNo:String);
    procedure ShowDataModifyForm(umode:integer) ;

  public
    { Public declarations }
  end;


var
  GRIDDING_DJ_MainForm: TGRIDDING_DJ_MainForm;

implementation

uses uGRIDDING_DJ_Form,uProfile;    //


{$R *.dfm}



procedure TGRIDDING_DJ_MainForm.RefreshGrid(const PageNo: String);
var strSql,strPageSql,strFrist,strLast:String;
var j:integer;
begin

  self.btnAddnew.Enabled:=true;
  self.btnDelete.Enabled:=true;
  self.btnModify.Enabled:=true;
  self.btnDisplay.Enabled:=true;



  strFrist:=(cxSpinPageNo.Value-1)*cxSpinPageNum.Value+1;
  strLast:=(cxSpinPageNo.Value)*cxSpinPageNum.Value ;

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
  cds_table.Close;
  cds_table.Fields.Clear;
  self.mDBProvide.SelectCommand(cds_table,strSql,0);

  if _DBTYPE<>'ACCESS' then
    cds_table.Fields.Remove(cds_table.Fields[cds_table.FieldList.IndexOf('RN')]);


  for j := 0 to listFieldDisplay.Count - 2 do
  begin
     cds_table.Fields[cds_table.FieldList.IndexOf(listFieldName[j])].DisplayLabel:=listFieldDisplay[j];
  end;

 // cds_table.Fields.Remove(cds_table.Fields[cds_table.FieldList.IndexOf('RN')]);

  screen.Cursor:= crDefault;
  cxGrid1DBTableView1.DataController.KeyFieldNames:=self._PkFieldName;
 // RzPageMain.Enabled:=true;
  self.rzPageCondition.ActivePage:=TabSheet1;
end;



procedure TGRIDDING_DJ_MainForm.btnAddnewClick(Sender: TObject);
begin
  inherited;
  TabSheetDataModify.Caption:='新增记录';
  GRIDDING_DJ_Form.actionType:=faddnew;
  ShowDataModifyForm(0);
end;

procedure TGRIDDING_DJ_MainForm.btnDisplayClick(Sender: TObject);
begin
  inherited;
  with  cxGrid1DBTableView1.DataController  do
  begin
      GRIDDING_DJ_Form.pkFieldValue:=DataSet.FieldByName(KeyFieldNames).Value;
  end;

  GRIDDING_DJ_Form.actionType:=fDisplay;
  TabSheetDataModify.Caption:='数据浏览';
  ShowDataModifyForm(0);
end;

procedure TGRIDDING_DJ_MainForm.btnModifyClick(Sender: TObject);
var str:string;
begin

  if cds_table.Active = true  then
  begin
    if cds_table.FieldByName('SHZT').AsString='0'  then
    begin
          with  cxGrid1DBTableView1.DataController  do
          begin
             GRIDDING_DJ_Form.pkFieldValue:=DataSet.FieldByName(KeyFieldNames).Value;
          end;
          TabSheetDataModify.Caption:='修改记录';
          GRIDDING_DJ_Form.actionType:=fupdate;
          ShowDataModifyForm(0);
    end
    else
    Application.messagebox('该资源已审批或已退回,无法修改！','提示',mb_ok);
  end
  else
  begin
     Application.messagebox('请先查询！','提示',mb_ok);
  end;







end;

procedure TGRIDDING_DJ_MainForm.cxSpinPageNoClick(Sender: TObject);
begin
  inherited;
  RefreshGrid(cxSpinPageNo.Value);
end;


procedure TGRIDDING_DJ_MainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  listFieldDisplay.Free;
  listFieldName.Free;

  cxGrid1DBTableView1.DataController.DataSource:=nil;
  CDS_TABLE.Close;
  GRIDDING_DJ_MainForm:=NIL;

end;



procedure TGRIDDING_DJ_MainForm.FormCreate(Sender: TObject);
var cds:TClientDataSet;
var i:integer;
var fieldNames,displayNames:String;
begin
  inherited;

  GRIDDING_DJ_Form:=TGRIDDING_DJ_Form.create(self);

  if sysutils.FileExists(GetCurrentDir+'\DevLocal.ini') then
  begin
      cxLocalizer1.FileName:=GetCurrentDir+'\DevLocal.ini';
      cxLocalizer1.Active:=true;
      cxLocalizer1.Locale:=2052;
  end;

  cds:=Self.getCdsGriddingPolice(mGetLoginUser.userid);
  edtSSWG.Text:=cds.FieldByName('GRIDDING_NAME').AsString;


  self.btnDelete.Enabled:=false;
  self.btnModify.Enabled:=false;
  self.btnDisplay.Enabled:=false;

  self.mRegistCntrl(pnlCondition,_TableName);
  self.rzPageCondition.ActivePage:=TabSheet1;
  TabSheetDataModify.TabVisible:=False;

    //记录记录集的原始定义
  listFieldName:=TStringList.Create;
  listFieldDisplay:=TStringList.Create;
  for i := 0 to cds_table.Fields.Count - 1 do
  begin
       fieldNames := fieldNames + cds_table.fields[i].FieldName + ',';
       displayNames:= displayNames +  cds_table.fields[i].DisplayLabel + ',';
  end;


  listFieldName.CommaText := fieldNames;
  listFieldDisplay.CommaText:= displayNames;
end;



procedure TGRIDDING_DJ_MainForm.FormDestroy(Sender: TObject);
begin

  inherited;
 // self.Close;
end;

procedure TGRIDDING_DJ_MainForm.RzBtnLookupClick(Sender: TObject);
var strSql:String;
begin
  inherited;
  cxSpinPageNo.Value:=1;
  RefreshGrid(cxSpinPageNo.Value);
  TabSheetDataModify.TabVisible:=False;
 // self.mTranslateCDS(cds_table,_TableName);
 self.mTranslateGrid(cxGrid1DBTableView1,_TableName);
//  self.mTranslateCDS(cds_table,_TableName);
end;




procedure TGRIDDING_DJ_MainForm.ShowDataModifyForm(umode:integer);
begin
if umode=0 then   //  显示在本窗体内
begin
  GRIDDING_DJ_Form.Parent:=TabSheetDataModify;
  GRIDDING_DJ_Form.Align:=alClient;
  GRIDDING_DJ_Form.BorderStyle:=bsnone;
  TabSheetDataModify.TabVisible:=True;
  self.rzPageCondition.ActivePage:=TabSheetDataModify;
end;
if umode=1 then   //  独立窗体
begin
   GRIDDING_DJ_Form.Parent:=nil;
 // GRIDDING_DJ_Form.Align:=alClient;
 // GRIDDING_DJ_Form.BorderStyle:=bsnone;
  TabSheetDataModify.TabVisible:=False;

  self.rzPageCondition.ActivePage:=TabSheet1;
end;

GRIDDING_DJ_Form.Show;


end;

end.
