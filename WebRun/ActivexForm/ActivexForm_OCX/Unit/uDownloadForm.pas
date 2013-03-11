unit uDownloadForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, IniFiles, auAutoUpgrader,
  uFunction;

const
  UPDATE_FILE = 'UPDATE.XML';
  Ini_FileName = 'profile.ini';

type
  TDownloadForm = class(TForm)
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    FCurrentDirName: String;
    FUpdateFileUrl: String;
    FSelfExeUpdateFileUrl: String;
    FSelfExeFileVersion: String;
    FInstallDirName: String;
    FUPGRADE_LOG_SAVE: String;

  public
     IEUrl:String;
     AutoUpgrader1: TauAutoUpgrader;
     procedure CheckUpdate(); // 检查struct升级
     procedure UpgraderFinish(Sender: TObject);
     destructor Destroy;   override;
  end;

var
  DownloadForm: TDownloadForm;


implementation

uses   auAutoUpgraderWizard, StrUtils;



{$R *.dfm}

procedure TDownloadForm.CheckUpdate;
// 检查struct运行环境升级信息
var url:String;
var i,j:integer;
begin
{$IFDEF OCX}

  url := IEUrl;
  for i := 0 to length(url) - 1 do
  begin
    if copy(url, i, 1) = '/' then
      j := i;
  end;
  url := copy(url, 0, j);

  FUpdateFileUrl := url + 'update.xml';
 //  showmessage(FUpdateFileUrl);
{$ENDIF}

  AutoUpgrader1.ShowMessages := [mConnLost, mHostUnreachable, mLostFile,
    mNoInfoFile];
  // AutoUpgrader1.ShowMessages:=[mAskUpgrade,mConnLost,mHostUnreachable,mLostFile,mNoInfoFile,mNoUpdateAvailable];
  AutoUpgrader1.InfoFileURL := FUpdateFileUrl;

  AutoUpgrader1.RestartParams := '/noupgrade'; // 不升级重启
  AutoUpgrader1.InfoFile.UpgradeMethod := umSelfUpgrade;

  AutoUpgrader1.CheckUpdate;

end;

destructor TDownloadForm.Destroy;
begin
  AutoUpgrader1.Free;
  inherited;
end;

procedure TDownloadForm.FormCreate(Sender: TObject);
var
  myIni: TIniFile;
  url,exeDirName: String;
  i, j: integer;

begin
  // showmessage(giurl);

  AutoUpgrader1 := TauAutoUpgrader.Create(nil);

 //  AutoUpgrader1.OnFinishUpgrade := self.UpgraderFinish;
  AutoUpgrader1.AutoCheck := false;
  exeDirName := GetCurrentDir + '\';

  myIni := TIniFile.Create(exeDirName + Ini_FileName);
  FUpdateFileUrl := myIni.ReadString('SETUP', 'UPDATE_FILE_URL', '');
  FInstallDirName := myIni.ReadString('SETUP', 'INSTALL_DIR', '');
  myIni.Free;
  FCurrentDirName := exeDirName;
  {$IFDEF OCX}
       exeDirName := uFunction.FCurDir + '\';
       FCurrentDirName :=uFunction.FCurDir ;
       FInstallDirName :=uFunction.FCurDir ;
  {$ENDIF}
   uFunction.FCurDir :=FCurrentDirName;
 // CheckUpdate();

  // FMainFormInterface.OnFormExit:=ExitProgram;
end;



procedure TDownloadForm.UpgraderFinish(Sender: TObject);
var
  url: string;
begin
 // self.Close;
//   showmessage(giurl);
 // url := ansireplacestr(giurl, pansichar('download'), pansichar('WebApp'));
  // showmessage(pchar(url));
  // url:='http://127.0.0.1:8080/index?webrun';
 // gotoIEUrl(pchar(pansichar(ansistring(url))), false);
end;

end.
