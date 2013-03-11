unit uLoginForm;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP,CommonBpl_DBFormBaseEx,auThread,activex;
type
  TForm1 = class(TDBFormBaseEx)
    Panel1: TPanel;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblVersion: TLabel;
    btnLogin: TButton;
    UserName: TEdit;
    Password: TEdit;
    Button2: TButton;
    chkCleanEnv: TCheckBox;
    IdHTTP1: TIdHTTP;
    IdHTTP2: TIdHTTP;
    autoUpgrader: TCheckBox;
    lblLoginError: TLabel;
    Timer1: TTimer;
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    FLogonDataSource:String;
    FMetaDatasource:String;
    FLoginSuccess:TNotifyEvent;
    FCancelLogin:TNotifyEvent;
    mthread:TauCustomThread;
    procedure  ThreadExecute(Sender:Tobject) ;
    procedure  LogonOver ;
  public
    { Public declarations }
     property   OnLoginSuccess : TNotifyEvent read FLoginSuccess  write FLoginSuccess;
     property   OnCancelLogin : TNotifyEvent read FCancelLogin  write FCancelLogin;
  end;

var loginForm:TForm1;

{$R *.dfm}
implementation
uses dbclient,IniFiles,uFlashForm,uStructbaseFrameWork;

var  flashForm:TfrmFlash;
      FLoadStop:Boolean;


procedure TForm1.btnLoginClick(Sender: TObject);
var sql:string;
var cds:TClientDataSet;
var username,password:String;
begin
  lblLoginError.Visible:=false;
  if (self.UserName.Text = '') then
  begin
    showmessage(' 用户名不能为空!');
    exit;
  end;
   if not assigned(flashForm) then
        flashForm:=TfrmFlash.Create(self);

    flashForm.Show;

   mthread:=TauCustomThread.Create(self);
   mthread.OnExecute:=threadExecute;
   mthread.Execute;


    username:=self.UserName.Text;
    password:=self.Password.Text;
    Forms.Application.ProcessMessages;

   // loadDBProvide(FLogonDataSource);
  //   structbase.loadDBProvide(FLogonDataSource);
    Coinitialize(nil);
    structbase.structInitialization;
    CoUninitialize;
    cds:=TClientDataSet.Create(self);
    sql:='select * from user_list where user_name='''+username+'''';
    try
        //    Self.DBUtil.getDBProvide(FLogonDataSource).SelectCommand(cds,sql,0);
        structbase.DBProvids.find(FLogonDataSource).SelectCommand(cds,sql,0);
            cds.First;
            if (cds.RecordCount>0)  and
               (cds.FieldByName('password').AsString=password ) then
            begin
                timer1.Enabled:=false;
              //  self.mSetUserAuth(cds.FieldByName('user_id').AsString,
               //                   structbase.DBProvids.find(FMetaDataSource));
                self.mGetLoginUser.userid:= cds.FieldByName('user_id').AsString;
                self.mGetLoginUser.username:= cds.FieldByName('user_name').AsString;
                self.mGetLoginUser.dwdm:= cds.FieldByName('company').AsString;
                self.mGetLoginUser.lxdh:=cds.FieldByName('user_lxfs').AsString;
                self.mGetLoginUser.realusername:=cds.FieldByName('user_realname').AsString;
                self.Tag := 1;

                self.FLoginSuccess(self);
               // Coinitialize(nil);
              //  structbase.structInitialization;
               // CoUninitialize;
                FLoadStop:=true;
                self.lblLoginError.Visible:=false;
            end
            else
            begin
              self.tag:=-1;
              FLoadStop:=true;
              self.lblLoginError.Caption:='用户名或口令错误!';
              self.lblLoginError.Visible:=true;
            end;

    finally
       // flashForm.Close;
       // freeandnil(flashForm);
        cds.Free ;
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     self.Tag := 0;
     self.FCancelLogin(self);
     Close;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   // showmessage('flashForm.Close;');
  // flashForm.Close;
  // flashForm.Free;
  // self.Hide;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  myIni: TIniFile;
begin
    self.Tag:=1;
    timer1.Enabled:=false;
    self.lblLoginError.Visible:=false;
    myIni := TIniFile.Create(GetCurrentDir+ '\profile.ini');
    FLogonDataSource:=myIni.ReadString('DATASOURCE', 'LOGON_DATASOURCE', '');
    FMetaDataSource:= myIni.ReadString('DATASOURCE', 'META_DATASOURCE', '');

    freeandnil(myIni);

end;

procedure TForm1.LogonOver;
begin
       flashForm.Close;
       freeandnil(flashForm);
       if assigned(OnLoginSuccess) then OnLoginSuccess(self);
       self.Close;
end;

procedure TForm1.ThreadExecute(Sender: Tobject);
begin
    FLoadStop:=false;
    timer1.Enabled:=true;
    repeat
         self.mthread.Synchronize(flashForm.DisplayAgain);
        //if  flashForm.Visible then flashForm.SetFocus;
        //Forms.Application.ProcessMessages;
    until (FLoadStop=true);

    mthread.Synchronize(logonover);

    //flashForm.Close;
   // flashForm:=nil;
  //  freeandnil(flashForm);
   // if self.Tag=1  then close;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   FLoadStop:=true;
   lblLoginError.Caption:='登录认证超时!';
   lblLoginError.Visible:=true;
   timer1.Enabled:=false;
end;

initialization
  Coinitialize(nil);

finalization
  CoUninitialize;
end.
