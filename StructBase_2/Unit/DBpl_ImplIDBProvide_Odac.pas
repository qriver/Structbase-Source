unit DBpl_ImplIDBProvide_Odac;

interface
uses DBpl_IDBProvide, DBClient,Provider,DB,Ora,classes,Dialogs;

Type

  TOdacDBProvide=Class(TInterfacedObject,IDBProvideInterface)      // IDBProvideInterface接口的ODAC版本实现
  private
      function GetData(ADataSet:TDataSet):OleVariant;

  protected
       FRefCount: Integer;
       function SelectCommand(var ACDS: TClientDataSet;ASelectText:WideString;RowNumber:integer):integer;
       function  ExecuteSql(var strSql:String):Integer;
       function  getBlobField(ASelectText:WideString;fieldName:WideString):TMemoryStream;
       function  putBlobField(tableName:WideString;BlobField:WideString;LocateSql:WideString; ms:TmemoryStream):String;
       function  getUrl():String;
  public
        function _AddRef: Integer; stdcall;
        function _Release: Integer;
       constructor Create(); overload;
       destructor Destory ;
       procedure setUrl(Url:String);
       procedure setJndiName( JndiName:WideString);
       procedure setAuthCode( AuthCode:WideString);
      function  getRefCount():integer;

  End;

var
    strUrl:String ;
    OraSession:TOraSession;
implementation

{ TOdacDBProvide }

constructor TOdacDBProvide.Create;
begin
    OraSession:=TOraSession.Create(nil);
end;

destructor TOdacDBProvide.Destory;
begin
     OraSession.Free;
     inherited;
end;

function TOdacDBProvide.ExecuteSql(var strSql: String): Integer;
var ds:TOraDataSet;
begin
  ds:=TOradataset.Create(nil);
  ds.Session:=orasession;
  ds.SQL.text :=strSql;
  ds.execute;
  ds.Free;

end;

function TOdacDBProvide.getBlobField(ASelectText,
  fieldName: WideString): TMemoryStream;
begin

end;

function TOdacDBProvide.GetData(ADataSet:TDataSet):OleVariant;
var adp:TDataSetProvider;
begin
  adp:=TDataSetProvider.Create(nil) ;
  with adp do
  begin
  DataSet := ADataSet;
  Result := Data;
  end;
  adp.Free;
end;

function TOdacDBProvide.getRefCount: integer;
begin

end;

function TOdacDBProvide.getUrl: String;
begin
   result:=strurl;
end;



function TOdacDBProvide.putBlobField(tableName:WideString;BlobField:WideString;LocateSql:WideString; ms:TmemoryStream): String;
begin

end;

function TOdacDBProvide.SelectCommand(var ACDS: TClientDataSet;
  ASelectText: WideString; RowNumber: integer): integer;
var ds:TOraDataSet;
begin
  ds:=TOradataset.Create(nil);
  ds.Session:=orasession;
  ds.SQL.text :=ASelectText;
  ds.Open;
  ACDS.Data := GetData(ds) ;
  ds.Free;
end;

procedure TOdacDBProvide.setAuthCode(AuthCode: WideString);
begin

end;

procedure TOdacDBProvide.setJndiName(JndiName: WideString);
begin

end;

procedure TOdacDBProvide.setUrl(Url: String);
var alist:TStringList;
begin
  //url:='username=data_exchange,password=data_exchange,server:=10.75.53.53:orcl';
  alist:=TStringList.create();
  alist.CommaText:=url;
  OraSession.Options.Direct:=true;
  OraSession.Username:=alist.ValueFromIndex[0];
  OraSession.Password:=alist.ValueFromIndex[1];
  OraSession.Server:=alist.ValueFromIndex[2];
  TRY
         OraSession.Connect;
         alist.Free;
  EXCEPT
         showmessage('无法建立与数据库'+url+'的连接');
  END;

end;

function TOdacDBProvide._AddRef: Integer;
begin
       INC(FRefCount);
// ShowMessage(Format('Increase reference count to %d.', [FRefCount]));
  result:=FRefCount;
end;

function TOdacDBProvide._Release: Integer;
begin
     DEC(FRefCount);
  if FRefCount <> 0 then
  //  ShowMessage(Format('Decrease reference count to %d.', [FRefCount]))
  else begin
       self.Destory;
  end;
  result:=FRefCount;
end;

end.
