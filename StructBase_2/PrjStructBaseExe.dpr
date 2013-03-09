program PrjStructBaseExe;

uses
  Forms,
  uStructbaseFrameWork in 'unit\uStructbaseFrameWork.pas',
  XmlRegObj in 'unit\XmlRegObj.pas',
  uMyException in 'unit\uMyException.pas',
  Struct_Application in 'unit\Struct_Application.pas',
  Struct_MetaSource in 'unit\Struct_MetaSource.pas',
  DBpl_IDBProvide in 'unit\DBpl_IDBProvide.pas',
  commonBpl_PublicFun in 'unit\commonBpl_PublicFun.pas',
  Struct_MetaSources in 'unit\Struct_MetaSources.pas',
  Struct_Applications in 'unit\Struct_Applications.pas',
  DBpl_DBProvides in 'unit\DBpl_DBProvides.pas',
  DBpl_ImplIDBProvide_Access in 'unit\DBpl_ImplIDBProvide_Access.pas',
  DBpl_ImplIDBProvide_Odac in 'unit\DBpl_ImplIDBProvide_Odac.pas',
  DBpl_ImplIDBProvide_QJ in 'unit\DBpl_ImplIDBProvide_QJ.pas',
  Base64 in 'PHPRPC_UNIT\Base64.pas',
  BigInt in 'PHPRPC_UNIT\BigInt.pas',
  MD5 in 'PHPRPC_UNIT\MD5.pas',
  PHPRPC in 'PHPRPC_UNIT\PHPRPC.pas',
  PHPRPCClient in 'PHPRPC_UNIT\PHPRPCClient.pas',
  PHPRPCIdHttpClient in 'PHPRPC_UNIT\PHPRPCIdHttpClient.pas',
  XXTEA in 'PHPRPC_UNIT\XXTEA.pas',
  Struct_DicDataSets in 'unit\Struct_DicDataSets.pas',
  CommonBpl_BaseType in 'unit\CommonBpl_BaseType.pas',
  Struct_DicItems in 'unit\Struct_DicItems.pas',
  Struct_DicBaseItem in 'unit\Struct_DicBaseItem.pas',
  Struct_DBControls in 'DBFORM_UNIT\Struct_DBControls.pas',
  Struct_BaseForm_Function in 'DBform_Unit\Struct_BaseForm_Function.pas',
  CommonBpl_DBFormBase in 'DBform_Unit\CommonBpl_DBFormBase.pas' {DbFormBase},
  Unit1 in 'TestUnit\Unit1.pas' {Form1},
  CommonBpl_DBFormBaseEx in 'DBform_Unit\CommonBpl_DBFormBaseEx.pas' {DBFormBaseEx},
  Struct_BaseForm_FunctionEx in 'DBform_Unit\Struct_BaseForm_FunctionEx.pas',
  Struct_CntlDataInput in 'DBform_Unit\Struct_CntlDataInput.pas',
  IMCode_delphi2010 in 'DBform_Unit\IMCode_delphi2010.pas',
  Struct_Filter in 'DBform_Unit\Struct_Filter.pas',
  Struct_LoginUser in 'Unit\Struct_LoginUser.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := Boolean(DebugHook);
  Application.Initialize;
  Structbase.structInitialization;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
