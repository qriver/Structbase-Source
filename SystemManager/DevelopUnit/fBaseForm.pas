unit fBaseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList,CommonBpl_DBFormBaseEx;


type
  TBaseForm = class(TDBFormBaseEx)
  private
    { Private declarations }
     function getAppId():String;  override;
  public
    { Public declarations }
  //  function  DBProvide:IDBProvideInterface;
    constructor Create(AOwner: TComponent);override;
  end;


var baseForm:TBaseForm;
implementation


{$R *.dfm}

{ TBaseForm }

constructor TBaseForm.Create(AOwner: TComponent);
begin
  inherited;

   //self.Height:= Const_FormHeight;
   //self.Width:=  Const_FormWidth;
  {
   if self.mGetLoginUser.username='' then
   begin
       self.mGetLoginUser.userid:='001596';
       self.mGetLoginUser.username:='058398';
       Self.mGetLoginUser.lxdh:='18972592799' ;
       self.mGetLoginUser.dwdm:='420503550105';
   end;
   }
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
    inherited;
    result:='SYSTEM';
end;




end.
