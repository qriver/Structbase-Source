library WebXForm;

uses
  ComServ,
  WebXForm_TLB in 'Unit\WebXForm_TLB.pas',
  uWebXForm in 'Unit\uWebXForm.pas' {WebXFormBase: TActiveForm} {WebXFormBase: CoClass},
  uFunction in 'Unit\uFunction.pas',
  XmlRegObj in 'Unit\XmlRegObj.pas',
  uDownloadForm in 'Unit\uDownloadForm.pas' {DownloadForm},
  auAutoUpgrader in 'Unit\autoupgrader\auAutoUpgrader.pas',
  auAutoUpgraderAddURL in 'Unit\autoupgrader\auAutoUpgraderAddURL.pas' {auAddURLForm},
  auAutoUpgraderPassword in 'Unit\autoupgrader\auAutoUpgraderPassword.pas' {auAutoUpgraderPasswordForm},
  auAutoUpgraderUpgradeMsg in 'Unit\autoupgrader\auAutoUpgraderUpgradeMsg.pas' {auAutoUpgraderUpgradeMessageForm},
  auAutoUpgraderWizard in 'Unit\autoupgrader\auAutoUpgraderWizard.pas' {auAutoUpgraderWizardForm},
  auExtAssociation in 'Unit\autoupgrader\auExtAssociation.pas',
  auHTTP in 'Unit\autoupgrader\auHTTP.pas',
  auThread in 'Unit\autoupgrader\auThread.pas',
  auUtils in 'Unit\autoupgrader\auUtils.pas',
  uMessageWizard in 'Unit\uMessageWizard.pas' {WizardForm};

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
