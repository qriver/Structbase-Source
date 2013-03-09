program webappExe;

uses
  ExceptionLog,
  Forms,
  WxoUnit in 'unit\WxoUnit.pas',
  auHTTP in 'unit\auHTTP.pas',
  auThread in 'unit\auThread.pas',
  auUtils in 'unit\auUtils.pas',
  CloneComponents in 'unit\CloneComponents.pas',
  Login in 'unit\Login.pas' {Form_Login},
  Main in 'unit\Main.pas' {MainForm},
  SysDatas in 'unit\SysDatas.pas' {DM: TDataModule},
  SysVars in 'unit\SysVars.pas',
  uFlashForm in 'unit\uFlashForm.pas' {frmFlash},
  uLoginForm in 'unit\uLoginForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
 // loginForm := TForm1.Create(nil);
  //Application.CreateForm(TForm1, loginForm);
  loginform:=TForm1.Create(nil);
  Application.CreateForm(TMainForm, MainForm);
 // Application.CreateForm(TDM, DM);
  //Application.CreateForm(TfrmFlash, frmFlash);
  Application.Run;
end.
