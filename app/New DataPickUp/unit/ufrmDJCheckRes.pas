unit ufrmDJCheckRes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Mask, Buttons,fBaseForm, DB,
  DBClient, uMainForm, RzButton;

type
  TfrmDJCheckRes = class(TBaseForm)
    pnl1: TPanel;
    txt3: TStaticText;
    edtSHZT: TMaskEdit;
    txt1: TStaticText;
    edtSSWG: TMaskEdit;
    rzbtbtnQuary: TRzBitBtn;
    edtPolice_Id: TMaskEdit;
    pnl2: TPanel;
    rzbtbtnCheck: TRzBitBtn;
    dbgrd2: TDBGrid;
    rzbtbtnExportDB: TRzBitBtn;
    txt2: TStaticText;
    datasetCheckQuery: TClientDataSet;
    DateSourceCheckQuary: TDataSource;
    txt5: TStaticText;
    edtSHDW: TMaskEdit;
    procedure rzbtbtnQuaryClick(Sender: TObject);
    procedure rzbtbtnCheckClick(Sender: TObject);
    procedure dbgrd2DblClick(Sender: TObject);
    procedure rzbtbtnExportDBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private  }
  public
    { Public declarations }
  end;

var
  frmDJCheckRes: TfrmDJCheckRes;

implementation
uses ufrmCheck, ufrmUpLoadRes, ufrmDJBrower,ExportDBGridExcel,
  ufrmCheckRes,ufrmDJCheck;
var frmCheck:TfrmCheck;
{$R *.dfm}


procedure TfrmDJCheckRes.rzbtbtnQuaryClick(Sender: TObject);
begin
  inherited;
  Self.dbgrd2.Refresh;
  Self.mGetSelectCdsByPanel(pnl1,datasetCheckQuery);
  self.mTranslateGrid(dbgrd2,'GRIDDING_DJ');
  Self.dbgrd2.Refresh;
end;



procedure TfrmDJCheckRes.rzbtbtnCheckClick(Sender: TObject);
var str:string;
begin
  inherited;
  if  datasetCheckQuery.Active = true then
    begin
    if datasetCheckQuery.FieldByName('SHZT').AsString='0'  then
    begin
      frmDJCheck1:= TfrmDJCheck.Create(self);
      frmDJCheck1.Show;
      str:=datasetCheckQuery.FieldByName('LSH').AsString;

    end
    else
    Application.messagebox('该资源已审批或已退回！','提示',mb_ok);
  end
  else
   Application.messagebox('请先查询！','提示',mb_ok);
end;

procedure TfrmDJCheckRes.dbgrd2DblClick(Sender: TObject);
var str:string;
var  frmDJBrower:TfrmDJBrower;
begin
  inherited;
  frmDJBrower:= TfrmDJBrower.Create(self);
  frmDJBrower.Show;
  str:=self.dbgrd2.DataSource.DataSet.FieldByName('LSH').AsString;
  frmDJBrower.getBrowerValue(str);
 // frmUpLoadRes.setBrowerValue(str);
end;


procedure TfrmDJCheckRes.rzbtbtnExportDBClick(Sender: TObject);
var frmExportDBGridExcel: TfrmExportDBGridExcel;
begin
  inherited;
  if  datasetCheckQuery.Active = true then
  begin
    frmExportDBGridExcel:=TfrmExportDBGridExcel.Create(self);
    frmExportDBGridExcel.ExportDBGrid(dbgrd2) ;
  end
  else
    Application.messagebox('请先查询！','提示',mb_ok);
end;

procedure TfrmDJCheckRes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmDJCheckRes:=nil;
end;

procedure TfrmDJCheckRes.FormCreate(Sender: TObject);
begin
  inherited;
  self.mRegistCntrl(pnl1,'GRIDDING_DJ');

  //self.mgetDbControl('edtSHDW').setLevelRootValue(self.mGetLoginUser.dwdm);
  self.mgetDbControl('edtSHDW').setDefaultValue(self.mGetLoginUser.dwdm);
  //edtGLDW.Enabled:=False;
end;

procedure TfrmDJCheckRes.FormActivate(Sender: TObject);
begin
  inherited;
  //frmDJCheckRes.rzbtbtnQuaryClick(Sender);
end;

end.
