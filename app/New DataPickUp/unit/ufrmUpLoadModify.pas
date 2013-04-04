unit ufrmUpLoadModify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Mask, Buttons,fBaseForm, DB,
  DBClient, RzButton, ComCtrls;

type
  TfrmUpLoadModify = class(TBaseForm)
    pnl1: TPanel;
    txtlbl2: TStaticText;
    edtRESOURCE_ID: TMaskEdit;
    edtPOLICE_ID: TMaskEdit;
    txt1: TStaticText;
    txt2: TStaticText;
    edtDWBM: TMaskEdit;
    edtFROM_DW: TMaskEdit;
    txt4: TStaticText;
    txt3: TStaticText;
    edtDESCRIPTION: TMaskEdit;
    txt5: TStaticText;
    edtUPLOAD_TIME: TMaskEdit;
    txt6: TStaticText;
    edtSHZT: TMaskEdit;
    txt7: TStaticText;
    edtSHSJ: TMaskEdit;
    txt8: TStaticText;
    edtSH_RYXM: TMaskEdit;
    txt9: TStaticText;
    edtSHSM: TMaskEdit;
    edtTitle: TMaskEdit;
    StaticText14: TStaticText;
    edtLXDH: TMaskEdit;
    StaticText15: TStaticText;
    StaticText16: TStaticText;
    edtLSH: TMaskEdit;
    btnModify: TBitBtn;
    pgc1: TPageControl;
    ts1: TTabSheet;
    edtWJLJ: TMaskEdit;
    btnFileUpload: TRzBitBtn;
    btnFileSelect: TRzBitBtn;
    dlgOpen1: TOpenDialog;
    lbl1: TLabel;
    txt10: TStaticText;
    edtSJZT: TMaskEdit;
    StaticText1: TStaticText;
    edtJLTS: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure getModifyValue(str:string);
    procedure btnModifyClick(Sender: TObject);
    procedure btnFileSelectClick(Sender: TObject);
    procedure btnFileUploadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpLoadModify: TfrmUpLoadModify;

implementation

{$R *.dfm}

procedure TfrmUpLoadModify.FormCreate(Sender: TObject);
begin
  self.edtLSH.ReadOnly:=true;
  Self.edtPOLICE_ID.Enabled:=False;
  //Self.edtDWBM.Enabled:=False;
  Self.edtUPLOAD_TIME.Enabled:=False;
  Self.edtSHZT.Enabled:=False;
  Self.edtSH_RYXM.Enabled:=False;
  Self.edtSHSM.Enabled:=False;
  Self.edtSHSJ.Enabled:=False;
  self.mRegistCntrl(pnl1,'UPLOAD_LIST');

end;

procedure TfrmUpLoadModify.getModifyValue(str:string);
var strsql:string;
begin
 // self.pnl1.Visible:=false;
  self.pnl1.SetFocus;
  strsql:='select * from UPLOAD_LIST';
  Self.mDisplayRecord(pnl1,'where lsh='''+str+'''');
//  self.pnl1.Visible:=true;
end;

procedure TfrmUpLoadModify.btnModifyClick(Sender: TObject);
var i:integer;
begin
  if MessageBox(0,'你确定修改该条信息吗？','提示',MB_YESNO)=IDYES then
  begin
    i:=Self.mUpdateRecord(pnl1,'UPLOAD_LIST');
    if i=0 then Application.messagebox('数据修改成功！','提示',mb_ok);
    btnModify.Enabled:=False;
  end
  else
  begin
     Exit;
  end;
end;

procedure TfrmUpLoadModify.btnFileSelectClick(Sender: TObject);
var fname:string;
begin
  inherited;
  //Self.mInsertRecord(pnl2,'UPLOAD_LIST');
  if  dlgOpen1.Execute then
  begin
     fname:=dlgOpen1.FileName;
     edtWJLJ.Text:=fname;
  end;
end;


procedure TfrmUpLoadModify.btnFileUploadClick(Sender: TObject);
var fname,BlobFieldName:String;
var ms:TMemoryStream;
var tablename,locateSql :String;
begin
  inherited;
  ms:=TmemoryStream.Create;
 // fname:=ExtractFilePath(application.ExeName)+'test.jpg';
  fname:=self.edtWJLJ.Text;
  ms.LoadFromFile(fname);
  //tablename:='UPLOAD_DOCUMENT';
  //blobfieldname:='ZYWJ';
  //locateSql :='lsh=''2''';
   fname:=''''+self.edtLSH.Text+'''';
   fname:= Self.mDBProvide.putBlobField('UPLOAD_DOCUMENT','zywj',' lsh='+fname,ms);

  // fname:=dbutil.getDBProvide('TEST').putBlobField('UPLOAD_DOCUMENT','zywj',' lsh='+fname,ms);
   ms.Free;
  if fname='0' then showmessage('上传成功') else  showmessage('上传失败!')
end;

end.
