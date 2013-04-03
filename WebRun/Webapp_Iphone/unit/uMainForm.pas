unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzTabs,DBClient,ImageViewYM;

const gMasterDir='c:\jwzhptClient\';

type
  TMainForm = class(TForm)
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    RzPageControl2: TRzPageControl;
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    TabSheet4: TRzTabSheet;
    TabSheet5: TRzTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure RzPageControl2Change(Sender: TObject);
    procedure RzPageControl1Close(Sender: TObject; var AllowClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    APP_CDS:TCLientDataSet;
    App_List:TStringList;
    procedure PageControlResize(Sender: TObject);
     procedure Applicationrun(Sender: TObject);
       procedure ExitApplication(Sender: TObject);
  public
    { Public declarations }
        dvym : TImageViewYM;//DragViewYM
        procedure  LoadApplication(Sender: TObject);
  end;


   //与子模块的接口
 TShowForm = function(
           ParHandle : THandle;          //The Handle of MainForm
           var Text : Pchar              //reserved data
           ):Integer;cdecl;              //Return the child form handle

var
  MainForm: TMainForm;

implementation
uses uStructbaseFrameWork,DB,comctrls,extctrls,stdctrls,uDataModule,
 IniFiles,
 uLoginForm;
{$R *.dfm}

procedure TMainForm.Applicationrun(Sender: TObject);
begin
  loginform.Close;
end;

procedure TMainForm.ExitApplication(Sender: TObject);
begin
   //self.Close;
   self.RzPageControl1.Visible:=false;
    application.Terminate;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    dvym.ClearItem;

 // App_List.Clear;
    app_cds.Close;
   // loginform.Free;
    App_List.Free;

    //structbase.Destroy;

    self.Free;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var strConn,dbtype:String;
var
  myIni: TIniFile;
begin


    // if structbase=nil then  Structbase :=TStructbase.Create;

     loginForm:=TForm1.Create(self);

     MyDataModule:=TMyDataModule.create(self);
     self.Height:=768;
     self.Width:=1024;

     myIni := TIniFile.Create(sysutils.GetCurrentDir + '\profile.ini');
     strConn:= myIni.ReadString('METADATASOURCE', 'CONN', '');
     dbtype:= myIni.ReadString('METADATASOURCE', 'DBTYPE', '');
     freeandnil(myIni);

   //  strConn:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=.\db\db1.mdb;Persist Security Info=False';
     structbase.DBProvids.AddDBProvide('MetaSource',DBTYPE,strconn);
     structbase.ReadConfigFromDB('MetaSource');

     APP_CDS:=TClientDataSet.Create(self);
     StructBase.DBProvids.find('MetaSource').SelectCommand(app_Cds,'select * from app_name',0);
     App_List:=TStringList.Create;
     dvym := TImageViewYM.Create(Self);
     dvym.Align := alClient;
     dvym.ColCount := 8;
     dvym.CellWidth:= 55;
     dvym.CellHeight:= 55;
     dvym.CRDistance := 20;


     RzPageControl2Change(self);
end;



procedure TMainForm.FormShow(Sender: TObject);
begin
   loginform.OnLoginSuccess:=ApplicationRun;
    loginform.OnCancelLogin:=ExitApplication;
     loginForm.ShowModal;
     //
    // if loginForm.Tag=0 then begin
   //       application.Terminate;
    //      Exit;
   //  end;
end;

procedure TMainForm.LoadApplication(Sender: TObject);
var strAppId,strDllFileName,gsMainDir :String;
var
     I,J,iID   : Integer;
     sDLL      : string;
     sCaption  : string;
     iFound    : Integer;
     oTab      : TRzTabSheet;
     iDLL      : THandle;
         ShowForm  : TShowForm;
     iFormHD   : THandle;
     oPanel    : TPanel; //用于效果和边框
     oLabel    : TLabel;
     iTmp      : Integer;
     sText     : PChar;
begin
    strAppId:=app_list.Strings[dvym.ItemIndex];
   if    app_cds.Locate('appid', VarArrayOf([strAppId]),
                      [loCaseInsensitive ]) then
   begin
      strDllFileName:=app_cds.FieldByName('app_dllfilename').AsString;
      sCaption:=app_cds.FieldByName('app_DisplayLabel').AsString;

   end else
       messagebox(0,'提示','没有找到对应的APP',0);


      iFound    := -1;
     for I:=0 to RzPageControl1.PageCount-1 do begin
          if RzPageControl1.Pages[I].Caption=sCaption then begin
               iFound    := I;
               //如果是选择的数据未更新,则显示,否则删除重生成
               RzPageControl1.ActivePageIndex := I;
               Exit;
          end;
     end;
         if iFound = -1 then begin
          oTab := TRzTabSheet.Create(self);
          oTab.PageControl    := RzPageControl1;
          oTab.TabVisible     := true;
          oTab.Caption        := sCaption;
          otab.OnResize       := PageControlResize;
         RzPageControl1.ActivePage := oTab;
          //下面的白色容器框
          oPanel              := TPanel.Create(self);
          oPanel.Parent       := oTab;
          oPanel.Color        := clWhite;
          oPanel.BevelOuter   := bvNone;
          oPanel.Align        := alClient;
          oPanel.BorderWidth  := 8;
          //oPanel.OnResize     := UpdateDllSize;
          oPanel.Tag          := 99;
     end else begin
          oTab := TRzTabSheet(RzPageControl1.Pages[iFound]);
          RzPageControl1.ActivePageIndex := iFound;
          for I:=0 to oTab.ControlCount-1 do begin
               if oTab.Controls[I].Tag=99 then begin
                    oPanel    := TPanel(oTab.Controls[I]);
               end;
          end;
     end;
        if strDllFileName=''  then iDll:=0;

      if  not FileExists(gMasterDir+strDllFileName) then
      begin
        messagebox(0,pchar(gMasterDir+ strDllFileName+'文件不存在!'),'',0);
        iDll:=0;
      end;

   //   if iDll<>0  then
             iDLL := Loadlibrary(PChar(gMasterDir+strDllFileName));

     if iDLL > 32 then begin
          oLabel    := TLabel.Create(Self);
          oLabel.Parent  := oPanel;
          oLabel.Left      := (oTab.Width-oLabel.Width) Div 2;
          oLabel.Top       := (oTab.Height-oLabel.Height) Div 2;
          oLabel.Caption   := 'Loading ... ...';
          oLabel.Visible   := True;

          oLabel.Update;
            sysutils.SetCurrentDir(gMasterDir);
          // 表示载入成功
          @ShowForm := GetProcAddress(iDLL, PChar('LoadWebXoneForm'));
          if Assigned(ShowForm) then begin
               // 生成子模块
               try
                    iFormHD   := ShowForm(Handle,sText);
               except
               end;


               //设置子模块的父组件
               Windows.SetParent(iFormHD,oPanel.Handle);

               //控制子模块的位置大小
               iTmp := oPanel.BorderWidth;
               MoveWindow(iFormHD,iTmp,iTmp,oPanel.Width-2*iTmp,oPanel.Height-2*iTmp,True);

                //显示子模块
               ShowWindow(iFormHD,sw_show);

               //不在任务栏显示
               //SetWindowLong(iFormHD,GWL_EXSTYLE,WS_EX_TOOLWINDOW);

               //保存子模块的句柄
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
          oLabel.Caption      := 'Dll文件：'+strDllFileName+'装载不成功 ...  ';
          oLabel.Visible      := True;
          oLabel.Update;
     end;

end;

procedure TMainForm.RzPageControl1Close(Sender: TObject;
  var AllowClose: Boolean);
begin
   if rzPageControl1.ActivePageIndex=0 then  exit;
  //发消息，通知子窗口关闭
   if rzPageControl1.ActivePage.Hint<>'' then
         SendMESSAGE( strtoint(rzPageControl1.ActivePage.Hint),WM_CLOSE,0,0);

    rzPageControl1.ActivePage.Free;
        rzPageControl1.ActivePage:=rzPageControl1.Pages[0];
end;

procedure TMainForm.RzPageControl2Change(Sender: TObject);
var rzidx:String;
begin

     dvym.ClearItem;
     rzIdx:=inttostr(rzPageControl2.ActivePageIndex);
     dvym.Parent:= rzPageControl2.ActivePage;
     APP_CDS.First;
     App_List.Clear;
     while not APP_CDS.Eof  do
   begin
          if app_cds.FieldByName('App_GroupId').AsString=rzIdx   then
           begin
             with app_cds  do
               dvym.AddItem( FieldByName('App_DisplayLabel').AsString, FieldByName('App_ImageId').AsString  );

                App_List.Add(app_cds.FieldByName('appid').AsString);
           end;
        APP_CDS.Next;
    end ;

      dvym.BuildComponents;


   dvym.OnItemClick:=self.LoadApplication;
   // dvym.loadBackPic(sysutils.getCurrentDir+ '\1.jpg');
end;


procedure TMainForm.PageControlResize(Sender: TObject);
var
     I         : Integer;
const
     iTmp = 10;
begin
     for I:=0 to rzPageControl1.PageCount-1 do begin
          MoveWindow(StrToIntDef(rzPageControl1.Pages[I].Hint,0),
               iTmp,iTmp,
               rzPageControl1.Pages[I].Width-2*iTmp,
               rzPageControl1.Pages[I].Height-2*iTmp,True);
     end;

end;

end.
