library IPhoneDll;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  uMainForm in 'unit\uMainForm.pas' {MainForm},
  auHTTP in 'unit\auHTTP.pas',
  auThread in 'unit\auThread.pas',
  auUtils in 'unit\auUtils.pas',
  SysVars in 'unit\SysVars.pas',
  uDataModule in 'unit\uDataModule.pas' {MyDataModule: TDataModule},
  uFlashForm in 'unit\uFlashForm.pas' {frmFlash},
  uLoginForm in 'unit\uLoginForm.pas' {Form1},
  ImageViewYM in 'IPhoneForm\ImageViewYM.pas',
  pngextra in 'IPhoneForm\pngextra.pas',
  pnglang in 'IPhoneForm\pnglang.pas',
  uStructbaseFrameWork,
  WxoUnit in 'unit\WxoUnit.pas';

{$R *.res}

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
          loginForm := TForm1.Create(nil);
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
