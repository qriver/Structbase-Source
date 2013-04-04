unit fBaseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,CommonBpl_DBFormBaseEx,
  CommonBpl_BaseType , DB,
  DBClient,
  uProfile,
  DBpl_IDBProvide;


type
  TBaseForm = class(TDBFormBaseEx)
  private
    { Private declarations }
     pub_resource_list:TClientDataSet;
     function getAppId():String;override;
     procedure LoadFormInMainForm(aForm:TForm);
  public
    { Public declarations }
  //  function  DBProvide:IDBProvideInterface;
    function getResouceManger(var id:String):String;
    constructor Create(AOwner: TComponent);override;
    function getCdsGriddingPolice (str:string):Tclientdataset;



  end;



implementation

uses uStructbaseFrameWork;
{$R *.dfm}

{ TBaseForm }

constructor TBaseForm.Create(AOwner: TComponent);
begin
  inherited;

   //self.Height:= Const_FormHeight;
   //self.Width:=  Const_FormWidth;

   if self.mGetLoginUser.username='' then
   begin
       self.mGetLoginUser.userid:='020294';
       self.mGetLoginUser.username:='059604';
       Self.mGetLoginUser.lxdh:='18972592799' ;
       self.mGetLoginUser.dwdm:='420503550105';
       self.mGetLoginUser.realusername:='全江';
   end;
end;



function TBaseForm.getCdsGriddingPolice (str:string):TClientdataset;
var strsql:string;
begin
  if not Assigned(CDSGriddingPOlice) then
  begin
      CDSGriddingPOlice:=TClientDataSet.Create(nil) ;  //在系统退出时，由主界面释放
      strsql:='select * from GRIDDING_DJ_REGISTER where police_name='''+str+'''';
      Self.mDBProvide.SelectCommand(CDSGriddingPOlice,strsql,0);
  end ;
  
  result:=CDSGriddingPOlice;

end;  



//function TBaseForm.DBProvide: IDBProvideInterface;
//begin
     {
        可以自定义数据库连接:
        dbutil.getDBProvide('SYSCONFIG') ;
     }
//     result:=dbutil.getDBProvide(Const_DefaultDBDBProvide);
//end;

function TBaseForm.getAppId: String;
begin
   // inherited;
   result:=uProfile.Const_AppId;
end;


function TBaseForm.getResouceManger(var id:String): String;
var gldw:variant;
begin
//  pub_resource_list:=StructUtil.getApplication(self.getAppId).MetaSource.getDicCds('DC_RESOURCE');
  pub_resource_list:= structbase.DicItems.find('DC_RESOURCE').dicDataSet;
  gldw:= pub_resource_list.Lookup('resource_id',id,'gldw') ;
  if varisnull(gldw) then gldw:='';

  result:=gldw;
end;



procedure TBaseForm.LoadFormInMainForm(aForm: TForm);
begin
   //MainForm.LoadFormInPage(aForm);
end;

end.
