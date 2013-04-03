{
  代码引擎模版
  Written by SkyJacker
  2007-03-01 09:48:58
}

unit uGRIDDING_DJ_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ExtCtrls,fBaseForm,Mask, fTreeViewFrame, RzButton;

type actionType=(fAddNew,fUpdate,fDelete,fDisplay);

type
  TGRIDDING_DJ_Form = class(TBaseForm)
    btnClose: TButton;
    btnSave:  TButton;
    pnl2: TPanel;
    lbl1: TLabel;
    panel1: TPanel;
    txt7: TStaticText;
    edtGLDW: TMaskEdit;
    txtlbl2: TStaticText;
    txt1: TStaticText;
    edtPOLICE_ID: TMaskEdit;
    txt2: TStaticText;
    edtSSWG: TMaskEdit;
    txt5: TStaticText;
    edtUPLOAD_TIME: TMaskEdit;
    edtDESCRIPTION: TMaskEdit;
    txt8: TStaticText;
    edtLSH: TMaskEdit;
    txtTitle1: TStaticText;
    edtTitle: TMaskEdit;
    txt9: TStaticText;
    edtSHZT: TMaskEdit;
    edtLXDH: TMaskEdit;
    txt3: TStaticText;
    txt4: TStaticText;
    mmo1: TMemo;
    txt6: TStaticText;
    edtSHDW: TMaskEdit;
    Button1: TButton;
    edtResource_id: TMaskEdit;
    rzbBtnSelectRes: TRzBitBtn;
    trvwfrm1: TTreeViewFrame;
    rzbtbtnSave: TRzBitBtn;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure bttModifyClick(Sender: TObject);
    procedure btnAddNewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rzbBtnSelectResClick(Sender: TObject);
    procedure trvwfrm1tvResourceDblClick(Sender: TObject);
    procedure rzbtbtnSaveClick(Sender: TObject);
    
  private
    { Private declarations }
     fActionType:actionType;
     fPkFieldValue:String;
     procedure setActionType(ftype:actionType);
    procedure menuDrawClick(Sender: TObject);
  public
    { Public declarations }
    

     property   actionType: actionType read factionType write setActionType;
     property   pkFieldValue: String read fPkFieldValue write fPkFieldValue;
  end;

var
  GRIDDING_DJ_Form: TGRIDDING_DJ_Form;

implementation
uses DBClient;

var acds:TClientDataSet;
{$R *.dfm}



procedure TGRIDDING_DJ_Form.FormCreate(Sender: TObject);

begin
    mRegistCntrl(panel1,'GRIDDING_DJ') ;
    menuDrawClick(self);

end;

procedure TGRIDDING_DJ_Form.FormDestroy(Sender: TObject);
begin
  //
    acds.Free;

    self.trvwfrm1.destroy;
end;

procedure TGRIDDING_DJ_Form.FormShow(Sender: TObject);
begin
  //
end;

procedure TGRIDDING_DJ_Form.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TGRIDDING_DJ_Form.setActionType(ftype: ActionType);
var cds:TClientDataSet;
var whereSql:String;
begin
    panel1.Enabled :=true;
   fActionType:=ftype;
   if ftype=fAddNew then
   begin
       self.mCleanPanel(panel1);
           Button1.Visible:=False;

       edtLSH.Text:=self.mGetGuid;
       edtLSH.ReadOnly:=True;
       edtDESCRIPTION.Visible:=False;
       edtLXDH.Text:=self.mGetLoginUser.lxdh;
       //self.mgetDbControl('edtDWBM').setDefaultValue(mGetLoginUser.dwdm);


         self.mSetDbControlDefaultValue('edtPOLICE_ID',mGetLoginUser.userid);
       edtUPLOAD_TIME.Text:=FormatDateTime('yyyy-mm-dd',now());
       self.edtPOLICE_ID.Enabled :=False;
       self.edtSSWG.Enabled :=False;
       Self.edtUPLOAD_TIME.ReadOnly:=True;
       self.edtLXDH.ReadOnly:=True;
       Self.edtResource_id.Enabled :=False;
       Self.edtSHDW.Enabled:=False;
       Self.edtGLDW.Enabled:=False;

       cds:=Self.getCdsGriddingPolice(self.mGetLoginUser.userid);
      // self.mgetDbControl('edtSHDW').setDefaultValue(cds.FieldByName('GRIDDING_PCS').AsString);
       self.mSetDbControlDefaultValue('edtSHDW',cds.FieldByName('GRIDDING_PCS').AsString  )  ;

       edtSSWG.Text:=cds.FieldByName('GRIDDING_NAME').AsString ;
       self.mmo1.Text:='';
       btnSave.visible:=True;
       self.rzbtbtnSave.Enabled:=true;
   end;

   if ftype=fUpdate then
   begin
       edtLSH.readonly:=True;
       whereSql:=' where LSH ='+ sysutils.QuotedStr(fPkFieldValue);
       mDisplayRecord(panel1,wheresql);
       self.mmo1.Text:=self.edtDESCRIPTION.Text;
       btnSave.visible:=True;
       self.rzbtbtnSave.Enabled:=true;
   end;

   if ftype=fDelete then
   begin

   end;

   if ftype=fDisplay then
   begin
       edtLSH.readonly:=True;
       whereSql:=' where LSH ='+ sysutils.QuotedStr(fPkFieldValue);
       mDisplayRecord(panel1,wheresql);
       self.mmo1.Text:=self.edtDESCRIPTION.Text;
       btnSave.visible:=False;
       self.trvwfrm1.Visible:=false;
       self.rzbtbtnSave.Enabled:=false;
   end;


