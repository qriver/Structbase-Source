unit ufrmUpLoadDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls,DBClient,fBaseForm, ImgList,
  fTreeViewFrame, Menus, Mask, Buttons, RzButton,ShellAPI;

type
  TfrmUpLoadDoc = class(TBaseForm)
    pnl2: TPanel;
    TreeViewFrame1: TTreeViewFrame;
    pgc1: TPageControl;
    ts1: TTabSheet;
    edtWJLJ: TMaskEdit;
    dlgOpen1: TOpenDialog;
    btnFileUpload: TRzBitBtn;
    btnFileSelect: TRzBitBtn;
    pnl1: TPanel;
    txtlbl2: TStaticText;
    edtResource_id: TMaskEdit;
    txt1: TStaticText;
    edtPOLICE_ID: TMaskEdit;
    txt2: TStaticText;
    edtDWBM: TMaskEdit;
    txt5: TStaticText;
    edtUPLOAD_TIME: TMaskEdit;
    txt4: TStaticText;
    edtFROM_DW: TMaskEdit;
    edtDESCRIPTION: TMaskEdit;
    txt3: TStaticText;
    StaticText1: TStaticText;
    edtLSH: TMaskEdit;
    btnSave: TRzBitBtn;
    edtTitle1: TStaticText;
    edtTitle: TMaskEdit;
    StaticText2: TStaticText;
    edtLXDH: TMaskEdit;
    txt6: TStaticText;
    edtJLTS: TMaskEdit;
    lbl1: TLabel;
    txt7: TStaticText;
    edtSJZT: TMaskEdit;
    edtSHZT: TMaskEdit;
    procedure menuDrawClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure addNewClick(Sender: TObject);
    procedure btnFileUploadClick(Sender: TObject);
    procedure btnFileSelectClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure TreeViewFrame1tvResourceDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


//    procedure rzbtbtnFTPUploadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var frmUpLoadDoc: TfrmUpLoadDoc;


implementation
uses fResourceForm;
var frmResource: TResourceForm;

{$R *.dfm}

procedure TfrmUpLoadDoc.menuDrawClick(Sender: TObject);
var acds:TClientDataSet;
begin
  inherited;
  acds:=Tclientdataset.Create(self);
  self.mDBProvide.SelectCommand(acds,'select * from resource_list',0);
  TreeViewFrame1.setDataSource(acds);
  TreeViewFrame1.displayField:='Resource_name';
  TreeViewFrame1.keyField:='Resource_id';
  TreeViewFrame1.parentField:='Parent_id';
  TreeViewFrame1.DrawTreeView;
end;

procedure TfrmUpLoadDoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmUpLoadDoc:=nil;
end;

procedure TfrmUpLoadDoc.FormCreate(Sender: TObject);
begin
   self.mRegistCntrl(pnl1,'UPLOAD_LIST');
   self.mOpenInputProxy(pnl1);
   edtLSH.Text:=self.mGetGuid;
   edtLSH.Enabled:=false;
   self.pgc1.Visible:=false;
   self.mSetDbControlDefaultValue('edtDWBM',mGetLoginUser.dwdm);
   self.mSetDbControlDefaultValue('edtPOLICE_ID',mGetLoginUser.userid);

  // self.mgetDbControl('edtDWBM').setDefaultValue(mGetLoginUser.dwdm);
   //self.mgetDbControl('edtPOLICE_ID').setDefaultValue(mGetLoginUser.userid);
   edtUPLOAD_TIME.Text:=FormatDateTime('yyyy-mm-dd',now());
   self.edtPOLICE_ID.Enabled:=false;
   self.edtDWBM.Enabled:=false;
   Self.edtUPLOAD_TIME.Enabled:=false;
   menuDrawClick(self);
end;


procedure TfrmUpLoadDoc.addNewClick(Sender: TObject);
var myNode:TNodeCLs;
begin
  inherited;
  if not assigned(TreeViewFrame1.tvResource.Selected) then exit;
     myNode:=TNodeCls(TreeViewFrame1.tvResource.Selected.data);
  //   self.mgetDbControl('edtResource_id').setDefaultValue(myNode.keyField);
     self.mSetDbControlDefaultValue('edtResource_id',myNode.keyField);
end;

procedure TfrmUpLoadDoc.btnFileUploadClick(Sender: TObject);
var fname,BlobFieldName:String;
var ms:TMemoryStream;
var tablename,locateSql :String;
begin
  inherited;
  ms:=TmemoryStream.Create;
  //fname:=ExtractFilePath(application.ExeName)+'test2.xls';
  fname:=self.edtWJLJ.Text;
  ms.LoadFromFile(fname);
  //tablename:='UPLOAD_DOCUMENT';
  //blobfieldname:='ZYWJ';
  //locateSql :='lsh=''2''';
  fname:=''''+self.edtLSH.Text+'''';
  fname:= Self.mDBProvide.putBlobField('UPLOAD_DOCUMENT','zywj',' lsh='+fname,ms);
  //self.DBUtil.getDBProvide('test').putBlobField('upload_document','zywj',' lsh=''1''',ms);
  ms.Free;
  if fname='0' then showmessage('上传成功');
end;

procedure TfrmUpLoadDoc.btnFileSelectClick(Sender: TObject);
var fname:string;
begin
  inherited;
  if  dlgOpen1.Execute then
  begin
     fname:=dlgOpen1.FileName;
     edtWJLJ.Text:=fname;
  end;
end;

procedure TfrmUpLoadDoc.btnSaveClick(Sender: TObject);
var i:integer;
begin
  inherited;
  //self.mgetDbControl('edtSHZT').setDefaultValue('0');  //审核状态必须有值
    self.mSetDbControlDefaultValue('edtSHZT','0');
  i:= self.mInsertRecord(pnl1,'GRIDDING_DJ');
  if i=0 then
  begin
    showmessage('数据保存成功!');
    self.pnl1.enabled:=false;
    self.pgc1.Visible:=true;
    btnSave.Enabled:=False;
  end ;
end;

procedure TfrmUpLoadDoc.TreeViewFrame1tvResourceDblClick(Sender: TObject);
var myNode:TNodeCLs;
begin
  inherited;
  if not assigned(TreeViewFrame1.tvResource.Selected) then exit;
    myNode:=TNodeCls(TreeViewFrame1.tvResource.Selected.data);
//    self.mgetDbControl('edtResource_id').setDefaultValue(myNode.keyField);
   self.mSetDbControlDefaultValue('edtResource_id',myNode.keyField);
end;

//**********文件FTP上传程序
//procedure TfrmUpLoadDoc.rzbtbtnFTPUploadClick(Sender: TObject);
//begin
//  inherited;
//  ShellExecute(Handle,PChar('open'),PChar('ftp://10.75.2.2'),nil,nil,sw_show)
//end;



end.
