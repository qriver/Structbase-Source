unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,CommonBpl_DBFormBaseEx, CommonBpl_DBFormBase, StdCtrls, Mask, ExtCtrls,
  uStructbaseFrameWork;

type
  TForm1 = class(TDBFormBaseEx)
    Button1: TButton;
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
    StaticText1: TStaticText;
    edtColId: TMaskEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function getAppId():String;override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
   inherited;
   self.mRegistCntrl(panel1,'tabledefine');

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  inherited;
  self.mDisplayRecord(panel1,'where colid=''C415EC6B9FC75E6AE0404B0A50354841''');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  inherited;
  //self.mOpenInputProxy(edtPkFlag);
 // self.mOpenInputProxy(edtAppid);
  //self.mOpenInputProxy(edtColType);
  self.mOpenInputProxy(panel1);

 // showmessage(self.mGetGuid);
end;

function TForm1.getAppId: String;
begin
  result:='SYSTEM';
end;

end.
