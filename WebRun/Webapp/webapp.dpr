Library WebApp;

uses
  Forms,
  SysDatas in 'unit\SysDatas.pas' {DM: TDataModule},
  CloneComponents in 'unit\CloneComponents.pas',
  Login in 'unit\Login.pas' {Form_Login},
  Main in 'unit\Main.pas' {MainForm},
  SysVars in 'unit\SysVars.pas',
  uLoginForm in 'unit\uLoginForm.pas' {Form1},
  auThread in 'unit\auThread.pas',
  auUtils in 'unit\auUtils.pas',
  auHTTP in 'unit\auHTTP.pas',
  uFlashForm in 'unit\uFlashForm.pas' {frmFlash},
  WxoUnit in 'unit\WxoUnit.pas';

{$E .wxo}

function LoadWebXoneForm(
          ApplicationHandle : THandle;
          IEHandle : THandle;
          CtrlHandle : THandle;
          Url : PChar;
          Flag : PChar
          ):THandle;cdecl;
begin
     try
          mainform := tmainform.Create(nil);
       //   loginForm := TForm1.Create(nil);
          giCtrl    := CtrlHandle;
          giApp     := ApplicationHandle;
          giIE      := IEHandle;
          giUrl     := pansichar(Url);
          WxoShowForm(mainform);
     finally
     end;
     Result    := mainform.Handle;

end;

exports
     LoadWebXoneForm;

end.

