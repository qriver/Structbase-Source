Library struct_download;




uses
  ShareMem,
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  auUtils in 'unit\autoupgrader\auUtils.pas',
  auAutoUpgrader in 'unit\autoupgrader\auAutoUpgrader.pas',
  auAutoUpgraderAddURL in 'unit\autoupgrader\auAutoUpgraderAddURL.pas' {auAddURLForm},
  auAutoUpgraderPassword in 'unit\autoupgrader\auAutoUpgraderPassword.pas' {auAutoUpgraderPasswordForm},
  auAutoUpgraderUpgradeMsg in 'unit\autoupgrader\auAutoUpgraderUpgradeMsg.pas' {auAutoUpgraderUpgradeMessageForm},
  auExtAssociation in 'unit\autoupgrader\auExtAssociation.pas',
  auHTTP in 'unit\autoupgrader\auHTTP.pas',
  auThread in 'unit\autoupgrader\auThread.pas',
  uLoginForm in 'unit\uLoginForm.pas' {Form1},
  wxoUnit in 'unit\wxoUnit.pas',
  uFunction in 'unit\uFunction.pas',
  XmlRegObj in 'unit\XmlRegObj.pas',
  auAutoUpgraderWizard in 'unit\autoupgrader\auAutoUpgraderWizard.pas' {auAutoUpgraderWizardForm};

{$E .dll}

function LoadWebXoneForm(
          ApplicationHandle : THandle;  //������
          IEHandle : THandle;           //IE���
          CtrlHandle : THandle;         //IE���ƾ��
          Url : PChar;                  //URL�ַ���
          Flag : PChar                  //��ز���,���Զ���
          ):THandle;cdecl;

begin
     try
          giCtrl    := CtrlHandle;
          giApp     := ApplicationHandle;
          giIE      := IEHandle;
          giUrl     := Url;
          Form1  := TForm1.Create(nil);
          wxoShowForm(Form1);
     finally
     end;
     Result    := Form1.Handle;
end;


exports
     LoadWebXoneForm;

end.
