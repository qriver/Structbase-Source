unit ufrmDJRegister;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Mask, Buttons,fBaseForm, DB,
  DBClient,  RzButton, RzTabs;

type
  TfrmDJRegister = class(TBaseForm)
    datasetRegister: TClientDataSet;
    pnl2: TPanel;
    txt3: TStaticText;
    edtPOLICE_NAME: TMaskEdit;
    txt4: TStaticText;
    edtPOLICE_ID: TMaskEdit;
    txt5: TStaticText;
    edtGRIDDING_NAME: TMaskEdit;
    txt6: TStaticText;
    edtGRIDDING_JWZRQ: TMaskEdit;
    rzbbtnGriddingSave: TRzBitBtn;
    lbl1: TLabel;
    lbl2: TLabel;
    datasetDisplay: TClientDataSet;
    edtGRIDDING_PCS: TMaskEdit;
    edtPOLICE_PRI: TMaskEdit;
    procedure rzbbtnGriddingSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    constructor  create(Owner:TComponent);    overload;
    function  UserInfoOperate:string;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDJRegister: TfrmDJRegister;

implementation

{$R *.dfm}

constructor  TfrmDJRegister.create(Owner:TComponent); 
begin
   inherited;
   
   self.lbl1.Caption:='网格民警信息维护'; 
    
   


end;

procedure TfrmDJRegister.FormCreate(Sender: TObject);
begin
      

      self.mRegistCntrl(pnl2,'GRIDDING_DJ_REGISTER') ;
      self.mOpenInputProxy(pnl2);
      Self.mDisplayRecord(pnl2,'where Police_name='''+self.mGetLoginUser.userid+'''');
      
     // self.mgetDbControl('edtPolice_name').setDefaultValue(mGetLoginUser.userid);
      self.mSetDbControlDefaultValue('edtPolice_name',mGetLoginUser.userid);
      edtPOLICE_ID.Text:= mGetLoginUser.username;

      edtPOLICE_ID.Enabled:=False;
      edtPOLICE_NAME.Enabled:=False;

      edtPOLICE_PRI.visible:=False;
      edtGRIDDING_PCS.Visible:=False;
      rzbbtnGriddingSave.enabled:=True;

      edtPOLICE_PRI.Text:= self.mGetLoginUser.userid ;



end;

procedure TfrmDJRegister.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDJRegister:=nil;
end;

procedure TfrmDJRegister.rzbbtnGriddingSaveClick(Sender: TObject);
var UserValue:String;
var str:String;
var strsql:string;
var JWZRQID:string;
begin
     JWZRQID:= Self.dbcontrols.find('edtGRIDDING_JWZRQ').realValue;
     edtGRIDDING_PCS.Text:=copy(JWZRQID,0,8)+'0000';
     Self.mSetDbControlDefaultValue('edtGRIDDING_PCS',edtGRIDDING_PCS.Text);


     strsql:=  'select * from GRIDDING_DJ_REGISTER where police_name='''+self.mGetLoginUser.userid+'''';
     Self.mDBProvide.SelectCommand(datasetRegister,strsql,0);
    
    if (edtGRIDDING_NAME.Text='') or (edtGRIDDING_JWZRQ.Text='') then
    begin
        Application.messagebox('请填写详细信息!','提示',mb_ok);
    end
    else
    begin
            UserValue:=self.UserInfoOperate;
            if UserValue='add' then
            begin
              self.mInsertRecord(pnl2,'GRIDDING_DJ_REGISTER');
              Application.messagebox('已注册！','提示',mb_ok);
            end;

            if  UserValue='modify'  then

            begin
              self.mUpdateRecord(pnl2,'GRIDDING_DJ_REGISTER') ;
              Application.messagebox('已修改！','提示',mb_ok);
            end;


        rzbbtnGriddingSave.Enabled:=False;
        
    end;
    
end;


function  TfrmDJRegister.UserInfoOperate:string;
var add:string;
var Modify:string;
begin
   if datasetRegister.recordCount=0 then
   begin
      result:='add';
   end
   else
      result:='modify';
   
end;

end.

