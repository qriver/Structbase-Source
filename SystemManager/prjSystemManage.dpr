program prjSystemManage;

uses
  Forms,
  Controls,
  uStructbaseFrameWork,
  uMainForm in 'DevelopUnit\uMainForm.pas' {MainForm},
  fBaseForm in 'DevelopUnit\fBaseForm.pas' {BaseForm},
  uDataModule in 'DevelopUnit\uDataModule.pas' {MyDataModule: TDataModule},
  uCnCeCommon in 'CodeEngineUnit\uCnCeCommon.pas',
  uCnCeConstSql in 'CodeEngineUnit\uCnCeConstSql.pas',
  uCnMainCodeEngine in 'CodeEngineUnit\uCnMainCodeEngine.pas' {CnMainCodeEngine},
  uCodeEngineMainForm in 'CodeEngineUnit\uCodeEngineMainForm.pas' {codeEngineMainForm},
  dicManager in 'DicManageUnit\dicManager.pas' {frmDicManager},
  uDbConnect in 'DevelopUnit\uDbConnect.pas' {DbConnectForm},
  uTableAdd in 'TableDefineUnit\uTableAdd.pas' {frmTableAdd},
  uTableDefine in 'TableDefineUnit\uTableDefine.pas' {frmTableDefine},
  uDIC_SOURCE_Form in 'DicManageUnit\uDIC_SOURCE_Form.pas' {DIC_SOURCE_Form},
  uDIC_SOURCE_MainForm in 'DicManageUnit\uDIC_SOURCE_MainForm.pas' {DIC_SOURCE_MainForm},
  uAPP_NAME_MainForm in 'TableDefineUnit\uAPP_NAME_MainForm.pas' {APP_NAME_MainForm},
  uAPP_NAME_Form in 'TableDefineUnit\uAPP_NAME_Form.pas' {APP_NAME_Form},
  uAPP_DATASOURCE_MainForm in 'TableDefineUnit\uAPP_DATASOURCE_MainForm.pas',
  uAPP_DATASOURCE_Form in 'TableDefineUnit\uAPP_DATASOURCE_Form.pas';

{$R *.res}

begin
  Application.Initialize;

  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TDbConnectForm, DbConnectForm);
  DbConnectForm.ShowModal;
  if DbConnectForm.ModalResult=mrOk  then
  begin
    DbConnectForm.Free;
    structbase.structInitialization;
    Application.CreateForm(TMainForm, MainForm);
    Application.CreateForm(TMyDataModule, MyDataModule);
    MainForm.Show;
    Application.Run;

  end else
     Application.Terminate;

end.
