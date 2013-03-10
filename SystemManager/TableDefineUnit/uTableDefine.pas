unit uTableDefine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, ExtCtrls, Buttons, DBCtrls, DB,
  fBaseForm, dbclient, CommonBpl_DBFormBaseEx;


type
  TfrmTableDefine = class(TBaseForm)
    pnl1: TPanel;
    dgTable: TDBGrid;
    pnl3: TPanel;
    dgColumn: TDBGrid;
    btnAppFInd: TButton;
    ds1: TDataSource;
    lbl1: TLabel;
    CbbAppName: TDBLookupComboBox;
    ds2: TDataSource;
    cdsColumn: TClientDataSet;
    dsColumn: TDataSource;
    Panel1: TPanel;
    txt6: TStaticText;
    txtlbl2: TStaticText;
    edtColChineseName: TMaskEdit;
    txtlbl3: TStaticText;
    edtColLength: TMaskEdit;
    txtlbl4: TStaticText;
    edtPkFlag: TMaskEdit;
    txtlbl15: TStaticText;
    edtDicId: TMaskEdit;
    txtPkBuild: TStaticText;
    edtPKBuild: TMaskEdit;
    txt7: TStaticText;
    edtTableName: TMaskEdit;
    txt8: TStaticText;
    edtAppId: TMaskEdit;
    edtColName: TMaskEdit;
    edtColXH: TMaskEdit;
    txt1: TStaticText;
    edtColType: TMaskEdit;
    StaticText2: TStaticText;
    btnTableAdd: TButton;
    btnEdit: TButton;
    btnFieldModify: TButton;
    btnAddNew: TButton;
    btnFieldSave: TButton;
    StaticText1: TStaticText;
    edtColId: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnAppFIndClick(Sender: TObject);
    procedure btnTableAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure dgTableDblClick(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btnFieldModifyClick(Sender: TObject);
    procedure btnFieldSaveClick(Sender: TObject);
    procedure dgColumnDblClick(Sender: TObject);
    procedure btnAddNewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
     action:String;
  public
       constructor Create(AOwner: TComponent);override;
    { Public declarations }
  end;


var TableFrom: TFrmTableDefine ;
implementation
uses     uTableAdd;

{$R *.dfm}

procedure TfrmTableDefine.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  TableFrom:=nil;
end;

procedure TfrmTableDefine.FormCreate(Sender: TObject);
var CDSApp:TClientDataSet;
  uList:TStringList;
  i:integer;
  str:string;
begin
  frmTableAdd:=TfrmTableAdd.Create(self);

  
  cdsApp:=TclientDataSet.create(self);
  self.mDBProvide.SelectCommand(cdsapp,'select * from app_name',0);
  cdsapp.First;
  ds1.DataSet:=cdsapp;

  cbbAppName.Refresh;
  cbbAppName.KeyValue:=cdsapp.fieldbyname('appid').AsString;

  frmTableAdd.ds2:=cdsapp;
  frmTableAdd.ds1.DataSet:=frmTableAdd.ds2;
  frmTableAdd.CbbAppName.Refresh;
  frmTableAdd.CbbAppName.KeyValue:=cdsapp.fieldbyname('appid').AsString;

     
  
end;

procedure TfrmTableDefine.btnAppFIndClick(Sender: TObject);
var cdsTable:TClientDataSet;
var strSql:String;
begin
  strSql:='select * from app_table_name where appid='''+cbbAppName.KeyValue+'''';
  cdsTable:=TclientDataSet.create(self);
  self.mDBProvide.SelectCommand(cdsTable,strSql,0);
  ds2.DataSet:=cdsTable;
  dgTable.Refresh;

end;

procedure TfrmTableDefine.btnTableAddClick(Sender: TObject);
begin
  inherited;
   frmTableAdd.addNewReady;
   frmTableAdd.ShowModal;

end;

procedure TfrmTableDefine.btnEditClick(Sender: TObject);
var s1,s2:String;
begin
     s1:= dgtable.DataSource.DataSet.fieldbyname('table_name').AsString;
     s2:=dgtable.DataSource.DataSet.fieldbyname('table_chineseName').AsString;
     frmTableAdd.editReady(s1,s2,cbbAppName.KeyValue);
     frmTableAdd.ShowModal;

end;

procedure TfrmTableDefine.dgTableDblClick(Sender: TObject);
var strSql:String;
var s1,s2:String;
begin
     s1:= dgtable.DataSource.DataSet.fieldbyname('table_name').AsString;
     s2:=dgtable.DataSource.DataSet.fieldbyname('table_chineseName').AsString;
  strSql:='select * from tabledefine where tablename='''+s1+'''';
  strSql:=strSql+' and appid='''+cbbAppName.KeyValue+'''' ;
  self.mDBProvide.SelectCommand(cdsColumn,strSql,0);
  self.dgColumn.DataSource:=self.dsColumn;
  dsColumn.DataSet:=self.cdsColumn;
  self.dgColumn.Refresh;
end;

procedure TfrmTableDefine.btn4Click(Sender: TObject);
begin

  self.mRegistCntrl(panel1,'TABLEDEFINE');
end;

 

constructor TfrmTableDefine.Create(AOwner: TComponent);
begin
  inherited;
   //self.
end;



procedure TfrmTableDefine.btnFieldModifyClick(Sender: TObject);
begin
  self.mRegistCntrl(panel1,'TABLEDEFINE');
  self.mOpenInputProxy(panel1);
  self.mDisplayRecord(panel1,self.dgColumn.DataSource.DataSet as TClientDataSet);
  self.edtTableName.ReadOnly:=true;
  self.edtTableName.ReadOnly:=true;
  action:='MODIFY';
end;

procedure TfrmTableDefine.btnFieldSaveClick(Sender: TObject);
begin
  inherited;
  if action='MODIFY' then
    self.mUpdateRecord(Panel1,'TABLEDEFINE');
  if action='ADDNEW' then
     self.mInsertRecord(Panel1,'TABLEDEFINE');
    dgTableDblClick(self);
end;

procedure TfrmTableDefine.dgColumnDblClick(Sender: TObject);
begin
  inherited;
  btnFieldModifyClick(self);
end;

procedure TfrmTableDefine.btnAddNewClick(Sender: TObject);
begin
  inherited;
  action:='ADDNEW';

  self.mRegistCntrl(panel1,'TABLEDEFINE');

  self.mCleanPanel(self.Panel1);

  self.mOpenInputProxy(panel1);
  self.edtTableName.Text:=dgtable.DataSource.DataSet.fieldbyname('table_name').AsString;
  self.edtAppId.Text:= cbbAppName.KeyValue;
  self.edtColId.Text:=self.mGetGuid;
  self.edtTableName.ReadOnly:=true;
  self.edtTableName.ReadOnly:=true;
   self.edtColId.ReadOnly:=true;
end;

end.
