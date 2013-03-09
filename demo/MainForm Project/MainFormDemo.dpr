program MainFormDemo;

uses
  uStructbaseFrameWork,
  Forms,
  uDataModule in 'Unit\uDataModule.pas' {MyDataModule: TDataModule},
  uMainForm in 'Unit\uMainForm.pas' {MainForm};

{$R *.res}
var ConnectionString:String;
begin
  Application.Initialize;
  ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=.\db\db.mdb;Persist Security Info=False' ;
  structbase.DBProvids.AddDBProvide('MetaSource','ADO',ConnectionString);
 // structbase.DBProvids.AddDBProvide('JAVASAMPLE','JAVA',ConnectionString);
 // structbase.DBProvids.AddDBProvide('ODACSAMPLE','ODAC',ConnectionString);
  StructBase.ReadConfigFromDB('MetaSource');

  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMyDataModule, MyDataModule);

  Application.Run;
end.
