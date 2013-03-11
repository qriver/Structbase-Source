unit uWebXForm;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, WebXForm_TLB, StdVcl, ExtCtrls;


Const
  gsMainDir = 'C:\JwzhptClient';
  WM_DownloadFinish=WM_USer+100;
type
  TWebXFormBase = class(TActiveForm, IWebXFormBase)
    oPanel: TPanel;
    procedure ActiveFormCreate(Sender: TObject);
  private
    { Private declarations }
    FEvents: IWebXFormBaseEvents;
    FUrl:WideString;
    FDllFileName:String;
    FDllFileHandle:Cardinal;
    FFormHD:THandle;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure MouseEnterEvent(Sender: TObject);
    procedure MouseLeaveEvent(Sender: TObject);
    procedure PaintEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_AlignWithMargins: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_DockSite: WordBool; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_ExplicitHeight: Integer; safecall;
    function Get_ExplicitLeft: Integer; safecall;
    function Get_ExplicitTop: Integer; safecall;
    function Get_ExplicitWidth: Integer; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_MouseInClient: WordBool; safecall;
    function Get_ParentCustomHint: WordBool; safecall;
    function Get_ParentDoubleBuffered: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PopupMode: TxPopupMode; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_ScreenSnap: WordBool; safecall;
    function Get_SnapBuffer: Integer; safecall;
    function Get_UseDockManager: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    procedure Set_AlignWithMargins(Value: WordBool); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_ParentCustomHint(Value: WordBool); safecall;
    procedure Set_ParentDoubleBuffered(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PopupMode(Value: TxPopupMode); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    procedure Set_UseDockManager(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function  Get_IeUrl: WideString; safecall;
    procedure Set_IeUrl(const Value: WideString); safecall;

  public
    { Public declarations }
    procedure DoDestroy; override;//释放的代码写在这里面
    procedure Load; stdcall;
    procedure DoDownLoad;
    procedure ImportDllForm;
    procedure Initialize; override;
    procedure UpgraderFinish(Sender: TObject);
    procedure DownloadFinish(var msg:TMSG);Message WM_DownloadFinish;
    property  Ieurl: WideString read get_Ieurl write set_Ieurl;
  end;
  TLoadWebXoneForm = function(ApplicationHandle: THandle; IEHandle: THandle;
    CtrlHandle: THandle; Url: PChar; Flag: PChar): THandle; cdecl;
implementation

uses ComObj, ComServ,uFunction,uDownloadForm,strUtils,uMessageWizard;

{$R *.DFM}

{ TWebXFormBase }

procedure TWebXFormBase.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_WebXFormBasePage); }
end;

procedure TWebXFormBase.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IWebXFormBaseEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TWebXFormBase.ImportDllForm;
var  iTmp: Integer;
var  LoadWebXoneForm: TLoadWebXoneForm;
begin

  opanel.Update;

  sysutils.SetCurrentDir(gsMainDir);
