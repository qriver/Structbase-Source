unit ufrmUpLoadBrower;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Mask, Buttons,fBaseForm, DB,
  DBClient,JPEG;

type
  TfrmUpLoadBrower = class(TBaseForm)
    lbl1: TLabel;
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
    txt10: TStaticText;
    edtSJZT: TMaskEdit;
    StaticText1: TStaticText;
    edtJLTS: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure getBrowerValue(str:string);
    procedure btnResDocClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpLoadBrower: TfrmUpLoadBrower;

implementation

{$R *.dfm}

procedure TfrmUpLoadBrower.FormCreate(Sender: TObject);
begin
  inherited;
  self.edtRESOURCE_ID.Enabled:=false;
  self.mRegistCntrl(pnl1,'UPLOAD_LIST');
end;

procedure TfrmUpLoadBrower.getBrowerValue(str:string);
var strsql:string;
begin
  self.pnl1.SetFocus;
  self.pnl1.Enabled:=False;
  Self.mDisplayRecord(pnl1,'where lsh='''+str+'''');
end;

procedure TfrmUpLoadBrower.btnResDocClick(Sender: TObject);
var jpg:TJpegImage;
var sql:String;
var ms:TMemoryStream;
begin
  inherited;
  ms:=TmemoryStream.Create;
  jpg:=TJpegImage.Create;
  sql:='select zywj from data_resource.upload_document where lsh=''4'' ';
  ms:=Self.mDBProvide.getBlobField(sql,'zywj') ;
  ms.Position:=0;
  ms.SaveToFile('c:\1.xls');
 // jpg.LoadFromStream(ms);
  //img1.Picture.Assign(jpg);
  ms.free;
end;

end.
