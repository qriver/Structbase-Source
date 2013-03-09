unit uFlashForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmFlash = class(TForm)
    lbl1: TLabel;
    tmr1: TTimer;
    procedure tmr1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    i: integer;
  public
    { Public declarations }
    procedure DisplayAgain;
  end;

var
  frmFlash: TfrmFlash;

implementation

{$R *.dfm}

procedure TfrmFlash.DisplayAgain;
begin
  if ((i mod 2) = 0) then
    Self.lbl1.Font.Color := clblue
  else
    Self.lbl1.Font.Color := clred;
  self.Refresh;
  Inc(i);
  Forms.Application.ProcessMessages;
end;

procedure TfrmFlash.FormCreate(Sender: TObject);
begin
  i := 0;
end;

procedure TfrmFlash.tmr1Timer(Sender: TObject);
begin
  if ((i mod 2) = 0) then
    Self.lbl1.Font.Color := clRed
  else
    Self.lbl1.Font.Color := clblue;
  Self.lbl1.Refresh;
  Inc(i);
end;

end.