//  windows.SetDllDirectory(pchar('c:\\jwzhptClient'))   ;
  if fDllFileName=''  then exit;

  if  not FileExists(gsMainDir+'\'+FDllFileName) then
  begin
    messagebox(0,pchar(gsMainDir+'\'+FDllFileName+'文件不存在!'),'',0);
    exit;
  end;
  FDllFileHandle := Loadlibrary(pchar(gsMainDir+'\'+FDllFileName));

 // myshowmessage(sysutils.GetCurrentDir);

  if FDllFileHandle<32 then
  begin

       // messagebox(0,pchar('装入'+gsMainDir+'\'+sDll+'文件失败'),'错误',mb_ok);
       messagebox(0,pchar('装入'+gsMainDir+'\'+FDllFileName+'文件失败'),'',0);
       exit;
  end;
  // 表示载入成功

  @LoadWebXoneForm := GetProcAddress(FDllFileHandle, PChar('LoadWebXoneForm'));
  if Assigned(LoadWebXoneForm) then
  begin
    // 生成子模块
    try
      FFormHD := LoadWebXoneForm(Application.Handle, Handle, Handle, pchar(Ieurl), nil);
    except
    end;

    Windows.SetParent(FFormHD, oPanel.Handle);

    // 控制子模块的位置大小
    iTmp :=1;
    MoveWindow(FFormHD, iTmp, iTmp, oPanel.Width - 2 * iTmp,
    oPanel.Height - 2 * iTmp, True);

    // 显示子模块

    ShowWindow(FFormHD, sw_show);
  end;
end;

procedure TWebXFormBase.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnMouseEnter := MouseEnterEvent;
  OnMouseLeave := MouseLeaveEvent;
  OnPaint := PaintEvent;
end;

function TWebXFormBase.Get_Active: WordBool;
begin
  Result := Active;
end;

function TWebXFormBase.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function TWebXFormBase.Get_AlignWithMargins: WordBool;
begin
  Result := AlignWithMargins;
end;

function TWebXFormBase.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TWebXFormBase.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TWebXFormBase.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TWebXFormBase.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TWebXFormBase.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TWebXFormBase.Get_DockSite: WordBool;
begin
  Result := DockSite;
end;

function TWebXFormBase.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TWebXFormBase.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TWebXFormBase.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TWebXFormBase.Get_ExplicitHeight: Integer;
begin
  Result := ExplicitHeight;
end;

function TWebXFormBase.Get_ExplicitLeft: Integer;
begin
  Result := ExplicitLeft;
end;

function TWebXFormBase.Get_ExplicitTop: Integer;
begin
  Result := ExplicitTop;
end;

function TWebXFormBase.Get_ExplicitWidth: Integer;
begin
  Result := ExplicitWidth;
end;

function TWebXFormBase.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TWebXFormBase.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TWebXFormBase.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TWebXFormBase.Get_MouseInClient: WordBool;
begin
  Result := MouseInClient;
end;

function TWebXFormBase.Get_ParentCustomHint: WordBool;
begin
  Result := ParentCustomHint;
end;

function TWebXFormBase.Get_ParentDoubleBuffered: WordBool;
begin
  Result := ParentDoubleBuffered;
end;

function TWebXFormBase.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TWebXFormBase.Get_PopupMode: TxPopupMode;
begin
  Result := Ord(PopupMode);
end;

function TWebXFormBase.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TWebXFormBase.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TWebXFormBase.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function TWebXFormBase.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function TWebXFormBase.Get_UseDockManager: WordBool;
begin
  Result := UseDockManager;
end;

function TWebXFormBase.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TWebXFormBase.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TWebXFormBase._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TWebXFormBase.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TWebXFormBase.ActiveFormCreate(Sender: TObject);
begin
  self.oPanel.Align := alclient;
  uFunction.FCurDir := gsMainDir;
  FFormHD:=0;


 // DownloadForm:= TDownloadForm.Create(nil);
//  DownloadForm.Parent:=self.oPanel;
 // DownloadForm.BorderStyle:=bsnone;
 // DownloadForm.Visible:=false;

//  WizardForm :=TWizardForm.create(nil);

end;

procedure TWebXFormBase.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TWebXFormBase.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TWebXFormBase.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TWebXFormBase.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TWebXFormBase.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TWebXFormBase.DoDestroy;
begin

  {释放资源}
   // if FFormHD>0 then closewindow(FFormHD);

  FreeLibrary(FDllFileHandle);
  if FFormHD>0 then    SendMESSAGE(ffORMHD,WM_CLOSE,0,0);

  //DownloadForm.Close;

 // freeandnil(DownloadForm);
  //freeandnil(WizardForm);

    inherited;

end;

procedure TWebXFormBase.DoDownLoad;
begin
     self.FDllFileName:='struct_download.dll';
     self.ImportDllForm;
end;

procedure TWebXFormBase.DownloadFinish(var msg: TMSG);
var t:TStringList;
 begin
  //解析Url
  //showmessage(PChar(gsMainDir+'\'+uBplFileName));
    if ffORMHD>0 then  SendMESSAGE(ffORMHD,WM_CLOSE,0,0);


    if pos('?',IeUrl)=0 then exit;

    t:=TStringList.Create;
    t.Delimiter:='?';
    t.DelimitedText:=furl;
    if t.Count>0  then
    begin
        FDllFileName:=t[1];
    end;
    //sdll:=replacestr(sdll,'&&','&');
    t.Delimiter:='&';
    t.DelimitedText:=FDllFileName;
    if t.Count>0  then
               FDllFileName:=t[0]
    else
         FDllFileName:='';

    t.Free;
    self.ImportDllForm;
  //  downloadform.Hide;
end;

procedure TWebXFormBase.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TWebXFormBase.MouseEnterEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseEnter;
end;

procedure TWebXFormBase.MouseLeaveEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseLeave;
end;

procedure TWebXFormBase.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TWebXFormBase.Set_AlignWithMargins(Value: WordBool);
begin
  AlignWithMargins := Value;
end;

procedure TWebXFormBase.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TWebXFormBase.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TWebXFormBase.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TWebXFormBase.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TWebXFormBase.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TWebXFormBase.Set_DockSite(Value: WordBool);
begin
  DockSite := Value;
end;

procedure TWebXFormBase.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TWebXFormBase.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TWebXFormBase.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TWebXFormBase.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TWebXFormBase.Set_HelpFile(const Value: WideString);
begin
  HelpFile := string(Value);
end;

procedure TWebXFormBase.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TWebXFormBase.Set_ParentCustomHint(Value: WordBool);
begin
  ParentCustomHint := Value;
end;

procedure TWebXFormBase.Set_ParentDoubleBuffered(Value: WordBool);
begin
  ParentDoubleBuffered := Value;
end;

procedure TWebXFormBase.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TWebXFormBase.Set_PopupMode(Value: TxPopupMode);
begin
  PopupMode := TPopupMode(Value);
end;

procedure TWebXFormBase.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TWebXFormBase.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TWebXFormBase.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure TWebXFormBase.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure TWebXFormBase.Set_UseDockManager(Value: WordBool);
begin
  UseDockManager := Value;
end;

procedure TWebXFormBase.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;



procedure TWebXFormBase.UpgraderFinish(Sender: TObject);

var t:TStringList;
 begin
  //解析Url
  //showmessage(PChar(gsMainDir+'\'+uBplFileName));

    if pos('?',IeUrl)=0 then exit;

    t:=TStringList.Create;
    t.Delimiter:='?';
    t.DelimitedText:=furl;
    if t.Count>0  then
    begin
        FDllFileName:=t[1];
    end;
    //sdll:=replacestr(sdll,'&&','&');
    t.Delimiter:='&';
    t.DelimitedText:=FDllFileName;
    if t.Count>0  then
               FDllFileName:=t[0];
    t.Free;
  //  downloadform.Hide;



end;

function TWebXFormBase.Get_IeUrl: WideString;
begin
   result:=FUrl;
end;

procedure TWebXFormBase.Set_IeUrl(const Value: WideString);
begin
    FUrl:=value;
end;

procedure TWebXFormBase.Load;
begin
  if not sysutils.DirectoryExists(uFunction.FCurDir) then
  begin
       ForceDirectories(uFunction.FCurDir);
  end;
  DoDownLoad;

     //   showmessage(furl);
      // IEUrl:=url;
   //  DownloadForm.IEUrl:=string(furl);
   //  downloadform.Visible:=true;
    // DownloadForm.Show;
   //  DownloadForm.AutoUpgrader1.OnFinishUpgrade:=self.UpgraderFinish;
   //  DownloadForm.CheckUpdate;

end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TWebXFormBase,
    Class_WebXFormBase,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
