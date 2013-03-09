unit uCodeEngineMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB;

type
  TcodeEngineMainForm = class(TForm)
    con1: TADOConnection;
    qry1: TADOQuery;
    rgDbChoose: TRadioGroup;
    btnLinkDB: TButton;
    btnDBLinkSet: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDBLinkSetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  codeEngineMainForm: TcodeEngineMainForm;

implementation
uses uCnCeCommon,
     ShellApi;
var  AppPath: string;
{$R *.dfm}

procedure TcodeEngineMainForm.btnDBLinkSetClick(Sender: TObject);
var
  DBLinkFile: string;
begin
  DBLinkFile := AppPath + cnDBLinkUdl;
  ShellExecute(handle,'open',PChar(DBLinkFile),nil,nil,SW_SHOW);

end;

procedure TcodeEngineMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  codeEngineMainForm:=nil;
end;

end.
