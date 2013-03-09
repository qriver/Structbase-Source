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
  //    �жϼ�¼�Ƿ��Ѵ���

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



       if strDicFile='' then  //�����ֵ䲻���ļ���ʽ����,�����ݱ����ʽ����
       begin
            //�����ֵ䱣����һ��������,ȷ��һ���ֵ��ֻ��Ӧһ������ʵ��
            file1:=file1+rslist.FieldByName('dicSourceTable').AsString;
            if  (Structbase.DicDataSets.find(file1)=nil)   then   //�������Ҳ����ֵ��
            begin
               tcds:=Tclientdataset.Create(nil);
                {  ������Ҫ�ⲿģ��������ע���ֵ���Ŀ�����,����
                   1����֤Ԫ�����ֵ��б��У����ֵ���Ŀ���ڣ�������ʹ���л��Ҳ���
                      �ֵ���Ŀ����
                   2��ͨ��startup_load�ֶο���������ʱ�Ƿ�����ֵ䣬��
                      �ֵ����Ԫ���ݱ���ͬһ̨��������ʱ�������ֵ��޷�������ʱ��Ԫ����
                      һͬ���أ�ֻ����Ӧ��ģ�����ʱ,�ֹ����ֵ�ע�ᵽ�ֵ����
                      ����TStruct_Util.registDicCDS ����
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
              //    tcds:= TclientDataset.Create(nil); //��list�����ͷ�
                  tcds.LoadFromStream(tmpstream);
                  tcds.AddIndex(strKeyField+ 'Index',strKeyField, [ixCaseInsensitive]);
                  tcds.IndexName:= strKeyField+ 'Index';
                  tcds.IndexFieldNames:= strKeyField;
                  tcds.filename:=file1;
                  Structbase.DicDataSets.AddDicDataSet(tcds);

              except
                  showmessage(file1+'��ѹʧ��');
              end;
               tmpStream.free;
              //tcds.load (tmpStream);
           end
             else
                 if  startup_load<>'N' then
                     showmessage('��������:TStruct_metaSource.initDicCds: �����ֵ��ļ�:'+file1+'������,�޷���ʼ���ֵ价��!');
        end;
       {$IFNDEF NDEBUG}

                  CnDebugger.TraceMsg('��ʼ���ֵ�:'+strDicId);
                  CnDebugger.TraceMsg(  '�ֵ��¼��:'+
                  inttostr((filelist.Objects[filelist.indexof(file1)] as tclientdataset).RecordCount));
       {$ENDIF}

       //���������ֵ���Ŀ
          dicMetaBase.dicDataSet:= Structbase.DicDataSets.find(file1);
          Structbase.DicItems.AddDicItem(dicMetaBase);
         // dicmetabase.dicCloneCursorDataSet;
          rslist.Next;
    end;
     {$IFNDEF NDEBUG}
         CnDebugger.TraceMsg('SYS_ZDLXλ��:'+inttostr(diccdslist.IndexOf('SYS_ZDLX')));
     {$ENDIF}



end;





end.
