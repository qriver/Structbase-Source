unit Struct_BaseFormFun;

interface
uses
     extCtrls,
     Mask;


implementation
{
uses
  CommonBpl_BaseType,
  CommonBpl_DBBaseForm;

procedure mRegistCntrl(aForm:TDBFormBase;aControl: TMaskEdit; aTableName,
  aAppName: string);
var  i: integer;
var  uName:String;
var  dbCntrl:TDBControl;
begin
     uName:=aControl.Name;
     if aform.dbControls.find(uname)=nil then
     begin
        dbCntrl:=aform.dbControls.AddNew(uname);
        dbcntrl.fieldMetaBase:=dbcntrl.fieldMetaBase.Create;
        dbcntrl.dicMetaBase:=dbcntrl.dicMetaBase.Create;
        dbCntrl.appName:=aAppname;
        dbCntrl.tablename:=atablename;
        dbcntrl.cntlObjct:=aControl;
     end;

end;
  }
end.
