unit uStructbaseFrameWork;

interface

uses classes,
     XmlRegObj,
     Struct_DicItems,
     Struct_CntlDataInput,
     DBpl_DBProvides,
     Struct_LoginUser,
     Struct_DicDataSets,
     Struct_MetaSources,
     Struct_Applications;

Type
  TStructbase=Class
  private
    FxmlObj:TXmlRegObj;
    FAppItems:TStruct_Applications;
    FMetaSourcItems:TStructMetaSources;
    FDBProvidItems:TDBpl_DBProvides;
    FDicDataSets:TDicDataSets;
    FLoginUser:TLoginUser;
    FDicItems:TDicItems;
    FCntlDataInput:TStruct_CntlDataInput ;
    FUserAuthList: TStringList;

    procedure registApplication(appName:String);
    procedure registMetaSource(metaId:String);
  public
    Constructor Create;
    Destructor  Destroy;override;
    procedure   structInitialization;
    property Applications: TStruct_Applications read FAppItems write FAppItems;
    property MetaSources: TStructMetaSources read FMetaSourcItems write FMetaSourcItems;
    property DBProvids: TDBpl_DBProvides read FDBProvidItems write FDBProvidItems;
    property LoginUser: TLoginUser read FLoginUser write FLoginUser;
    property DicDataSets: TDicDataSets read FDicDataSets write FDicDataSets;
    property DicItems: TDicItems read FDicItems write FDicItems;
    property CntlDataInput: TStruct_CntlDataInput read FCntlDataInput;
    property UserAuthList: TStringList read FUserAuthList write FUserAuthList;
    procedure loadDBProvide(uName: String);
   // TDBpl_DBProvides
end;

var
  Structbase :TStructbase ;

implementation
uses
     Struct_MetaSource,
     Struct_Application,
     uMyException,
     sysutils,
     XmlIntf,
     Dialogs;

{ TStructbaseApp }
constructor TStructbase.Create;
begin
      FxmlObj:=TXmlRegObj.Create;
      FAppItems:= TStruct_Applications.Create;
      FMetaSourcItems:=TStructMetaSources.create;
      FDBProvidItems:= TDBpl_DBProvides.Create;
      FLoginUser:=TLoginUser.Create;
      FDicDataSets:=TDicDataSets.Create;

      FCntlDataInput:=TStruct_CntlDataInput.Create(nil);
      FDicItems:=TDicItems.Create;
      FUserAuthList:=TStringList.create;
end;

destructor TStructbase.Destroy;
begin
//  showmessage('TStructbase.Destroy');

//  showmessage('1.Destroy');
  FxmlObj.Free;
 // showmessage('2.Destroy');
  FAppItems.Free;
 // showmessage('3.Destroy');
  FMetaSourcItems.Free;
 // showmessage('4.Destroy');

  FLoginUser.Free;
  FCntlDataInput.Free;
  FDicDataSets.Free;
  FDicItems.Free;
  FUserAuthList.Free;
  FDBProvidItems.Destroy;

end;

procedure TStructbase.structInitialization;

var node,node1:IXMLNode;
var loadflag:string;
var i:integer;
var nodename:String;
var appid,schema,uMetaSource,datasource:String;
begin
  try
     FxmlObj.LoadRegistryFile(GetCurrentDir+'\Reg.xml');
  Except
     exit;
  end;
   //初始化数据源
   node:=FxmlObj.GetNode(uppercase('DATASOURCE'),false);
   if node=nil then
   begin
       TCustomException.showMsg('reg.xml文件中没有数据源配置');
       exit;
   end;
   for i:=0 to  node.ChildNodes.Count-1 do
   begin
        nodename:=node.ChildNodes[i].NodeName;
        loadflag:='FALSE';
        loadflag:=FxmlObj.GetNodeValue('DATASOURCE\'+nodename,'AUTOLOAD');
        if uppercase(loadflag)='TRUE' then
        begin
             loadDBProvide(nodename);
        end;
   end;

   node:=nil;
  //初始化本地定义Application对象集合
   node:=FxmlObj.GetNode(uppercase('YCGA\APPLICATION'),false);
   for i:=0 to  node.ChildNodes.Count-1 do
   begin
        nodename:=node.ChildNodes[i].NodeName;
        loadflag:='FALSE';
        loadflag:=FxmlObj.GetNodeValue('YCGA\APPLICATION\'+nodename,'AUTOLOAD');

        IF loadflag='TRUE' then
            registApplication(nodename);     //可以手工加载
   end;

   node:=nil;
end;

procedure TStructbase.loadDBProvide(uName:String) ;
var nodename,url,dbtype,jndi,authcode:String;
begin
   nodename:='DATASOURCE\'+uname;
   url:= FxmlObj.GetNodeValue(nodename,'URL');
   dbtype:= FxmlObj.GetNodeValue(nodename,'DBTYPE');
   jndi:= FxmlObj.GetNodeValue(nodename,'JNDI');
   authcode:= FxmlObj.GetNodeValue(nodename,'AUTHCODE');
   if dbtype='JAVA' then
      url:='URL='+url+';jndiname='+jndi+';SCHEMANAME=;AUTHCODE='+authcode;

     DBProvids.AddDBProvide(uName,dbtype,URL);
     DBProvids.find(uName);
end;

procedure TStructbase.registApplication(appName: String);
var uApplication:TStruct_Application;
var idx:integer;
var schema,uMetaSource,datasource,nodename,appId:String;
begin
      nodename:= 'YCGA\APPLICATION\'+appName;
      appId:=FxmlObj.GetNodeValue(nodename,'APPID');
      schema:=FxmlObj.GetNodeValue(nodename,'SCHEMA');
      uMetaSource:=FxmlObj.GetNodeValue(nodename,'METASOURCE');
      datasource:=FxmlObj.GetNodeValue(nodename,'DATASOURCE');


      if  Applications.Find(appId)<>nil then exit;

      uApplication:= TStruct_Application.Create;
      uApplication.AppId:=appid;
      Applications.AddApplication(uApplication);
       with uApplication do
       begin
          DBProvide:=self.DBProvids.find(datasource) ;
          uMetaSource:=FxmlObj.GetNodeValue(nodename,'METASOURCE');

          registMetaSource(uMetaSource);
          MetaSource:=self.MetaSources.find(uMetaSource);
          schema:=schema;
       end;


end;

procedure TStructbase.registMetaSource(metaId: String);
var metasource:TStruct_MetaSource;
var idx:integer;
var uMetaSource:String;
begin
     if self.MetaSources.find(metaId)<>nil then exit;


     metasource:= TStruct_MetaSource.Create;
     metasource.MetaSourceId:=metaid;
     MetaSources.AddMetaSource(metasource);
     uMetaSource:=metaid;
     metasource.dbProvide:=
         self.DBProvids.find(FxmlObj.GetNodeValue('METASOURCE\'+uMetaSource,'DATASOURCE'));
     metasource.SchemaName:= FxmlObj.GetNodeValue('METASOURCE\'+uMetaSource,'SCHEMA');
    if  metasource.SchemaName<>'' then
         metasource.SchemaName:=metasource.SchemaName+'.';
      metasource.initDicCds;   //获取所有的元数据定义及数据字典
 end;






initialization
  Structbase :=TStructbase.Create;
finalization
//  Structbase.Free;
end.
