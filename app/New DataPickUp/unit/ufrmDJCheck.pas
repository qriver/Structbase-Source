unit ufrmDJCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Mask, Buttons,fBaseForm, DB,
  DBClient,  RzButton, RzTabs,strUtils;

type actionType=(派出所审批,分局审批,浏览数据);
type
  TfrmDJCheck = class(TBaseForm)
    lbl1: TLabel;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    pnl1: TPanel;
    txtlbl2: TStaticText;
    txt1: TStaticText;
    txt2: TStaticText;
    txt5: TStaticText;
    edtUPLOAD_TIME: TMaskEdit;
    txt6: TStaticText;
    txt7: TStaticText;
    edtSHSJ: TMaskEdit;
    txt8: TStaticText;
    edtSH_RYBH: TMaskEdit;
    edtTitle: TMaskEdit;
    txt11: TStaticText;
    txt12: TStaticText;
    edtLxdh: TMaskEdit;
    txt10: TStaticText;
    txt4: TStaticText;
    mmo1: TMemo;
    edtDESCRIPTION: TMaskEdit;
    edtRESOURCE_ID: TMaskEdit;
    edtPOLICE_ID: TMaskEdit;
    edtSHZT: TMaskEdit;
    txt3: TStaticText;
    edtSHDW: TMaskEdit;
    edtSSWG: TMaskEdit;
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    Panel1: TPanel;
    rzbtbtnBack: TRzBitBtn;
    rzbtbtnCheck: TRzBitBtn;
    Panel3: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    edtFJSPYJ: TMaskEdit;
    rzbtnFJSH: TRzBitBtn;
    Panel6: TPanel;
    Label3: TLabel;
    Panel7: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Panel2: TPanel;
    panelCBSJDW: TPanel;
    StaticText1: TStaticText;
    ed2FJSPDW: TMaskEdit;
    Panel8: TPanel;
    Label4: TLabel;
    edtSHSM: TMaskEdit;
    rzbtnPCSSP: TRzBitBtn;
    tmpFJSPDW: TMaskEdit;
    tmpSHSM: TMaskEdit;
    tmpFJSPYJ: TMaskEdit;
    tmpFJSPSJ: TMaskEdit;
    tmpFJSPRY: TMaskEdit;
    StaticText2: TStaticText;
    edtFJSPRY: TMaskEdit;
    StaticText3: TStaticText;
    edtFJSPSJ: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure rzbtbtnCheckClick(Sender: TObject);
    procedure rzbtbtnBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rzbtnPcsSHClick(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure rzbtnFJSHClick(Sender: TObject);
  private
     fActionType:actionType;
     fPkFieldValue:String;
     procedure  setActionType(ftype:actionType);
  public
    { Public declarations }
     property   actionType: actionType read factionType write setActionType;
     property   pkFieldValue: String read fPkFieldValue write fPkFieldValue;
  end;

var   frmDJCheck1: TfrmDJCheck;

implementation
var checkLsh:string;
var sptime:string;
{$R *.dfm}

procedure TfrmDJCheck.FormCreate(Sender: TObject);
begin
  inherited;
  edtDESCRIPTION.Visible:=False;
  self.mRegistCntrl(pnl1,'GRIDDING_DJ');
  rzbtnFJSH.Enabled:=True;

end;


procedure TfrmDJCheck.RadioButton1Click(Sender: TObject);
begin
  inherited;
  if not RadioButton3.Checked then
     self.panelCBSJDW.Visible:=false;
end;

procedure TfrmDJCheck.RadioButton2Click(Sender: TObject);
begin
  inherited;
  if not RadioButton3.Checked then
     self.panelCBSJDW.Visible:=false;
end;

procedure TfrmDJCheck.RadioButton3Click(Sender: TObject);
begin
  inherited;
    if RadioButton3.Checked then
    begin
      self.panelCBSJDW.Visible:=true;
      self.mRegistCntrl(panelCBSJDW,'GRIDDING_DJ');
    end;
end;



procedure TfrmDJCheck.rzbtnFJSHClick(Sender: TObject);
var strSql,spr, sptimechange,shdw:String;
begin
  inherited;
  if MessageBox(0,'你确定审批该条信息吗？','提示',MB_YESNO)=IDYES then
  begin
    spr:=self.mGetLoginUser.userid;
    sptimechange:=FormatDateTime('yyyy-mm-dd',now());;
    shdw:= mGetLoginUser.dwdm;
    strsql:='update GRIDDING_DJ set FJSPZT=''1'',FJSPYJ=%s,FJSPRY=%s,FJSPSJ=%s  where LSH='''+fPkFieldValue+'''';
    strsql:=format(strSql,[QuotedStr(edtFJSPYJ.Text),QuotedStr(spr),'to_char(sysdate,''yyyy-mm-dd'')']);
    Self.mDBProvide.ExecuteSql(strsql);
    Application.messagebox('已审批!','提示',mb_ok);
    rzbtnFJSH.enabled:=false;

  end;
end;

procedure TfrmDJCheck.rzbtnPcsSHClick(Sender: TObject);
begin
  inherited;
  if RadioButton1.Checked  then rzbtbtnCheckClick(self);
  if RadioButton2.Checked then  rzbtbtnBackClick(self);
  if RadioButton3.Checked then
  begin
     rzbtbtnCheckClick(self);
  end;

end;

procedure TfrmDJCheck.setActionType(ftype: actionType);
begin
    self.mDisplayRecord(pnl1,'where LSH='''+fPkFieldValue+'''');
    if ftype=派出所审批 then
    begin
         rzbtnPCSSP.Visible:=true;
         rzbtnFJSH.Visible:=false;
         panelCBSJDW.Visible:=false;
        // pnl1.Enabled:=false;
        self.edtSHSJ.Enabled:=false;
        self.edtSH_RYBH.Enabled:=false;
        self.edtSHDW.Enabled:=false;
        self.edtSHZT.Enabled:=false;
        RadioButton1.Checked:=true;
        edtSHSJ.text:= FormatDateTime('yyyy-mm-dd',now());
      //  self.mgetDbControl('edtSH_RYBH').setDefaultValue(mGetLoginUser.userid);
       // self.mgetDbControl('edtSHDW').setDefaultValue(mGetLoginUser.dwdm);
        self.mSetDbControlDefaultValue('edtSH_RYBH',mGetLoginUser.userid);
        self.mSetDbControlDefaultValue('edtSHDW',mGetLoginUser.dwdm);

        self.edtFJSPRY.text:='';
        self.edtFJSPSJ.text:='';
        rzbtnPCSSP.Enabled:=true;
        TabSheet3.TabVisible:=false;
    end;
    if ftype=分局审批 then
    begin
         rzbtnPCSSP.Visible:=false;
         rzbtnFJSH.Visible:=true;
         panelCBSJDW.Visible:=true;
         self.edtSHSJ.Enabled:=false;
         self.edtSH_RYBH.Enabled:=false;
         self.edtSHDW.Enabled:=false;
         self.edtSHZT.Enabled:=false;
         self.ed2FJSPDW.Enabled:=true;
         //edtSHSJ.text:= FormatDateTime('yyyy-mm-dd',now());
         //self.mgetDbControl('edtSH_RYBH').setDefaultValue(mGetLoginUser.userid);
        // self.mgetDbControl('edtSHDW').setDefaultValue(mGetLoginUser.dwdm);

         self.edtFJSPRY.Text:=mGetLoginUser.realusername;
         self.edtFJSPSJ.text:=FormatDateTime('yyyy-mm-dd',now());
         //rzbtnFJSH.Enabled:=false;
         rzbtnfjsh.enabled:=True;
         
         if self.edtSHZT.text='未审批' then
         begin
            self.RadioButton1.Checked:=false;
            self.RadioButton2.Checked:=false;
            self.RadioButton3.Checked:=false;
         end;
         if self.edtSHZT.text='已审批' then self.RadioButton1.Checked:=true;
         if self.edtSHZT.Text ='退回' then self.RadioButton2.Checked:=true;
         if self.tmpFJSPDW.Text<>''  then self.RadioButton3.Checked:=true ;
         TabSheet3.TabVisible:=true;
    end;
    if ftype= 浏览数据 then
    begin
         rzbtnPCSSP.Visible:=false;
         rzbtnFJSH.Visible:=false;
         panelCBSJDW.Visible:=true;
         self.ed2FJSPDW.Enabled:=false;
         self.edtFJSPRY.text:=self.tmpFJSPRY.Text;
         self.edtFJSPSJ.Text:=self.tmpFJSPSJ.Text;
         if self.edtSHZT.text='未审批' then
         begin
            self.RadioButton1.Checked:=false;
            self.RadioButton2.Checked:=false;
            self.RadioButton3.Checked:=false;
            TabSheet3.TabVisible:=false;
         end;
         if self.edtSHZT.text='已审批' then self.RadioButton1.Checked:=true;
         if self.edtSHZT.Text ='退回' then self.RadioButton2.Checked:=true;
          TabSheet3.TabVisible:=false;
         if self.tmpFJSPDW.Text<>''  then
         begin
            self.RadioButton3.Checked:=true ;
            TabSheet3.TabVisible:=true;
          end;
    end;

    mmo1.Lines.Text:= edtDESCRIPTION.Text;
    self.ed2FJSPDW.Text:=self.tmpFJSPDW.text;
    self.edtSHSM.Text:=tmpSHSM.Text;
    self.edtFJSPYJ.Text:=tmpFJSPYJ.text;

end;

procedure TfrmDJCheck.rzbtbtnCheckClick(Sender: TObject);
var strsql:string;
var sptimechange:string;
var spr:string;
var shdw,fjspdw:string;
begin
  inherited;
  if MessageBox(0,'你确定审批该条信息吗？','提示',MB_YESNO)=IDYES then
  begin
    spr:= edtSH_RYBH.Text;
    sptimechange:=edtSHSJ.Text;
    sptimechange:=replacestr(sptimechange,'-','');
    shdw:= mGetLoginUser.dwdm;
    if self.RadioButton3.Checked then
    begin
        fjspdw :=self.dbcontrols.find('ed2fjspdw').realValue;
        strsql:='update GRIDDING_DJ set fjspzt=0,shzt=1,SH_RYXM=%s,SHSJ=%s,SHDW=%s,shsm=%s,fjspdw=%s  where LSH='''+fPkFieldValue+'''';
        strsql:=format(strSql,[QuotedStr(spr),QuotedStr(sptimechange),QuotedStr(shdw),QuotedStr(edtshsm.Text),QuotedStr(fjspdw)]);
    end else
    begin
        strsql:='update GRIDDING_DJ set shzt=1,SH_RYXM=%s,SHSJ=%s,SHDW=%s,shsm=%s,fjspdw=%s   where LSH='''+fPkFieldValue+'''';
        strsql:=format(strSql,[QuotedStr(spr),QuotedStr(sptimechange),QuotedStr(shdw),QuotedStr(edtshsm.Text),QuotedStr('')]);
    end;
  //  strsql:='update GRIDDING_DJ set shzt=1,SH_RYXM='''+spr+''',SHSJ='''+sptimechange+''',SHDW='''+shdw+''',shsm='''+edtshsm.Text+''' where LSH='''+fPkFieldValue+'''';
   // strsql:='update GRIDDING_DJ set shzt=1,SH_RYXM=%s,SHSJ==%s,SHDW==%s,shsm==%s  where LSH='''+fPkFieldValue+'''';
     Self.mDBProvide.ExecuteSql(strsql);
    Application.messagebox('已审批!','提示',mb_ok);
    rzbtbtnCheck.Enabled:=False;
    rzbtbtnBack.Enabled:=False;
    rzbtnPcsSP.enabled:=false;
  end
  else
  begin
    Exit;
  end;
end;

procedure TfrmDJCheck.rzbtbtnBackClick(Sender: TObject);
var strsql:string;
var sptime:string;
var spr:string;
var shdw:string;
begin
  inherited;
  if edtSHSM.Text<>'' then
  begin
    if MessageBox(0,'你确定退回该网格信息吗？','提示',MB_YESNO)=IDYES then
    begin
      sptime:=FormatDateTime('yyyy-mm-dd',now());
      sptime:=replacestr(sptime,'-','');
      spr:= edtSH_RYBH.Text;
      shdw:= mGetLoginUser.dwdm;
      strsql:='update GRIDDING_DJ set fjspdw='''',shzt=2,SHSJ='''+sptime+''',SH_RYXM='''+spr+''',shsm='''+edtshsm.text+''',SHDW='''+shdw+''' where lsh='''+fPkFieldValue+'''';
      Self.mDBProvide.ExecuteSql(strsql);
      Application.messagebox('该网格信息已经退回！','提示',mb_ok);
      rzbtbtnCheck.Enabled:=False;
      rzbtbtnBack.Enabled:=False;
      rzbtnPcsSP.enabled:=false;
    end
    else
    begin
      Exit;
    end;
  end
  else
    Application.messagebox('请填写审核说明信息！','提示',mb_ok);
end;

procedure TfrmDJCheck.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
 // frmDJCheckRes.rzbtbtnQuaryClick(Sender);
end;

end.
