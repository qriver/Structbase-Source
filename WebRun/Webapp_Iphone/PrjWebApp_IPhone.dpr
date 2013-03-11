program PrjWebApp_IPhone;

uses
  Forms,
  uMainForm in 'unit\uMainForm.pas' {MainForm},
  pngextra in 'IPhoneForm\pngextra.pas',
  pnglang in 'IPhoneForm\pnglang.pas',
  zlibpas in 'IPhoneForm\zlibpas.pas',
  ImageViewYM in 'IPhoneForm\ImageViewYM.pas',
  uDataModule in 'unit\uDataModule.pas' {MyDataModule: TDataModule},
  auHTTP in '..\Webapp\unit\auHTTP.pas',
  auThread in '..\Webapp\unit\auThread.pas',
  uFlashForm in '..\Webapp\unit\uFlashForm.pas' {frmFlash},
  uStructbaseFrameWork,
  auUtils in '..\Webapp\unit\auUtils.pas',
  pngimage in 'IPhoneForm\pngimage.pas';

{$R *.res}
var strConn:String;
begin
  Application.Initialize;
  strConn:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=.\db\db1.mdb;Persist Security Info=False';
  structbase.DBProvids.AddDBProvide('MetaSource','ADO',strconn);
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMyDataModule, MyDataModule);
  Application.CreateForm(TMainForm, MainForm);
  //Application.CreateForm(TfrmFlash, frmFlash);
  Application.Run;
end.
