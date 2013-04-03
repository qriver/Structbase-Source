unit Struct_SysConfigUtils;

interface
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  DBpl_IDBProvide,
  Struct_MetaSource,
  DBClient,
  Dialogs;

type
  TStruct_SysConfigUtils = class(TObject)
  private
    fApplicationCds:TClientDataSet;
    fDataSourceCds:TClientDataSet;
    procedure registMetaSource(metaId: String);
    procedure registDataSource(strDataSource: String);
  public
    Constructor Create; overload;
    Destructor Destroy; override;
    procedure LoadAppInstance(uAppName:String);
    procedure ReadSysConfigFromDb(uDbprovideName:String);
  end;


implementation
uses
variants,
Db,
Struct_Applications,
Struct_Application,
uStructbaseFrameWork;
{ TStruct_SysConfigUtils }

constructor TStruct_SysConfigUtils.Create;
begin
      inherited;
    fApplicationCds:=nil;
    fDataSourceCds:=nil;
end;

destructor TStruct_SysConfigUtils.Destroy;
begin
   if fApplicationCds<>nil then fApplicationCds.Free;
   if fDataSourceCds<>nil then fDataSourceCds.Free;
   inherited;
end;

procedure TStruct_SysConfigUtils.LoadAppInstance(uAppName: String);
var strDataSource,strMetaSource:String;
var uApplication:TStruct_Application;
begin
    if fApplicationCds=nil then
     begin
      messagebox(0,pchar('APP对象配置没有装载，必须先执行ReadConfigFromDb方法'),'错误',0);
      exit;
   end;

   if  fApplicationCds.Locate('AppID',VarArrayOf([uAppName]), [loCaseInsensitive ]) then
   begin
       strDataSource:=fApplicationCds.FieldByName('DataSource').AsString;
       strMetaSource:=fApplicationCds.FieldByName('Meta_DataSource').AsString;;
   end else
   begin
      messagebox(0,pchar('配置数据库中没有发有APP对象:'+uAppName+'的设置置'),'错误',0);
   end;


    if  structbase.Applications.Find(uAppName)<>nil then exit;

    uApplication:= TStruct_Application.Create;
    uApplication.AppId:=uAppName;
    structbase.Applications.AddApplication(uApplication);

     if  structbase.DBProvids.find(strDataSource)=nil then
     begin
            registDataSource(strDataSource);
     end;

       with uApplication do
       begin
          DBProvide:=structbase.DBProvids.find(strDataSource) ;
          registMetaSource(strMetaSource);
          MetaSource:=structbase.MetaSources.find(strMetaSource);
          schema:=schema;
       end;


end;

procedure TStruct_SysConfigUtils.ReadSysConfigFromDb(uDbprovideName: String);
var strSql:String;
begin
   if fApplicationCds=nil then fApplicationCds:=TClientDataset.Create(nil);
   if fDataSourceCds=nil then fDataSourceCds:=TClientDataset.Create(nil);
   if structbase.DBProvids.find(uDbprovideName)=nil then
   begin
      messagebox(0,pchar('数据源'+uDbprovideName+'没有装载'),'错误',0);
      exit;
   end;
   with structbase.DBProvids.find(uDbprovideName)do
   begin
         strSql:='select * from app_name';
         SelectCommand(fApplicationCds,strSql,0);
         strSql:='select * from app_datasource';
         SelectCommand(fDataSourceCds,strSql,0);
   end;

end;

procedure TStruct_SysConfigUtils.registDataSource(strDataSource: String);
var strConnection,dbtype:String;
begin
    if  structbase.DBProvids.find(strDataSource)<>nil then exit;
    if  fDataSourceCds.Locate('Source_Name',VarArrayOf([strDataSource]), [loCaseInsensitive ]) then
    begin
        strConnection:=fDataSourceCds.FieldByName('ConnectionStr').AsString;;
        dbtype:=fDataSourceCds.FieldByName('dbtype').AsString;
        structbase.DBProvids.AddDBProvide(strDataSource,dbtype,strConnection);
    end else
    begin
      messagebox(0,pchar('配置数据库中没有发有数据源'+strDataSource+'的配置项'),'错误',0);
    end;
end;

procedure TStruct_SysConfigUtils.registMetaSource(metaId: String);
var metasource:TStruct_MetaSource;
var idx:integer;
var fdbProvide,fSchemaName:String;
begin
     if structbase.MetaSources.find(metaId)<>nil then exit;

     metasource:= TStruct_MetaSource.Create;
     metasource.MetaSourceId:=metaid;
     structbase.MetaSources.AddMetaSource(metasource);
     if  structbase.DBProvids.find(metaId)=nil then
     begin
            registDataSource(metaId);
     end;
     metasource.dbProvide:=  structbase.DBProvids.find(metaid);
     metasource.SchemaName:='';
     metasource.initDicCds;   //获取所有的元数据定义及数据字典
 end;


end.
