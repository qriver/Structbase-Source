unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

Const const_AppName='SYSTEM';
type
  TMainForm = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses      uStructbaseFrameWork;
{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
   StructBase.LoadApplication(const_AppName);
end;

end.
