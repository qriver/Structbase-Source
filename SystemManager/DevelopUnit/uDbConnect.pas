unit uDbConnect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TDbConnectForm = class(TForm)
    rgDbChoose: TRadioGroup;
    btnLinkDB: TButton;
    btnDBLinkSet: TButton;
    procedure btnDBLinkSetClick(Sender: TObject);
    procedure btnLinkDBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DbConnectForm: TDbConnectForm;

implementation
uses
     uStructbaseFrameWork,
     uCnCeCommon,
     ShellApi;
{$R *.dfm}

procedure TDbConnectForm.btnDBLinkSetClick(Sender: TObject);
var  DBLinkFile: string;
begin
  DBLinkFile := SysUtils.GetCurrentDir  +'\'+ cnDBLinkUdl;
  ShellExecute(handle,'open',PChar(DBLinkFile),nil,nil,SW_SHOW);

end;

procedure TDbConnectForm.btnLinkDBClick(Sender: TObject);
var    LinkFile,ConnectionString: string;
begin
  try
    LinkFile := SysUtils.GetCurrentDir +'\'+ cnDBLinkUdl;
    ConnectionString := 'File name=' + LinkFile;
    structbase.DBProvids.AddDBProvide('ADOSAMPLE','ADO',ConnectionString);
    //DBUtil.registDBProvide('ADOSAMPLE','ADO',ConnectionString);
    self.ModalResult:=mrOk  ;
  except
      showmessage('必须连接正确的数据库');
     // self.ModalResult:=mrAbort  ;
  end;
 // Self.Close;
end;

end.