end;

procedure TGRIDDING_DJ_Form.trvwfrm1tvResourceDblClick(Sender: TObject);
var myNode:TNodeCLs;
var id,gldw:String;

begin
  inherited;
  if not assigned(trvwfrm1.tvResource.Selected) then exit;
    myNode:=TNodeCls(trvwfrm1.tvResource.Selected.data);

    id:= myNode.keyfield;

    gldw:=self.getResouceManger(id);
   // self.mgetDbControl('edtGLDW').setDefaultValue(gldw);

    //self.mgetDbControl('edtResource_id').setDefaultValue(myNode.keyField);
     self.mSetDbControlDefaultValue('edtGLDW',gldw);
       self.mSetDbControlDefaultValue('edtResource_id',myNode.keyField);

    self.edtDESCRIPTION.Text:=acds.Lookup('Resource_id',id,'formatstr');



    self.mmo1.Text:=self.edtDESCRIPTION.Text;
    trvwfrm1.Visible:=False;

end;


procedure TGRIDDING_DJ_Form.btnSaveClick(Sender: TObject);
var i:integer;
begin
   self.edtDESCRIPTION.Text:=self.mmo1.Text;
   if fActionType=fAddNew then
      i:=mInsertRecord(panel1,'GRIDDING_DJ');

   
   if fActionType=fUpdate then
      i:= mUpdateRecord(panel1,'GRIDDING_DJ');

   if i=0 then 
   begin
          panel1.Enabled :=false;
          showmessage('保存成功!') 
   end else
          showmessage('保存失败!') ;
   
end;

procedure TGRIDDING_DJ_Form.btnAddNewClick(Sender: TObject);
begin
    setActionType(fAddNew);
end;

procedure TGRIDDING_DJ_Form.bttModifyClick(Sender: TObject);
begin
    setActionType(fUpdate);
end;


procedure TGRIDDING_DJ_Form.menuDrawClick(Sender: TObject);
begin
  inherited;
  trvwfrm1.Visible:=False;
  acds:=Tclientdataset.Create(self);
  self.mDBProvide.SelectCommand(acds,'select * from resource_list where groupid=''1''',0);
  trvwfrm1.setDataSource(acds);
  trvwfrm1.displayField:='Resource_name';
  trvwfrm1.keyField:='Resource_id';
  trvwfrm1.parentField:='Parent_id';
  trvwfrm1.DrawTreeView;
end;

procedure TGRIDDING_DJ_Form.rzbBtnSelectResClick(Sender: TObject);
begin
  inherited;
  trvwfrm1.Visible:=True;
  trvwfrm1.SetFocus;
end;

procedure TGRIDDING_DJ_Form.rzbtbtnSaveClick(Sender: TObject);
var num:Integer;
var flag:Integer;
begin
  inherited;
  flag:=1;
 // self.mgetDbControl('edtSHZT').setDefaultValue('0');  //审核状态必须有值

    self.mSetDbControlDefaultValue('edtSHZT','0');
  edtDESCRIPTION.Text:= mmo1.Lines.Text;

  for  num:=panel1.ControlCount-1 downto 0  do
  begin
    if Copy(panel1.Controls[num].Name,1,3)='edt' then
    begin
        if TMaskEdit(panel1.Controls[num]).text=''  then
        begin
          Application.messagebox('请填写完整信息！','提示',mb_ok);
          flag:=0;
          Break;
        end;
    end;
  end;

  if flag=1 then
  begin
   // self.mInsertRecord(panel1,'GRIDDING_DJ');
  //  Application.messagebox('数据保存成功！','提示',mb_ok);
  //  rzbtbtnSave.Enabled:=False;
    //Self.Visible:=False;
    //Self.btnQuaryClick(Sender);
   // frmDJRes.rzbQuaryClick(sender);

     btnSaveClick(self);
  end;
end;

end.
