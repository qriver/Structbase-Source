unit uLoginForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, IniFiles, auAutoUpgrader,
  uFunction;

const
  UPDATE_FILE = 'UPDATE.XML';
  Ini_FileName = 'profile.ini';
     WM_DownloadFinish=WM_USer+100;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);



  private
    { Private declarations }
    FCurrentDirName: String;
    FUpdateFileUrl: String;
    FSelfExeUpdateFileUrl: String;
    FSelfExeFileVersion: String;
    FInstallDirName: String;
    FUPGRADE_LOG_SAVE: String;

    procedure CheckUpdate(); // 检查struct升级
    procedure UpgraderFinish(Sender: TObject);

  public

  end;

var
  Form1: TForm1;


implementation
 uses wxoUnit,auAutoUpgraderWizard,StrUtils;
var
  AutoUpgrader1: TauAutoUpgrader;
{$R *.dfm}




procedure TForm1.CheckUpdate;
// 检查struct运行环境升级信息
begin
 //  messagebox(0,'upgrade_start',0,0);
 //self.UpgraderFinish(self);
 //exit;

  AutoUpgrader1.ShowMessages := [mConnLost, mHostUnreachable, mLostFile,
    mNoInfoFile];
  // AutoUpgrader1.ShowMessages:=[mAskUpgrade,mConnLost,mHostUnreachable,mLostFile,mNoInfoFile,mNoUpdateAvailable];
  AutoUpgrader1.InfoFileURL := FUpdateFileUrl;
  AutoUpgrader1.RestartParams := '/noupgrade'; // 不升级重启
  AutoUpgrader1.InfoFile.UpgradeMethod := umSelfUpgrade;
  //AutoUpgrader1.
  AutoUpgrader1.CheckUpdate;

end;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.Destroy;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  myIni: TIniFile;
  exeDirName: String;
  url:string;
  i,j:integer;
begin
  //showmessage(giurl);

  AutoUpgrader1 := TauAutoUpgrader.Create(self);
  AutoUpgrader1.OnFinishUpgrade:=self.UpgraderFinish ;
  AutoUpgrader1.AutoCheck:=false;
  exeDirName :=  GetCurrentDir+'\';
 // myIni := TIniFile.Create(exeDirName + Ini_FileName);
//  FUpdateFileUrl := myIni.ReadString('SETUP', 'UPDATE_FILE_URL', '');
 // FInstallDirName := myIni.ReadString('SETUP', 'INSTALL_DIR', '');

  //url:=replacestr(giurl,'http://','');
  //url:='http://'+copy(url,0,pos('/',url)-1);
    url:=giurl;
    for i := 0 to length(url) - 1 do
    begin
       if copy(url,i,1)='/' then  j:=i;
    end;
  url:=copy(url,0,j);

  FUpdateFileUrl:=url+'/update.xml';

  FCurrentDirName := exeDirName;
  uFunction.FCurDir:=exeDirName;


  CheckUpdate() ;

  // FMainFormInterface.OnFormExit:=ExitProgram;
end;





procedure TForm1.UpgraderFinish(Sender: TObject);
  var url:string;
begin
  //showmessage(giurl);
  //url:=  ansireplacestr( giurl ,pansichar('download'),pansichar('WebApp')) ;
  //showmessage(pchar(url));
 // url:='http://127.0.0.1:8080/index?webrun';
//  gotoIEUrl(pchar(pansichar(ansistring(url))),false);


  self.Close;
  SendMESSAGE(giCtrl,WM_DownloadFinish,0,0);

end;

end.
