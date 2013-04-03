unit uGRIDDING_JC_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxContainer, StdCtrls, Mask, ExtCtrls, DBClient, cxLocalization, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, RzPanel, RzButton,
  RzTabs,fBaseForm;

type
  TGridding_JC_MainForm = class(TBaseForm)
    rzPageCondition: TRzPageControl;
    TabSheet1: TRzTabSheet;
    RzToolbar1: TRzToolbar;
    RzBtnLookup: TRzToolButton;
    RzSpacer1: TRzSpacer;
    RzBtnCount: TRzToolButton;
    RzSpacer2: TRzSpacer;
    RzSpacer3: TRzSpacer;
    RzSpacer4: TRzSpacer;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    RzToolbar3: TRzToolbar;
    cxSpinPageNo: TcxSpinEdit;
    cxSpinPageNum: TcxSpinEdit;
    DataSource1: TDataSource;
    cxLocalizer1: TcxLocalizer;
    CDS_TABLE: TClientDataSet;
    GRIDDING_DJDESCRIPTION: TStringField;
    GRIDDING_DJDWBM: TStringField;
    GRIDDING_DJDWMC: TStringField;
    GRIDDING_DJGLDW: TStringField;
    GRIDDING_DJLSH: TStringField;
    GRIDDING_DJLXDH: TStringField;
    GRIDDING_DJPOLICE_ID: TStringField;
    GRIDDING_DJPOLICE_NAME: TStringField;
    GRIDDING_DJRESOURCE_ID: TStringField;
    GRIDDING_DJSHDW: TStringField;
    GRIDDING_DJSHSJ: TStringField;
    GRIDDING_DJSHSM: TStringField;
    GRIDDING_DJSHZT: TStringField;
    GRIDDING_DJSH_RYBH: TStringField;
    GRIDDING_DJSH_RYXM: TStringField;
    GRIDDING_DJSSWG: TStringField;
    GRIDDING_DJTITLE: TStringField;
    GRIDDING_DJUPLOAD_TIME: TStringField;
    pnlCondition: TPanel;
    txt1: TStaticText;
    edtPolice_Id: TMaskEdit;
    txt5: TStaticText;
    edtSHDW: TMaskEdit;
    StaticText1: TStaticText;
    txt2: TStaticText;
    edtSHSJ: TMaskEdit;
    edtSHZT: TMaskEdit;
    StaticText2: TStaticText;
    edtFJSPDW: TMaskEdit;
    StaticText3: TStaticText;
    edtFJSPSJ: TMaskEdit;
    StaticText4: TStaticText;
    edtGLDW: TMaskEdit;
    btnDisplay: TRzToolButton;
    cxGrid1DBTableView1DESCRIPTION: TcxGridDBColumn;
    cxGrid1DBTableView1DWBM: TcxGridDBColumn;
    cxGrid1DBTableView1DWMC: TcxGridDBColumn;
    cxGrid1DBTableView1GLDW: TcxGridDBColumn;
    cxGrid1DBTableView1LSH: TcxGridDBColumn;
    cxGrid1DBTableView1LXDH: TcxGridDBColumn;
    cxGrid1DBTableView1POLICE_ID: TcxGridDBColumn;
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
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    StaticText5: TStaticText;
    edtFJSPZT: TMaskEdit;
    StaticText6: TStaticText;
    edtUPLOAD_TIME: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure RzBtnLookupClick(Sender: TObject);
    procedure btnDisplayClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    listFieldDisplay:TStringList;
    listFieldName :TStringList;
    Const _TableName='GRIDDING_DJ';
          _PkFieldName='LSH';
          _DBTYPE='ORACLE';
    procedure RefreshGrid(Const PageNo:String);
    procedure ShowDataModifyForm(umode:integer) ;

  public
    { Public declarations }
  end;

var
  Gridding_JC_MainForm: TGridding_JC_MainForm;

implementation
uses uGRIDDING_TJ_MainForm;
//var mFrmDjCheck:TfrmDJCheck ;
{$R *.dfm}

{ TGridding_JC_MainForm }

procedure TGridding_JC_MainForm.btnDisplayClick(Sender: TObject);
begin
{
  inherited;
   with  cxGrid1DBTableView1.DataController  do
  begin
      mFrmDjCheck.pkFieldValue:=DataSet.FieldByName(KeyFieldNames).Value;
  end;
  ShowDataModifyForm(1);
  mFrmDjCheck.actionType:=ufrmDJCheck.浏览数据;
  mFrmDjCheck.Caption:='浏览数据';
  mFrmDjCheck.Visible:=TRUE;
  }
end;

procedure TGridding_JC_MainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Gridding_JC_MainForm:=nil;
end;

procedure TGridding_JC_MainForm.FormCreate(Sender: TObject);
var cds:TClientDataSet;
var i:integer;
var fieldNames,displayNames:String;
begin
  //mFrmDjCheck:= TfrmDJCheck.Create(self);
 // mFrmDjCheck.Visible:=FALSE;
  GRIDDING_TJ_MAINFORM:=TGRIDDING_TJ_MAINFORM.Create(self);
  GRIDDING_TJ_MAINFORM.BorderStyle:=bsNone;
  GRIDDING_TJ_MAINFORM.Parent:=self.TabSheet2;
  GRIDDING_TJ_MAINFORM.Align:=alClient;
  GRIDDING_TJ_MAINFORM.Show ;

  if sysutils.FileExists(GetCurrentDir+'\DevLocal.ini') then
  begin
      cxLocalizer1.FileName:=GetCurrentDir+'\DevLocal.ini';
      cxLocalizer1.Active:=true;
      cxLocalizer1.Locale:=2052;
  end;



  self.mRegistCntrl(pnlCondition,_TableName);
  self.rzPageCondition.ActivePage:=TabSheet1;
  self.btnDisplay.Enabled:=false;


      //记录记录集的原始定义
  listFieldName:=TStringList.Create;

  for i := 0 to cds_table.Fields.Count - 1 do
  begin
       fieldNames := fieldNames + cds_table.fields[i].FieldName + ',';
       displayNames:= displayNames +  cds_table.fields[i].DisplayLabel + ',';
  end;


end;



procedure TGridding_JC_MainForm.RzBtnLookupClick(Sender: TObject);
begin
  cxSpinPageNo.Value:=1;
  RefreshGrid(cxSpinPageNo.Value);

  //self.mTranslateGrid(cxGrid1DBTableView1,_TableName);
end;

procedure TGridding_JC_MainForm.ShowDataModifyForm(umode: integer);
begin

end;

procedure TGRIDDING_JC_MainForm.RefreshGrid(const PageNo: String);
var strSql,strPageSql,strFrist,strLast:String;
var j:integer;
begin

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

  screen.Cursor:= crDefault;
  cxGrid1DBTableView1.DataController.KeyFieldNames:=self._PkFieldName;

  self.rzPageCondition.ActivePage:=TabSheet1;

  for j := 0 to listFieldDisplay.Count - 2 do
  begin
     cds_table.Fields[cds_table.FieldList.IndexOf(listFieldName[j])].DisplayLabel:=listFieldDisplay[j];
  end;


  if cds_table.RecordCount>0  then
  begin
     // self.btnAddnew.Enabled:=true;
      self.btnDisplay.Enabled:=true;
  end else
  begin
      // self.btnAddnew.Enabled:=false;
       self.btnDisplay.Enabled:=false;
  end;
end;


end.
