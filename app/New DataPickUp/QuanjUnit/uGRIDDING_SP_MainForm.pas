unit uGRIDDING_SP_MainForm;

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
  cxPC, Mask, cxLocalization,ufrmDJCheck;

type actionType=(派出所审批,分局审批);
type
  TGRIDDING_SP_MainForm = class(TBaseForm)
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
    txt1: TStaticText;
    edtPolice_Id: TMaskEdit;
    txt5: TStaticText;
    edtSHDW: TMaskEdit;
    StaticText1: TStaticText;
    txt2: TStaticText;
    edtSSWG: TMaskEdit;
    edtSHZT: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBtnLookupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxSpinPageNoClick(Sender: TObject);
    procedure btnAddnewClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnDisplayClick(Sender: TObject);

  private
    { Private declarations }
     fActionType:actionType;
     listFieldName: TStringList;
     listFieldDisplay:TStringList;
     edtSHDW_Name:String ;
     frmDJCheck: TfrmDJCheck;
     Const _TableName='GRIDDING_DJ';
          _PkFieldName='LSH';
          _DBTYPE='ORACLE';
    procedure RefreshGrid(Const PageNo:String);
    procedure ShowDataModifyForm(umode:integer) ;

  public
    { Public declarations }
    procedure setActionType(ftype:actionType);
  end;


var
  GRIDDING_SP_MainForm: TGRIDDING_SP_MainForm;
  GRIDDING_FJSP_MainForm: TGRIDDING_SP_MainForm;
implementation



{$R *.dfm}



procedure TGRIDDING_SP_MainForm.RefreshGrid(const PageNo: String);
var strSql,strPageSql,strFrist,strLast:String;
var j:integer;
begin

  cds_table.Close;



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

  cds_table.Fields.Clear;

  self.mDBProvide.SelectCommand(cds_table,strSql,0);
  cds_table.Fields.Remove(cds_table.Fields[cds_table.FieldList.IndexOf('RN')]);
  for j := 0 to listFieldDisplay.Count - 2 do
  begin
     cds_table.Fields[cds_table.FieldList.IndexOf(listFieldName[j])].DisplayLabel:=listFieldDisplay[j];
  end;

  screen.Cursor:= crDefault;

  cxGrid1DBTableView1.DataController.KeyFieldNames:=self._PkFieldName;
 // RzPageMain.Enabled:=true;
  self.rzPageCondition.ActivePage:=TabSheet1;
  if cds_table.RecordCount>0  then
  begin
      self.btnAddnew.Enabled:=true;
      self.btnDisplay.Enabled:=true;
  end else
  begin
       self.btnAddnew.Enabled:=false;
       self.btnDisplay.Enabled:=false;
  end;
end;



procedure TGRIDDING_SP_MainForm.btnAddnewClick(Sender: TObject);
begin
  inherited;

  //GRIDDING_DJ_Form.actionType:=faddnew;
  if self.fActionType=派出所审批 then
        begin
        frmDJCheck.Caption:='派出所审批';
        TabSheetDataModify.Caption:='派出所审批';
         with  cxGrid1DBTableView1.DataController  do
        begin
            frmDJCheck.pkFieldValue:=DataSet.FieldByName(KeyFieldNames).Value;
        end;
        frmDJCheck.RzPageControl1.ActivePageIndex:=0;
        ShowDataModifyForm(1);
        frmDJCheck.actionType:=ufrmDJCheck.派出所审批;
  end;

    if self.fActionType=分局审批 then
        begin
        frmDJCheck.Caption:='分局审批';
         TabSheetDataModify.Caption:='分局审批';
         with  cxGrid1DBTableView1.DataController  do
        begin
            frmDJCheck.pkFieldValue:=DataSet.FieldByName(KeyFieldNames).Value;
        end;
         frmDJCheck.RzPageControl1.ActivePageIndex:=0;
        ShowDataModifyForm(1);
        frmDJCheck.actionType:=ufrmDJCheck.分局审批;
  end;


end;

procedure TGRIDDING_SP_MainForm.btnDisplayClick(Sender: TObject);
begin
  inherited;
   with  cxGrid1DBTableView1.DataController  do
  begin
      frmDJCheck.pkFieldValue:=DataSet.FieldByName(KeyFieldNames).Value;
  end;
  ShowDataModifyForm(1);
  frmDJCheck.actionType:=ufrmDJCheck.浏览数据;
  TabSheetDataModify.Caption:='浏览数据';

