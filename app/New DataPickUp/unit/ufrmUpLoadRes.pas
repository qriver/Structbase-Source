unit ufrmUpLoadRes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Mask, Buttons,fBaseForm, DB,
  DBClient, RzButton;

type
  TfrmUpLoadRes = class(TBaseForm)
    pnl1: TPanel;
    btnQuary: TBitBtn;
    txt3: TStaticText;
    edtSHZT: TMaskEdit;
    pnl2: TPanel;
    txt1: TStaticText;
    edtDWBM: TMaskEdit;
    datasetUpQuery: TClientDataSet;
    DateSourceUpQuary: TDataSource;
    dbgrd1: TDBGrid;
    edtPolice_Id: TMaskEdit;
    rzbtbtn1: TRzBitBtn;
    rzbtbtn2: TRzBitBtn;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    txt2: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure btnQuaryClick(Sender: TObject);
    procedure setBrowerValue(str:string);
    procedure setModifyValue(str:string);
    procedure btnLogOffClick(Sender: TObject);
    procedure setLogOffValue(str:string);
    procedure dbgrd1DblClick(Sender: TObject);
    procedure rzbtbtn1Click(Sender: TObject);
    procedure rzbtbtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpLoadRes: TfrmUpLoadRes;

implementation
uses ufrmUpLoadDoc, ufrmUpLoadBrower,ufrmUpLoadModify, ufrmUpLoadLogOff;

{$R *.dfm}

procedure TfrmUpLoadRes.FormCreate(Sender: TObject);
begin
  self.mRegistCntrl(pnl1,'UPLOAD_LIST');
  self.mOpenInputProxy(pnl1);
  //self.mgetDbControl('edtDWBM').setLevelRootValue(self.mGetLoginUser.dwdm);
  self.dbControls.find('edtDWBM').setLevelRootValue(self.mGetLoginUser.dwdm);
  self.mSetDbControlDefaultValue('edtPolice_id',mGetLoginUser.userid);
 // Self.edtPolice_Id.Visible:=False;
end;

procedure TfrmUpLoadRes.btnQuaryClick(Sender: TObject);
var strsql:string;
begin
  inherited;
  Self.dbgrd1.Refresh;
  //strsql:='select * from UPLOAD_LIST where police_id = '''+mGetLoginUser.realusername+'''';
 // Self.mGetSelectCdsByPanel(pnl1,datasetUpQuery);
   strSql:=self.mGetSqlStr(pnl1);
   self.mDBProvide.SelectCommand(datasetUpQuery,strSql,0);
 // self.mTranslateGrid(dbgrd1,'UPLOAD_LIST');
  Self.dbgrd1.Refresh;
end;

procedure  TfrmUpLoadRes.setBrowerValue(str:string);
begin
  frmUpLoadBrower.getBrowerValue(str);
end;

procedure  TfrmUpLoadRes.setModifyValue(str:string);
begin
  frmUpLoadModify.getModifyValue(str);
end;

procedure  TfrmUpLoadRes.setLogOffValue(str:string);
begin
  frmUpLoadLogOff.getLogOffValue(str);
end;



procedure TfrmUpLoadRes.btnLogOffClick(Sender: TObject);
var str:string;
begin
  inherited;
  frmUpLoadLogOff:= TfrmUpLoadLogOff.Create(self);
  frmUpLoadLogOff.Show;
  str:=datasetUpQuery.FieldByName('LSH').AsString;
  frmUpLoadRes.setLogOffValue(str);
end;

procedure TfrmUpLoadRes.dbgrd1DblClick(Sender: TObject);
var str:string;
begin
  inherited;
  frmUpLoadBrower:= TfrmUpLoadBrower.Create(self);
  frmUpLoadBrower.Show;
  str:=datasetUpQuery.FieldByName('LSH').AsString;
  frmUpLoadRes.setBrowerValue(str);
end;

procedure TfrmUpLoadRes.rzbtbtn1Click(Sender: TObject);
var frmUpLoadDoc:TfrmUpLoadDoc;
begin
  inherited;
  frmUpLoadDoc:= TfrmUpLoadDoc.Create(self);
  frmUpLoadDoc.Show;
end;

procedure TfrmUpLoadRes.rzbtbtn2Click(Sender: TObject);
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

end.
