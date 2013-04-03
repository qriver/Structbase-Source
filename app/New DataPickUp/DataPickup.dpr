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
  ufrmTableDefine in 'unit\ufrmTableDefine.pas' {frmTableDefine};

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
    Application.CreateForm(TChildMainForm, ChildMainForm);
  //Application.CreateForm(TfrmDataRes, frmDataRes);
//  Application.CreateForm(TResourceForm, ResourceForm);
  Application.Run;
end.
