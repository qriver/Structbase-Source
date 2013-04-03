program SampleExe;

uses
  Forms,
  WxoUnit in 'unit\WxoUnit.pas',
  uChildMainForm in 'unit\uChildMainForm.pas' {ChildMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TChildMainForm, ChildMainForm);
  Application.Run;
end.
