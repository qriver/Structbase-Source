unit Struct_MetaSource;

interface
 //{$DEFINE  NDEBUG}
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  DBpl_IDBProvide,
  {$IFNDEF NDEBUG}
  CnDebug,
  {$ENDIF}
  DBClient;

type
  TStruct_MetaSource = class
  private
    FdbProvide: IDBProvideInterface;
    FSchemaName: string;
    FMetaSourceId:String;
    procedure DownloadDicFile(dicId,dicFileName:String);
  public
    tableDefine:TClientDataSet;
    cdsDicDefine: TClientDataSet;
    function getDicDefineCDS: TClientDataSet;
    function getTableDefineCDS(uAppname,uTablename: string): TClientDataSet;
    property dbProvide: IDBProvideInterface read FdbProvide write FdbProvide;
    property SchemaName: string read FSchemaName write FSchemaName;
    property MetaSourceId: string read FMetaSourceId write FMetaSourceId;
    constructor Create(); overload;
    Destructor Destroy; override;
    procedure initDicCds;
  end;


implementation
uses    Struct_DicBaseItem,
        commonBpl_PublicFun,
        uStructbaseFrameWork,
        DB,
        Variants;

constructor TStruct_MetaSource.Create;
begin
   inherited;
   tableDefine:=TClientDataSet.Create(nil);
   cdsDicDefine:=TClientDataSet.Create(nil);



end;

destructor TStruct_MetaSource.destroy;
var I:integer;
var tmp:TClientDataset;
begin
   tableDefine.Free;
   cdsDicDefine.Free;
   inherited;
end;

