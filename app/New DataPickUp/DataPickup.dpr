program DataPickup;

uses
  Forms,
  IniFiles,
  Sysutils,
  uStructbaseFrameWork,
  uChildMainForm in 'unit\uChildMainForm.pas' {ChildMainForm},
  uProfile in 'unit\uProfile.pas',
  fDataResForm in 'unit\fDataResForm.pas' {frmDataRes},
  fBaseForm in 'unit\fBaseForm.pas' {BaseForm},
  fTreeViewFrame in 'unit\fTreeViewFrame.pas' {TreeViewFrame: TFrame},
  fResourceForm in 'unit\fResourceForm.pas' {ResourceForm},
  ufrmTableDefine in 'unit\ufrmTableDefine.pas' {frmTableDefine},
  uDataModule in 'QuanjUnit\uDataModule.pas' {MyDataModule: TDataModule},
  uGRIDDING_DJ_Form in 'QuanjUnit\uGRIDDING_DJ_Form.pas' {GRIDDING_DJ_Form},
  uGRIDDING_DJ_MainForm in 'QuanjUnit\uGRIDDING_DJ_MainForm.pas',
  uGRIDDING_JC_MainForm in 'QuanjUnit\uGRIDDING_JC_MainForm.pas' {Gridding_JC_MainForm},
  uGRIDDING_SP_MainForm in 'QuanjUnit\uGRIDDING_SP_MainForm.pas' {GRIDDING_SP_MainForm},
  uGRIDDING_TJ_MainForm in 'QuanjUnit\uGRIDDING_TJ_MainForm.pas' {GRIDDING_TJ_MAINFORM},
  ufrmDJCheck in 'unit\ufrmDJCheck.pas' {frmDJCheck};

{$R *.res}

var strConn,dbtype:String;
var
  myIni: TIniFile;
begin


    // if structbase=nil then  Structbase :=TStructbase.Create;



     myIni := TIniFile.Create(sysutils.GetCurrentDir + '\profile.ini');
     strConn:= myIni.ReadString('METADATASOURCE', 'CONN', '');
     dbtype:= myIni.ReadString('METADATASOURCE', 'DBTYPE', '');
     freeandnil(myIni);

   //  strConn:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=.\db\db1.mdb;Persist Security Info=False';
     structbase.DBProvids.AddDBProvide('MetaSource',DBTYPE,strconn);
     structbase.ReadConfigFromDB('MetaSource');

     Application.Initialize;



    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TMyDataModule, MyDataModule);

    Application.CreateForm(TChildMainForm, ChildMainForm);
  application.Run;
end.
