unit Main;

interface

uses
     //
     SysVars,

     //
     CloneComponents,

     //
     IniFiles,
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, jpeg, ExtCtrls, DB, ADODB, ComCtrls, Tabs,CommCtrl,
     CommonBpl_DBFormBaseEx,DBClient,WxoUnit;

     const
     Auth_App_Prefix = 'APP_';

type
  TMainForm = class(TDBFormBaseEx)
    Panel_Banner: TPanel;
    Panel_Nav: TPanel;
    Panel_App: TPanel;
    Image_App: TImage;
    Label_App: TLabel;
    ADOQuery: TADOQuery;
    PageControl: TPageControl;
    Panel_Buttons: TPanel;
    Panel_Title: TPanel;
    Labe_webXone: TLabel;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Panel_ButtonsMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure PageControlResize(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label_URLClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
          FMetaDatasource:String;
          FOriginalPageControlWndProc: TWndMethod;
          FCdsApp:TClientDataSet;
          procedure PageControlWndProc(var Message: TMessage);
  public
          procedure TabResize(Sender:TObject);
          procedure LabelButtonMouseEnter(Sender: TObject);
          procedure ExeAQ(AQ:TADOQuery;S:String);
          procedure UpdateApplications;
          procedure RunApplication(Sender: TObject);
          procedure GroupButtonClick(Sender: TObject);
          //
          procedure FindChildObjects(Panel:TPanel;var Image:TImage; var BtnLabel:TLabel);
          procedure ExitApplication(Sender: TObject);
          procedure ApplicationRun(Sender: TObject);   //ȫ������
    { Public declarations }
  end;
     //����ģ��Ľӿ�
     TShowForm = function(
               ParHandle : THandle;          //The Handle of MainForm
               var Text : Pchar              //reserved data
               ):Integer;cdecl;              //Return the child form handle

var
     MainForm: TMainForm;

implementation

uses SysDatas, Login,uLoginForm,uStructbaseFrameWork;

{$R *.dfm}

procedure TMainForm.ApplicationRun(Sender: TObject);
begin
      // giUserID  := Form_Login.UserID;


     //��ȡ���ݿ�,��ʾ���г���ť
    UpdateApplications;
end;

procedure TMainForm.ExeAQ(AQ: TADOQuery; S: String);
begin
     //
     try
          AQ.Close;
          AQ.SQL.Text    := S;
          if Copy(Lowercase(S),1,7)='select ' then begin
               AQ.Open;
          end else begin
               AQ.ExecSQL;
          end;
     except
          //ShowMessage(#13'ִ�в�ѯʱ��������!'#13+S);
     end;

end;

procedure TMainForm.ExitApplication(Sender: TObject);
begin
 // self.Destroy;
  //application.Terminate;
  self.Close;
end;

procedure TMainForm.FindChildObjects(Panel: TPanel; var Image: TImage;
  var BtnLabel: TLabel);
begin
     if Panel.Controls[0].ClassType=TImage then begin
          Image     := TImage(Panel.Controls[0]);
          BtnLabel  := TLabel(Panel.Controls[1]);
     end else begin
          Image     := TImage(Panel.Controls[1]);
          BtnLabel  := TLabel(Panel.Controls[0]);
     end;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
     I,J       : Integer;
     bOpen     : Boolean;     //�������ѡ�����ݼ�
     R         : TRect;
     fTime     : TDateTime;
     sName     : string;
     sPsd      : string;
     sTime     : string;
     fIni      : TIniFile;
     sSN       : string;
     sSerialN0 : string;
     sDataSrc  : String;
     sConnStr  : String;

     //
     bTmp      : Boolean;
begin
     //�õ�����Ŀ¼
     gsMainDir := GetCurrentDir+'\';//ExtractFilePath(Application.ExeName);


     loginform.OnLoginSuccess:=ApplicationRun;
     loginform.OnCancelLogin:=ExitApplication;
     loginForm.ShowModal;
     //
     if loginForm.Tag=0 then begin
          application.Terminate;
          Exit;
     end;
    // loginform.Hide;
    //  SetIEToolBar(0);
   //  SetIEMenuBar(false);
    // SetIECaption('asdfasdfasdfasdf');
end;

procedure TMainForm.GroupButtonClick(Sender: TObject);
var
     I         : Integer;
     iGroupID  : Integer;
     oPanel    : TPanel;
     oImage    : TImage;
     oLabel    : TLabel;
begin
     //������δѡ��
     for I:=0 to Panel_Nav.ControlCount-1 do begin
          oPanel    := TPanel(Panel_Nav.Controls[I]);
          FindChildObjects(oPanel,oImage,oLabel);
          oImage.Visible      := False;
          oLabel.Font.Color   := clWhite;
     end;

     //�õ�ǰѡ��
     oPanel    := TPanel(TLabel(Sender).Parent);
     FindChildObjects(oPanel,oImage,oLabel);
     oImage.Visible      := True;
     oLabel.Font.Color   := Panel_Nav.Color;

     //
     iGroupID  := oLabel.Tag;

     Panel_Buttons.Visible    := False;

          //ִ�а�ťDLL
     RunApplication(Sender);
     {
     //�õ���ǰ�鰴ť��Ϣ
     ExeAQ(ADOQuery,'SELECT * FROM AppGroups WHERE ID='+IntToStr(iGroupID));
     if not ADOQuery.FieldByName('HasChild').AsBoolean then begin
          //�����Ӱ�ť��
          Panel_Buttons.Visible    := False;

          //ִ�а�ťDLL
          RunApplication(Sender);
          

     end else begin
          //���Panel_Buttons�еĿؼ�
          for I:=Panel_Buttons.ControlCount-1 downto 0 do begin
               Panel_Buttons.Controls[I].Destroy;
          end;


          //
          ExeAQ(ADOQuery,'SELECT * FROM Apps WHERE GroupID='+IntToStr(iGroupID)+' ORDER By Ord');
          if ADOQuery.IsEmpty then begin
               Panel_Buttons.Visible    := False;
          end else begin
               for I:=0 to ADOQuery.RecordCount-1 do begin
                    oLabel    := TLabel.Create(self);
                    oLabel.Parent  := Panel_Buttons;
                    oLabel.Top     := 15;
                    oLabel.Left    := 20+I*100;
                    oLabel.Tag          := ADOQuery.FieldByName('ID').AsInteger;
                    oLabel.Caption      := ADOQuery.FieldByName('Name').AsString;
                    oLabel.Hint         := ADOQuery.FieldByName('Dll').AsString;
                    oLabel.OnMouseEnter := LabelButtonMouseEnter;
                    oLabel.OnClick      := RunApplication;
                    //
                    ADOQuery.Next;
               end;
               Panel_Buttons.Visible    := True;
          end;
     end;
     }
     //
end;

procedure TMainForm.Label1Click(Sender: TObject);
begin
  self.Show;
end;

procedure TMainForm.LabelButtonMouseEnter(Sender: TObject);
begin
     TLabel(Sender).Font.Style     := [fsBold,fsUnderline];
end;



procedure TMainForm.Label_URLClick(Sender: TObject);
begin
   // showmessage(giurl);
   // gotoIEUrl(pchar(pansichar(ansistring(giurl))),false);
  // self.FormShow(self);
    self.Close;
end;

procedure TMainForm.UpdateApplications;
var
     I         : Integer;
     oGroup    : TPanel;
     sTmp      : string;
     bOpened   : Boolean;     //�Ƿ���ʾ��"ѡ�����ݼ�"��ť
     iLeft     : Integer;
     //
     oLabel    : TLabel;
     oImage    : TImage;
     oLabel1st : TLabel;
var sql:String;
begin
     //��ֹˢ��
     LockWindowUpdate(Handle);

     sql:='select rownum "id",appname,app_filename,app_pk from app_name';

     structbase.DBProvids.find(FMetaDataSource).SelectCommand(FcdsApp,sql,0);
      fcdsApp.First;
     //���ɰ�ť��
   //  ExeAQ(ADOQuery,'SELECT * FROM AppGroups WHERE Enabled=True ORDER BY Ord');

     iLeft     := 18;
     for I:=0 to fcdsApp.RecordCount-1 do begin
          if self.mHaveAppAuth(Auth_App_Prefix+
                        fcdsApp.FieldByName('App_pk').AsString) then
                  begin
                  oGroup    := TPanel(CloneComponent(Panel_App));
                  //
                  FindChildObjects(oGroup,oImage,oLabel);
                  //
                  oGroup.Visible      := True;
                  oGroup.Left         := iLeft;
                  oGroup.Visible      := True;
                  //
                  oLabel.Tag          := fcdsApp.FieldByName('ID').AsInteger;
                  oLabel.Caption      := fcdsApp.FieldByName('APPName').AsString;
                  oLabel.Hint         := fcdsApp.FieldByName('APP_FILENAME').AsString;
                  oLabel.OnClick      := GroupButtonClick;

                  //
                  if I=0 then begin
                       oLabel1st := oLabel;
                  end else begin
                       oImage.Visible      := False;
                       oLabel.Font.Color   := clWhite;
                  end;


                  //
                  iLeft     := iLeft+oGroup.Width+20;
          end;
          fcdsApp.Next;
     end;

     //�����һ����ť
   //  GroupButtonClick(oLabel1st);


     //��ֹˢ��
     LockWindowUpdate(0);
end;

procedure TMainForm.RunApplication(Sender: TObject);
var
     I,J,iID   : Integer;
     sDLL      : string;
     sCaption  : string;
     iFound    : Integer;
     oTab      : TTabSheet;
     iDLL      : THandle;
     ShowForm  : TShowForm;
     iFormHD   : THandle;
     oPanel    : TPanel; //����Ч���ͱ߿�
     oLabel    : TLabel;
     iTmp      : Integer;
     sText     : PChar;
begin
     //�õ�ID
     iID       := TLabel(Sender).Tag;
     sDLL      := TLabel(Sender).Hint;
     sCaption  := TLabel(Sender).Caption;

     //����ҳ��
     iFound    := -1;
     for I:=0 to PageControl.PageCount-1 do begin
          if PageControl.Pages[I].Caption=sCaption then begin
               iFound    := I;
               //�����ѡ�������δ����,����ʾ,����ɾ��������
               PageControl.ActivePageIndex := I;
               Exit;
          end;
     end;

     //
     if iFound = -1 then begin
          oTab := TTabSheet.Create(self);
          oTab.PageControl    := PageControl;
          oTab.TabVisible     := False;
          oTab.Caption        := sCaption;
          oTab.OnResize       := TabResize;
          PageControl.ActivePage := oTab;
          //����İ�ɫ������
          oPanel              := TPanel.Create(self);
          oPanel.Parent       := oTab;
          oPanel.Color        := clWhite;
          oPanel.BevelOuter   := bvNone;
          oPanel.Align        := alClient;
          oPanel.BorderWidth  := 8;
          //oPanel.OnResize     := UpdateDllSize;
          oPanel.Tag          := 99;
     end else begin
          oTab := TTabSheet(PageControl.Pages[iFound]);
          PageControl.ActivePageIndex := iFound;
          for I:=0 to oTab.ControlCount-1 do begin
               if oTab.Controls[I].Tag=99 then begin
                    oPanel    := TPanel(oTab.Controls[I]);
               end;
          end;
     end;


     //����DLL
     iDLL := Loadlibrary(PChar(gsMainDir+sDLL));

     if iDLL > 32 then begin
          oLabel    := TLabel.Create(Self);
          oLabel.Parent  := oPanel;
          oLabel.Left      := (oTab.Width-oLabel.Width) Div 2;
          oLabel.Top       := (oTab.Height-oLabel.Height) Div 2;
          oLabel.Caption   := 'Loading ... ...';
          oLabel.Visible   := True;

          oLabel.Update;

          // ��ʾ����ɹ�
          @ShowForm := GetProcAddress(iDLL, PChar('ShowDLLForm'));
          if Assigned(ShowForm) then begin
               // ������ģ��
               try
                    iFormHD   := ShowForm(Handle,sText);
               except
               end;


               //������ģ��ĸ����
               Windows.SetParent(iFormHD,oPanel.Handle);

               //������ģ���λ�ô�С
               iTmp := oPanel.BorderWidth;
               MoveWindow(iFormHD,iTmp,iTmp,oPanel.Width-2*iTmp,oPanel.Height-2*iTmp,True);

                //��ʾ��ģ��
               ShowWindow(iFormHD,sw_show);

               //������������ʾ
               //SetWindowLong(iFormHD,GWL_EXSTYLE,WS_EX_TOOLWINDOW);

               //������ģ��ľ��
               oTab.Hint := IntToStr(iFormHD);
               oTab.ImageIndex     := iDLL;
          end;
          oLabel.Visible   := False;
     end else begin
          oLabel    := TLabel.Create(Self);
          oLabel.Parent       := oPanel;
          oLabel.Font.Size    := 10;
          //oLabel.Font.Style   := [fsItalic];
          oLabel.Left         := (oTab.Width-oLabel.Width) Div 2;
          oLabel.Top          := (oTab.Height-oLabel.Height) Div 2;
          oLabel.Caption      := sDLL+' is building ...  ';
          oLabel.Visible      := True;
          oLabel.Update;
     end;
end;

procedure TMainForm.Panel_ButtonsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
     I    : Integer;
begin
     for I:=Panel_Buttons.ControlCount-1 downto 0 do begin
          TLabel(Panel_Buttons.Controls[I]).Font.Style     := [fsBold];
     end;
end;

procedure TMainForm.TabResize(Sender: TObject);
begin
     //
     
end;

procedure TMainForm.PageControlWndProc(var Message: TMessage);
begin
     FOriginalPageControlWndProc(Message);
     with Message do
          if (Msg = TCM_ADJUSTRECT) and (Message.WParam = 0) then
               InflateRect(PRect(LParam)^, 4, 4);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    loginform.Free;
    structbase.free;
     self.Destroy;
  //  self.ExitApplication(self);
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  myIni: TIniFile;
begin

    myIni := TIniFile.Create(sysutils.GetCurrentDir + '\profile.ini');
    FMetaDataSource:= myIni.ReadString('DATASOURCE', 'META_DATASOURCE', '');
    freeandnil(myIni);

     FCdsApp:=TClientDataSet.Create(self);
     with PageControl do begin
          // remove PageControl border
          FOriginalPageControlWndProc := WindowProc;
          WindowProc := PageControlWndProc;
          Realign;

  end;

end;

procedure TMainForm.PageControlResize(Sender: TObject);
var
     I         : Integer;
const
     iTmp = 10;
begin
     for I:=0 to PageControl.PageCount-1 do begin
          MoveWindow(StrToIntDef(PageControl.Pages[I].Hint,0),
               iTmp,iTmp,
               PageControl.Pages[I].Width-2*iTmp,
               PageControl.Pages[I].Height-2*iTmp,True);
     end;

end;

end.
