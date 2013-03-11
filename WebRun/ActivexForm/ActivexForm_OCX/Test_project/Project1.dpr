program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  auUtils in '..\Unit\autoupgrader\auUtils.pas',
  auAutoUpgrader in '..\Unit\autoupgrader\auAutoUpgrader.pas',
  auAutoUpgraderAddURL in '..\Unit\autoupgrader\auAutoUpgraderAddURL.pas' {auAddURLForm},
  auAutoUpgraderPassword in '..\Unit\autoupgrader\auAutoUpgraderPassword.pas' {auAutoUpgraderPasswordForm},
  auAutoUpgraderUpgradeMsg in '..\Unit\autoupgrader\auAutoUpgraderUpgradeMsg.pas' {auAutoUpgraderUpgradeMessageForm},
  auAutoUpgraderWizard in '..\Unit\autoupgrader\auAutoUpgraderWizard.pas' {auAutoUpgraderWizardForm},
  auExtAssociation in '..\Unit\autoupgrader\auExtAssociation.pas',
  auHTTP in '..\Unit\autoupgrader\auHTTP.pas',
  auThread in '..\Unit\autoupgrader\auThread.pas',
  XmlRegObj in '..\Unit\XmlRegObj.pas',
  uDownloadForm in '..\Unit\uDownloadForm.pas' {DownloadForm},
  uFunction in '..\Unit\uFunction.pas',
  uMessageWizard in '..\Unit\uMessageWizard.pas' {WizardForm};

{$R *.res}

begin
  //ReportMemoryLeaksOnShutdown := Boolean(DebugHook);
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
