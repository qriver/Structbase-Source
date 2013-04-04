unit ufrmUpLoadLogOff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Mask, Buttons,fBaseForm, DB,
  DBClient;

type
  TfrmUpLoadLogOff = class(TBaseForm)
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
    btnLogOff: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure getLogOffValue(str:string);
    procedure btnLogOffClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpLoadLogOff: TfrmUpLoadLogOff;

implementation
var lshValue:string;

{$R *.dfm}

procedure TfrmUpLoadLogOff.FormCreate(Sender: TObject);
begin
  self.mRegistCntrl(pnl1,'UPLOAD_LIST');
end;

procedure TfrmUpLoadLogOff.getLogOffValue(str:string);
var strsql:string;
begin
  strsql:='select * from UPLOAD_LIST';
  Self.mDisplayRecord(pnl1,'where lsh='''+str+'''');
  lshValue:=str;
end;

procedure TfrmUpLoadLogOff.btnLogOffClick(Sender: TObject);
var strsql:string;
begin
  inherited;
  strsql:='delete from UPLOAD_LIST where lsh='''+lshValue+'''';
  Self.mDBProvide.ExecuteSql(strsql);
end;

end.
