unit ufrmTableDefine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls,DBClient,fBaseForm, ImgList,
  fTreeViewFrame, Menus, Mask, Buttons, RzButton, DBCtrls, Grids, DBGrids,
  DB;

type
  TfrmTableDefine = class(TBaseForm)
    pnl2: TPanel;
    txt6: TStaticText;
    txtlbl2: TStaticText;
    edtFIELD_CHNNAME: TMaskEdit;
    txt8: TStaticText;
    edtRESOURCE_NAME: TMaskEdit;
    edtFIELD_ENGNAME: TMaskEdit;
    edtXH: TMaskEdit;
    txt1: TStaticText;
    pnl3: TPanel;
    dbgrdColumn: TDBGrid;
    btnFieldModify: TButton;
    btnAddNew: TButton;
    btnSave: TButton;
    datasetRes_List: TClientDataSet;
    DateSourceRes_TableDefine: TDataSource;
    dataset_TableDefine: TClientDataSet;
    edtResource_id: TMaskEdit;
    btnQuary: TButton;
    edtLSH: TMaskEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MyNodeValue(resId:string);
    procedure btnAddNewClick(Sender: TObject);
    procedure btnFieldModifyClick(Sender: TObject);
    procedure dbgrdColumnDblClick(Sender: TObject);
    procedure btnQuaryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     constructor Create(AOwner: TComponent);override;
  end;

//var
  //frmTableDefine: TfrmTableDefine;

implementation
uses fDataResForm;
var flag:string;
var resid_qj:string;

{$R *.dfm}


procedure TfrmTableDefine.FormCreate(Sender: TObject);
begin
  inherited;
  self.mRegistCntrl(pnl2,'upload_tabledefine');
  edtResource_id.Visible:=False;
  edtLSH.Visible:=False;
  btnFieldModify.Enabled:=False;
  btnSave.Enabled:=False;
end;

procedure TfrmTableDefine.MyNodeValue(resId:string);
var strsql_resList:string;
begin
  edtFIELD_CHNNAME.Text:='';
  edtFIELD_ENGNAME.Text:='';
  edtXH.Text:='';
  strsql_resList:='select * from Resource_list where resource_id='''+resId+'''';
  Self.mDBProvide.SelectCommand(datasetRes_List,strsql_resList,0);
  edtRESOURCE_NAME.Text:=datasetRes_List.fieldbyname('RESOURCE_NAME').AsString;
  self.mSetDbControlDefaultValue('edtResource_id',datasetRes_List.fieldbyname('Resource_id').AsString);
 // self.mgetDbControl('edtResource_id').setDefaultValue(datasetRes_List.fieldbyname('Resource_id').AsString);
  resid_qj:=resid;




end;

procedure TfrmTableDefine.btnAddNewClick(Sender: TObject);
begin
  inherited;
  btnFieldModify.Enabled:=False;
  btnSave.Enabled:=True;
  edtFIELD_CHNNAME.Text:='';
  edtFIELD_ENGNAME.Text:='';
  edtXH.Text:='';
  edtLSH.Text:='';
  flag:='ADD';
end;

procedure TfrmTableDefine.btnSaveClick(Sender: TObject);
begin
  inherited;
  if flag='ADD' then
  Self.mInsertRecord(pnl2,'upload_tabledefine');
  if flag='Modify' then
  Self.mUpdateRecord(pnl2,'upload_tabledefine');
  Application.messagebox('已保存！','提示',mb_ok);
  btnSave.Enabled:=False;

end;

procedure TfrmTableDefine.btnFieldModifyClick(Sender: TObject);
begin
  inherited;
  btnSave.Enabled:=True;
  flag:='Modify';
end;

procedure TfrmTableDefine.dbgrdColumnDblClick(Sender: TObject);
begin
  inherited;
  btnFieldModify.Enabled:=True;
  //Self.mDisplayRecord(pnl2,'where resource_id='''+datasetRes_List.fieldbyname('resource_id').AsString+'''');
  Self.mDisplayRecord(pnl2,'where lsh='''+dataset_TableDefine.fieldbyname('lsh').AsString+'''');
end;

procedure TfrmTableDefine.btnQuaryClick(Sender: TObject);
var strsql_tabDefine:string;
begin
  inherited;
  strsql_tabDefine:='select * from upload_tabledefine where resource_id='''+resid_qj+'''';
  Self.mDBProvide.SelectCommand(dataset_tabledefine,strsql_tabDefine,0);
end;

constructor TfrmTableDefine.Create(AOwner: TComponent);
begin
  inherited;

end;

end.