end;

procedure TGRIDDING_SP_MainForm.btnModifyClick(Sender: TObject);
var str:string;
begin

end;

procedure TGRIDDING_SP_MainForm.cxSpinPageNoClick(Sender: TObject);
begin
  inherited;
  RefreshGrid(cxSpinPageNo.Value);
end;


procedure TGRIDDING_SP_MainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  cxGrid1DBTableView1.DataController.DataSource:=nil;
  CDS_TABLE.Close;
  if self.fActionType=派出所审批 then GRIDDING_SP_MainForm:=NIL;
  if self.fActionType=分局审批 then GRIDDING_FJSP_MainForm:=NIL;


   listFieldName.free;
   listFieldDisplay.free;
end;



procedure TGRIDDING_SP_MainForm.FormCreate(Sender: TObject);
var cds:TClientDataSet;
var i:integer;
var fieldNames,displayNames:String;
begin
  inherited;
    edtSHDW_Name:='';
    frmDJCheck:= TfrmDJCheck.Create(self);
    frmDJCheck.Visible:=false;
    if sysutils.FileExists(GetCurrentDir+'\DevLocal.ini') then
    begin
        cxLocalizer1.FileName:=GetCurrentDir+'\DevLocal.ini';
        cxLocalizer1.Active:=true;
        cxLocalizer1.Locale:=2052;
    end;

  cds:=Self.getCdsGriddingPolice(mGetLoginUser.userid);
 // edtSSWG.Text:=cds.FieldByName('GRIDDING_NAME').AsString;


  self.rzPageCondition.ActivePage:=TabSheet1;
  TabSheetDataModify.TabVisible:=False;

  self.btnAddnew.Enabled:=false;
  self.btnDisplay.Enabled:=false;
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



procedure TGRIDDING_SP_MainForm.RzBtnLookupClick(Sender: TObject);
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




procedure TGRIDDING_SP_MainForm.setActionType(ftype: actionType);
begin
   fActionType:=ftype;
   if ftype=派出所审批 then
   begin
         self.Caption:='派出所审批';
         edtSHDW.Name:='edtSHDW';
         frmDJCheck.Visible:=false;
         //edtSHDW.Enabled:=false;
         self.mRegistCntrl(pnlCondition,_TableName);
     //  self.mgetDbControl('edtSHDW').setDefaultValue(self.mGetLoginUser.dwdm);

           self.mSetDbControlDefaultValue('edtSHDW',mGetLoginUser.dwdm);
   end;
   if ftype=分局审批 then
   begin
         self.Caption:='分局审批';
         frmDJCheck.Visible:=false;
        if  edtSHDW_Name<>'edtFJSPDW' then
        begin
          // edtSHDW.Enabled:=false;
           edtSHDW.Name:='edtFJSPDW';
           edtSHDW_Name:='edtFJSPDW';
           edtshzt.Name:='edtFJSPZT';
        end;
         self.mRegistCntrl(pnlCondition,_TableName);
         //self.mgetDbControl('edtFJSPDW').setDefaultValue(self.mGetLoginUser.dwdm);
           self.mSetDbControlDefaultValue('edtFJSPDW',self.mGetLoginUser.dwdm);
   end;
end;

procedure TGRIDDING_SP_MainForm.ShowDataModifyForm(umode:integer);
begin

if umode=0 then   //  显示在本窗体内
begin
  frmDJCheck.Parent:=TabSheetDataModify;
  frmDJCheck.Align:=alClient;
  frmDJCheck.BorderStyle:=bsnone;
  TabSheetDataModify.TabVisible:=True;
  self.rzPageCondition.ActivePage:=TabSheetDataModify;
end;
if umode=1 then   //  独立窗体
begin
   frmDJCheck.Parent:=nil;
 // GRIDDING_DJ_Form.Align:=alClient;
 // GRIDDING_DJ_Form.BorderStyle:=bsnone;
   TabSheetDataModify.TabVisible:=False;
   frmDJCheck.BorderStyle:=bsSingle;
   frmDJCheck.Align:=alnone;
   self.rzPageCondition.ActivePage:=TabSheet1;
   frmDJCheck.WindowState:=wsNormal;
end;

 frmDJCheck.Show;


end;

end.
