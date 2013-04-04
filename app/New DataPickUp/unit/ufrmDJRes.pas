unit ufrmDJRes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Mask, Buttons,fBaseForm, DB,
  DBClient, RzButton;

type
  TfrmDJRes = class(TBaseForm)
    pnl1: TPanel;
    txt3: TStaticText;
    edtSHZT: TMaskEdit;
    pnl2: TPanel;
    datasetUpQuery: TClientDataSet;
    DateSourceUpQuary: TDataSource;
    dbgrd1: TDBGrid;
    edtSSWG: TMaskEdit;
    rzbtbtn1: TRzBitBtn;
    rzbtbtn2: TRzBitBtn;
    rzbQuary: TRzBitBtn;
    procedure setBrowerValue(str:string);
    procedure setModifyValue(str:string);
    procedure btnLogOffClick(Sender: TObject);
    procedure setLogOffValue(str:string);
    procedure dbgrd1DblClick(Sender: TObject);
    procedure rzbtbtn1Click(Sender: TObject);
    procedure rzbtbtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rzbQuaryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDJRes: TfrmDJRes;

implementation
uses ufrmUpLoadDoc, ufrmUpLoadBrower,ufrmUpLoadModify, ufrmUpLoadLogOff,
  ufrmUpLoadRes,ufrmDJAdd, ufrmDJBrower;

var frmDJAdd:TfrmDJAdd;


{$R *.dfm}


procedure  TfrmDJRes.setBrowerValue(str:string);
begin
  frmDJBrower.getBrowerValue(str);
end;

procedure  TfrmDJRes.setModifyValue(str:string);
begin
  frmUpLoadModify.getModifyValue(str);
end;

procedure  TfrmDJRes.setLogOffValue(str:string);
begin
  frmUpLoadLogOff.getLogOffValue(str);
end;

procedure TfrmDJRes.btnLogOffClick(Sender: TObject);
var str:string;
begin
  inherited;
  frmUpLoadLogOff:= TfrmUpLoadLogOff.Create(self);
  frmUpLoadLogOff.Show;
  str:=datasetUpQuery.FieldByName('LSH').AsString;
  frmDJRes.setLogOffValue(str);
end;

procedure TfrmDJRes.dbgrd1DblClick(Sender: TObject);
var str:string;
begin
  inherited;
  frmDJBrower:= TfrmDJBrower.Create(self);
  frmDJBrower.Show;
  str:=datasetUpQuery.FieldByName('LSH').AsString;
  frmDJRes.setBrowerValue(str);
end;

procedure TfrmDJRes.rzbQuaryClick(Sender: TObject);
begin
  inherited;
  Self.dbgrd1.Refresh;
  Self.mGetSelectCdsByPanel(pnl1,datasetUpQuery);
  self.mTranslateGrid(dbgrd1,'GRIDDING_DJ');
  Self.dbgrd1.Refresh;
end;

procedure TfrmDJRes.rzbtbtn1Click(Sender: TObject);
begin
  inherited;
  frmDJAdd.Visible:=true;
  frmDJAdd.rzbtbtnSave.Enabled:=True;
  frmDJAdd.edtLSH.Text:= frmDJAdd.mGetGuid;
  frmDJAdd.edtTitle.Text:='';
  frmDJAdd.edtDESCRIPTION.Text:='';
  frmDJAdd.mmo1.Lines.Text:='';
end;

procedure TfrmDJRes.rzbtbtn2Click(Sender: TObject);
var str:string;
begin
  inherited;
  if datasetUpQuery.Active = true  then
  begin
    if datasetUpQuery.FieldByName('SHZT').AsString='0'  then
    begin
      frmUpLoadModify:= TfrmUpLoadModify.Create(self);
      frmUpLoadModify.Show;
      str:=datasetUpQuery.FieldByName('LSH').AsString;
      frmUpLoadRes.setModifyValue(str);
    end
    else
    Application.messagebox('该资源已审批或已退回,无法修改！','提示',mb_ok);
  end
  else
  begin
     Application.messagebox('请先查询！','提示',mb_ok);
  end;
end;

procedure TfrmDJRes.FormCreate(Sender: TObject);
var cds:TClientDataSet;
begin
  inherited;
  frmDJAdd:=TfrmDJAdd.Create(self);
  self.mRegistCntrl(pnl1,'GRIDDING_DJ');
  //self.mgetDbControl('edtDWBM').setLevelRootValue(self.mGetLoginUser.dwdm);
  //self.mgetDbControl('edtPolice_id').setDefaultValue(mGetLoginUser.userid);
 

  cds:=Self.getCdsGriddingPolice(mGetLoginUser.userid);
  edtSSWG.Text:=cds.FieldByName('GRIDDING_NAME').AsString;

  rzbtbtn2.Enabled:=False;
end;

end.