procedure TStruct_MetaSource.DownloadDicFile(dicId, dicFileName: String);
var ms:TMemoryStream;
var sql:String;
begin
        if not sysutils.DirectoryExists(GetCurrentDir+'\dic\') then
        begin
             ForceDirectories(GetCurrentDir+'\dic\');
        end;

        sql:='select dic_file,length(dic_file) from dic_file where upper(dic_filename)='''+uppercase(dicFileName)+'''';
        ms:= self.dbProvide.getBlobField(sql,'dic_file') ;
       // ms.SaveToFile('test.dic');
        ms.Position:=0;
        if ms.Size>1 then
                 ms.SaveToFile( GetCurrentDir+'\dic\'+dicFileName);
        ms.Free;
end;

function TStruct_MetaSource.getDicDefineCDS: TClientDataSet;
var strSql:String;
begin
     if cdsdicdefine.State=dsInactive  then
     begin
       //  strSql := 'select * from '+self.SchemaName+ 'dic_source where startup_load<>''N''';
        strSql := 'select * from '+self.SchemaName+ 'dic_source ';
       //  strSql := 'select * from '+self.SchemaName+ 'user_tables ';
        self.dbProvide.SelectCommand(cdsdicdefine, strSql, 0);
     end;
     result:=cdsdicdefine;
end;



function TStruct_MetaSource.getTableDefineCDS(uAppname,
  uTablename: string): TClientDataSet;
  var haveRec:Boolean;
  var tmpCDS:TClientDataSet;
  var strSql:String;
  begin
  //    判断记录是否已存在

       if  tableDefine.Active = True then
      begin
           //cndebugger.TraceMsg('uppercase tablename'+uppercase(uTableName));
          tabledefine.First;
          tabledefine.Filtered:=false;
          haveRec := tableDefine.Locate('AppId;TableName',
             VarArrayOf([uAppname, uppercase(uTableName)]), [loCaseInsensitive,
              loCaseInsensitive]);
      end
      else    haverec := False;


      if haveRec = false then
      begin
            tmpCDS := TClientDataSet.create(nil);
            try
              strSql := 'select * from ' + self.SchemaName +
                'tabledefine where tablename=';
              strSql := strSql + '''' +  uppercase(uTableName) + ''' and appid=';
              strSql := strSql + '''' +  uAppname + '''';
              //showmessage(strsql);
              dbProvide.SelectCommand(tmpCDS, strSql, 0);
              tableDefine.AppendData(tmpCDS.Data, haveRec);
              {$IFNDEF NDEBUG}
                  CnDebugger.TraceMsg(inttostr(tabledefine.RecordCount));
               {$ENDIF}
             finally
              tmpCDS.Close;
              freeandNil(tmpCDS);

            end;
      end;
      result:= tableDefine;
    
end;




procedure TStruct_MetaSource.initDicCds;
var rsList,tcds:TClientDataSet;
var file1,file2,  strDicId,strSql,strKeyField,strDicFile:String;
var tmpStream : TMemoryStream;
var startup_load:String;
var dicMetaBase:TDicBaseItem;
begin

    rslist:=getDicDefineCDS;
    rslist.First;

    while not rslist.Eof do
    begin
        startup_load:='';
        strDicId:=rslist.FieldByName('dicid').AsString;
        strKeyField:=rslist.FieldByName('dicKeyField').AsString;
        strDicFile:=rslist.FieldByName('dicfilename').AsString;
        file1:= GetCurrentDir+'\dic\'+rslist.FieldByName('dicfilename').AsString;
        startup_load:=rslist.FieldByName('startup_load').AsString;

         dicMetaBase:= TDicBaseItem.Create;
         with  rslist do
         begin
         dicMetaBase.dicChineseName:=fieldbyname('dicChineseName').asstring;
         dicMetaBase.dicFileName:=fieldbyname('dicFileName').asstring;
         dicMetaBase.dicFilterSql:=fieldbyname('dicFilterSql').asstring;
         dicMetaBase.dicKeyField:=fieldbyname('dicKeyField').asstring;
         dicMetaBase.dicName:=fieldbyname('dicName').asstring;;
         dicMetaBase.dicSourceTable:=fieldbyname('dicSourceTable').asstring;
         dicMetaBase.dicValueField:=fieldbyname('dicValField').asstring;
         dicMetaBase.dicid:=fieldbyname('dicId').asstring;
         dicMetaBase.dicLevelMode:=fieldbyname('dicLevelMode').asString;
         dicMetaBase.dicPy:=fieldbyname('dicPy').AsString;
         end;



       if strDicFile='' then  //数据字典不以文件形式存在,以数据表的形式存在
       begin
            //数据字典保存在一个队列中,确保一个字典表只对应一个对象实例
            file1:=file1+rslist.FieldByName('dicSourceTable').AsString;
            if  (Structbase.DicDataSets.find(file1)=nil)   then   //队列中找不到字典表
            begin
               tcds:=Tclientdataset.Create(nil);
                {  对于需要外部模块中自主注册字典项目的情况,必须
                   1、保证元数据字典列表中，该字典项目存在，否则在使用中会找不到
                      字典项目定义
                   2、通过startup_load字段控制在启动时是否加载字典，当
                      字典表与元数据表不在同一台服务器上时，数据字典无法在启动时与元数据
                      一同加载，只能在应用模块加载时,手工将字典注册到字典队列
                      见：TStruct_Util.registDicCDS 方法
                }
                if  startup_load<>'N' then
                begin
                   strsql:='select * from ' + rslist.FieldByName('dicSourceTable').AsString;
                   self.dbProvide.SelectCommand(tcds,strSql,0);
                end;

                tcds.filename:=file1;
                Structbase.DicDataSets.AddDicDataSet(tcds);

            end;
            
       end;

        if Structbase.DicDataSets.find(file1)=nil then
        begin
           if (not FileExists(file1)) and  (startup_load<>'N') then
           begin
             self.DownloadDicFile(strDicid,strDicfile);
           end;
           
           if (FileExists( file1)) and  (startup_load<>'N') then
           begin
              tcds:=Tclientdataset.Create(nil);
              tmpStream:= TMemoryStream.Create;
              tmpStream.loadfromfile(file1);

              try
                  UnCompressionStream(tmpStream );
              //    tcds:= TclientDataset.Create(nil); //由list负责释放
                  tcds.LoadFromStream(tmpstream);
                  tcds.AddIndex(strKeyField+ 'Index',strKeyField, [ixCaseInsensitive]);
                  tcds.IndexName:= strKeyField+ 'Index';
                  tcds.IndexFieldNames:= strKeyField;
                  tcds.filename:=file1;
                  Structbase.DicDataSets.AddDicDataSet(tcds);

              except
                  showmessage(file1+'解压失败');
              end;
               tmpStream.free;
              //tcds.load (tmpStream);
           end
             else
                 if  startup_load<>'N' then
                     showmessage('错误发生在:TStruct_metaSource.initDicCds: 数据字典文件:'+file1+'不存在,无法初始化字典环境!');
        end;
       {$IFNDEF NDEBUG}

                  CnDebugger.TraceMsg('初始化字典:'+strDicId);
                  CnDebugger.TraceMsg(  '字典记录数:'+
                  inttostr((filelist.Objects[filelist.indexof(file1)] as tclientdataset).RecordCount));
       {$ENDIF}

       //增加数据字典条目
          dicMetaBase.dicDataSet:= Structbase.DicDataSets.find(file1);
          Structbase.DicItems.AddDicItem(dicMetaBase);
         // dicmetabase.dicCloneCursorDataSet;
          rslist.Next;
    end;
     {$IFNDEF NDEBUG}
         CnDebugger.TraceMsg('SYS_ZDLX位置:'+inttostr(diccdslist.IndexOf('SYS_ZDLX')));
     {$ENDIF}



end;





end.
