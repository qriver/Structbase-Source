unit uGRIDDING_TJ_MainForm;

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
  cxPC, Mask, cxLocalization,cxGridExportLink;

type
  TGRIDDING_TJ_MAINFORM = class(TBaseForm)
    rzPageCondition: TRzPageControl;
    TabSheet1: TRzTabSheet;
    pnlCondition: TPanel;
    txt4: TStaticText;
    edtQSSJ: TMaskEdit;
    txt3: TStaticText;
    edtZZSJ: TMaskEdit;
    RzToolbar1: TRzToolbar;
    RzBtnLookup: TRzToolButton;
    RzSpacer1: TRzSpacer;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    CDS_TABLE: TClientDataSet;
    DataSource1: TDataSource;
    cxLocalizer1: TcxLocalizer;
    Memo1: TMemo;
    CDS_TABLEFJSPDW: TStringField;
    CDS_TABLESHDW: TStringField;
    CDS_TABLESJ: TStringField;
    cxGrid1DBTableView1FJSPDW: TcxGridDBColumn;
    cxGrid1DBTableView1SHDW: TcxGridDBColumn;
    cxGrid1DBTableView1SJ: TcxGridDBColumn;
    cxGrid1DBTableView1SL: TcxGridDBColumn;
    RzToolButton1: TRzToolButton;
    Memo2: TMemo;
    RzToolButton2: TRzToolButton;
    PrintDialog1: TPrintDialog;
    SaveDialog1: TSaveDialog;
    CDS_TABLESL: TIntegerField;
    procedure RzBtnLookupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzToolButton1Click(Sender: TObject);
    procedure RzToolButton2Click(Sender: TObject);
  private
    { Private declarations }
         listFieldName: TStringList;
     listFieldDisplay:TStringList;
  public
    { Public declarations }
  end;

var
  GRIDDING_TJ_MAINFORM: TGRIDDING_TJ_MAINFORM;

implementation
uses strUtils;
{$R *.dfm}

procedure TGRIDDING_TJ_MAINFORM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   listFieldName.free;
  listFieldDisplay.free;
end;

procedure TGRIDDING_TJ_MAINFORM.FormCreate(Sender: TObject);
var i:integer;
var fieldNames,displayNames:String;
begin
  inherited;
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

procedure TGRIDDING_TJ_MAINFORM.RzBtnLookupClick(Sender: TObject);
var strSql,strWhere:String;
var j:integer;
begin
  cxGrid1DBTableView1.Columns[2].DataBinding.fieldname:='POLICE_ID';
   strWhere:='';
   if (self.edtQSSJ.text<>'') and (self.edtZZSJ.Text<>'')   then
          strWhere:='where upload_time>='''+self.edtQssj.text+''''
             + ' and upload_time<='''+self.edtQssj.text+'''';

   if (self.edtQSSJ.text<>'') and (self.edtZZSJ.Text='') then
          strWhere:='where upload_time>='''+self.edtQssj.text+'''';

   if (self.edtQSSJ.text='') and (self.edtZZSJ.Text<>'') then
          strWhere:='where upload_time<='''+self.edtQssj.text+'''';


   strSql:=self.Memo1.Text;
   strSql:=replacestr(strSql,#13#10,'');
   strSql:=format(strSql,[strWhere]);

  cds_table.DisableControls;
  cds_table.Fields.Clear;

  self.mDBProvide.SelectCommand(cds_table,strSql,0);
    cds_table.EnableControls;



    cxGrid1DBTableView1.DataController.KeyFieldNames:=''  ;
    //cxGrid1DBTableView1.Columns[2].DataBinding.fieldname:='POLICE_ID';
   // cxGrid1DBTableView1Sj.caption:='网格民警';
  // cds_table.Fields[2].FieldName:='Police_id';
   self.mTranslateGrid(cxGrid1DBTableView1,'GRIDDING_DJ');
     with   cxGrid1DBTableView1 do
  begin
        Columns[0].caption:='公安分局';
        Columns[1].caption:='派出所';
        Columns[2].caption:='网格民警';
        Columns[3].caption:='数据数量';
  end;

end;

procedure TGRIDDING_TJ_MAINFORM.RzToolButton1Click(Sender: TObject);
var strSql,strWhere:String;
var j:integer;
begin
   cxGrid1DBTableView1.Columns[2].DataBinding.fieldname:='RESOURCE_ID';
   strWhere:='';
   if (self.edtQSSJ.text<>'') and (self.edtZZSJ.Text<>'')   then
          strWhere:='where upload_time>='''+self.edtQssj.text+''''
             + ' and upload_time<='''+self.edtQssj.text+'''';

   if (self.edtQSSJ.text<>'') and (self.edtZZSJ.Text='') then
          strWhere:='where upload_time>='''+self.edtQssj.text+'''';

   if (self.edtQSSJ.text='') and (self.edtZZSJ.Text<>'') then
          strWhere:='where upload_time<='''+self.edtQssj.text+'''';


   strSql:=self.Memo2.Text;
   strSql:=replacestr(strSql,#13#10,'');
   strSql:=format(strSql,[strWhere]);

  cds_table.DisableControls;
  cds_table.Fields.Clear;

  self.mDBProvide.SelectCommand(cds_table,strSql,0);
    cds_table.EnableControls;



    cxGrid1DBTableView1.DataController.KeyFieldNames:=''  ;
    //cxGrid1DBTableView1.Columns[2].DataBinding.fieldname:='POLICE_ID';
   // cxGrid1DBTableView1Sj.caption:='网格民警';
  // cds_table.Fields[2].FieldName:='Police_id';
   self.mTranslateGrid(cxGrid1DBTableView1,'GRIDDING_DJ');

  with   cxGrid1DBTableView1 do
  begin
        Columns[0].caption:='公安分局';
        Columns[1].caption:='派出所';
        Columns[2].caption:='信息类别';
        Columns[3].caption:='数据数量';
  end;

end;

procedure TGRIDDING_TJ_MAINFORM.RzToolButton2Click(Sender: TObject);
begin
  inherited;
  SaveDialog1.Execute ;
  exportGridToExcel(SaveDialog1.FileName,cxgrid1,true,true,true,'xls');
end;

end.
