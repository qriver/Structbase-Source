unit uTemplateForm;

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
  cxPC, Mask;


type
  TTemplateForm = class(TBaseForm)
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
    edtColName: TMaskEdit;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    RzToolbar3: TRzToolbar;
    cxSpinPageNo: TcxSpinEdit;
    cxSpinPageNum: TcxSpinEdit;
    CDS_TABLE: TClientDataSet;
   <#AddCdsFieldControl>
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
    listFieldName: TStringList;
    listFieldDisplay:TStringList;
    Const _TableName='TABLEDEFINE';
          _PkFieldName='COLID';
          _DBTYPE='ACCESS';
    procedure RefreshGrid(Const PageNo:String);
    procedure ShowDataModifyForm(umode:integer) ;
  public
    { Public declarations }
  end;


var
  TemplateForm: TTemplateForm;

implementation

uses uTABLEDEFINEForm;    //


{$R *.dfm}



procedure TTemplateForm.RefreshGrid(const PageNo: String);
var strSql,strPageSql,strFrist,strLast:String;
var j:integer;
begin

  self.btnAddnew.Enabled:=true;
  self.btnDelete.Enabled:=true;
  self.btnModify.Enabled:=true;
  self.btnDisplay.Enabled:=true;
  cds_table.Close;


  strFrist:=(cxSpinPageNo.Value-1)*cxSpinPageNum.Value+1;
  strLast:=(cxSpinPageNo.Value)*cxSpinPageNum.Value ;

  strSql:=self.mGetSqlStr(pnlCondition);

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
  if _DBTYPE<>'ACCESS' then
  cds_table.Fields.Remove(cds_table.Fields[cds_table.FieldList.IndexOf('RN')]);
  for j := 0 to listFieldDisplay.Count - 2 do
  begin
     cds_table.Fields[cds_table.FieldList.IndexOf(listFieldName[j])].DisplayLabel:=listFieldDisplay[j];
  end;

 
  screen.Cursor:= crDefault;
  cxGrid1DBTableView1.DataController.KeyFieldNames:=self._PkFieldName;
 // RzPageMain.Enabled:=true;
  self.rzPageCondition.ActivePage:=TabSheet1;
end;



procedure TTemplateForm.btnAddnewClick(Sender: TObject);
begin
  inherited;
  TabSheetDataModify.Caption:='新增记录';
  TABLEDEFINEForm.actionType:=faddnew;
  ShowDataModifyForm(0);
end;

procedure TTemplateForm.btnDisplayClick(Sender: TObject);
begin
  inherited;
  with  cxGrid1DBTableView1.DataController  do
  begin
     TABLEDEFINEForm.pkFieldValue:=DataSet.FieldByName(KeyFieldNames).Value;
  end;
  
  TABLEDEFINEForm.actionType:=fDisplay;
  TabSheetDataModify.Caption:='数据浏览';
  ShowDataModifyForm(0);
end;

procedure TTemplateForm.btnModifyClick(Sender: TObject);
begin
  inherited;
  with  cxGrid1DBTableView1.DataController  do
  begin
     TABLEDEFINEForm.pkFieldValue:=DataSet.FieldByName(KeyFieldNames).Value;
  end;
  TabSheetDataModify.Caption:='修改记录';
  TABLEDEFINEForm.actionType:=fupdate;
  ShowDataModifyForm(0);
end;

procedure TTemplateForm.cxSpinPageNoClick(Sender: TObject);
begin
  inherited;
  RefreshGrid(cxSpinPageNo.Value);
end;


procedure TTemplateForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  cxGrid1DBTableView1.DataController.DataSource:=nil;
  CDS_TABLE.Close;
  TemplateForm:=NIL;
  
  listFieldName.free;
  listFieldDisplay.free;
end;



procedure TTemplateForm.FormCreate(Sender: TObject);
var i:integer;
var fieldNames,displayNames:String;
begin
  inherited;
  
  TABLEDEFINEForm:=TTABLEDEFINEForm.create(self);
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

procedure TTemplateForm.RzBtnLookupClick(Sender: TObject);
var strSql:String;
begin
  inherited;
  cxSpinPageNo.Value:=1;
  RefreshGrid(cxSpinPageNo.Value);
  TabSheetDataModify.TabVisible:=False;
end;




procedure TTemplateForm.ShowDataModifyForm(umode:integer);
begin
if umode=0 then   //  显示在本窗体内
begin
  TABLEDEFINEForm.Parent:=TabSheetDataModify;
  TABLEDEFINEForm.Align:=alClient;
  TABLEDEFINEForm.BorderStyle:=bsnone;
  TabSheetDataModify.TabVisible:=True;
  self.rzPageCondition.ActivePage:=TabSheetDataModify;
end;
if umode=1 then   //  独立窗体
begin
   TABLEDEFINEForm.Parent:=nil;
 // TABLEDEFINEForm.Align:=alClient;
 // TABLEDEFINEForm.BorderStyle:=bsnone;
  TabSheetDataModify.TabVisible:=False;

  self.rzPageCondition.ActivePage:=TabSheet1;
end;

TABLEDEFINEForm.Show;


end;

end.
