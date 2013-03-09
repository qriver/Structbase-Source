unit DBpl_ImplIDBProvide_QJ;

interface
uses DBpl_IDBProvide,PHPRPC,PHPRPCClient,DBClient,classes,
PHPRPCIdHttpClient,
   StrUtils,ENcdDecd,Types;

Type

TQJDBProvide=Class(TInterfacedObject,IDBProvideInterface)      // IDBProvideInterface接口的全江版本实现

  private
       strUrl:String ;
       strJndiName:String;
       strAuthCode:String;
       fmyPostToDataBase:Boolean ;
       FmyPHPRPC_Client: TPHPRPCIdHttpClient;
       procedure SetmyPostToDataBase(const Value: Boolean);
       property  myPostToDataBase: Boolean read fmyPostToDataBase
               write SetmyPostToDataBase default False;

   public
     {IDBProvideInterface}
        FRefCount: Integer;
        function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
        function _AddRef: Integer; stdcall;
        function _Release: Integer; stdcall;
        function  SelectCommand(var ACDS: TClientDataSet;ASelectText:WideString;RowNumber:integer):integer;
        function  getBlobField(ASelectText:WideString;fieldName:WideString):TMemoryStream;
        function  putBlobField(tableName:WideString;BlobField:WideString;LocateSql:WideString; ms:TmemoryStream):String;
        function  ExecuteSql(var strSql:String):Integer;
        procedure setUrl(Url:String);
        function  getUrl():String;
        procedure setAuthCode( AuthCode:WideString);
        procedure setJndiName( JndiName:WideString);
        function  getRefCount():integer;

       constructor Create(); overload;
       destructor Destroy ;  overload;

  End;


implementation

uses Windows,SysUtils,Dialogs,Variants,Base64,DB ;
{ TJunDBProvide }

//var
   // strUrl:String ;
  //  /strJndiName:String;
   //strAuthCode:String;



function TQJDBProvide.SelectCommand(var ACDS: TClientDataSet;
  ASelectText: WideString; RowNumber: integer): integer;
 
{-------------------------------------------------------------------------------
  过程名:    TQJDBProvide.SelectCommand
  作者:      quanj
  日期:      2012.03.13
  参数:      ACDS:             TClientDataSet;
             ASelectText:      WideString;
             RowNumber:        integer        取回行限制,0为不限制
  返回值:    无
-------------------------------------------------------------------------------}
  var
  data: string;
  ptd: Boolean;
  clientProxy: Variant;
  StrStream: TStringStream;
  ClientDataSet: TClientDataSet;

begin
  if not assigned(acds) then showmessage('SelectCommand 参数 acds 没有初始化');
   if acds.State<>dsInactive	 then
     acds.EmptyDataSet;
 begin
  try
     try
       try
        clientProxy := FmyPHPRPC_Client.UseService(strUrl);
        //FmyPHPRPC_Client.KeyLength := KeyLength;
        //FmyPHPRPC_Client.EncryptMode := EncryptMode;
       // FmyPHPRPC_Client.Timeout:=1000;
        FmyPHPRPC_Client.EncryptMode := 0;
        data := Utf8ToAnsi(clientProxy.openSQL(AnsiToUtf8(ASelectText),
          AnsiToUtf8(strJndiName)));
       // FReceData := data;
        try
          StrStream := TStringStream.Create(data);
          try
            ACDS.LoadFromStream(StrStream);
          finally
            FreeAndNil(StrStream);
          end;
        finally
           FreeAndNil(ClientDataSet);
           result:=0;
        end;
      except
        on E: Exception do
        begin
        //  Self.FmyActive := False;
          raise Exception.Create('查询数据出错,出错原因:' + data);
          result:=1;
        end;
      end;
    finally
      Self.myPostToDataBase := ptd;
    end;
  finally

  end
end;
end;


constructor TQJDBProvide.Create();
begin
        FmyPHPRPC_Client := TPHPRPCIdHttpClient.Create;
end;

procedure TQJDBProvide.SetmyPostToDataBase(const Value: Boolean);
begin
  fmyPostToDataBase := Value;
end;



function TQJDBProvide.getUrl: String;
begin
       result:=strurl;
end;

procedure TQJDBProvide.setUrl(url: String);
var list:TStringList;
var i,p:integer;
var str,name,value:String;
begin
     list:=TStringList.Create;
     list.Delimiter:=';';
     list.DelimitedText:=url;

     str:=url;
     for i:=0 to list.Count-1 do
     begin
         str:=list[i];
         p:=pos('=',str);
         name:=leftstr(str,p-1);

         value:=rightstr(str,length(str)-p);
         if uppercase(name)='URL' then   strUrl:=value;
         if uppercase(name)='JNDINAME' then   strJndiName:=value;
         if uppercase(name)='AUTHCODE' then   strAuthCode:=value;
     end;
     list.Free;
     strurl:=url;
end;

destructor TQJDBProvide.Destroy;
begin
      FreeAndNil(FmyPHPRPC_Client);
      inherited;
end;


function TQJDBProvide._AddRef: Integer;
begin
    INC(FRefCount);
// ShowMessage(Format('Increase reference count to %d.', [FRefCount]));
  result:=FRefCount;
end;

function TQJDBProvide._Release: Integer;
begin
   DEC(FRefCount);
  if FRefCount <> 0 then
  //  ShowMessage(Format('Decrease reference count to %d.', [FRefCount]))
  else begin
   //  self.Destory
   // ShowMessage('Decrease reference count to 0, and destroy the object.');
  end;
  result:=FRefCount;
end;





function TQJDBProvide.QueryInterface(const IID: TGUID; out Obj): HResult;
const
  E_NOINTERFACE = HResult($80004002);
begin
  if GetInterface(IID, Obj) then Result := 0 else Result := E_NOINTERFACE;
end;

function TQJDBProvide.getRefCount: integer;
begin
   result:= FRefCount;
end;

function TQJDBProvide.ExecuteSql(var strSql: String): Integer;
{-------------------------------------------------------------------------------
  过程名:    TQJDBProvide.SelectCommand
  作者:      quanj
  日期:      2012.03.13
  参数:      ACDS:             TClientDataSet;
             ASelectText:      WideString;
             RowNumber:        integer        取回行限制,0为不限制
  返回值:    无
-------------------------------------------------------------------------------}
  var
  data: string;
  ptd: Boolean;
  clientProxy: Variant;

begin
 begin
      try
        clientProxy := FmyPHPRPC_Client.UseService(strUrl);
        FmyPHPRPC_Client.EncryptMode := 0;
        data := Utf8ToAnsi(clientProxy.executeSQL(AnsiToUtf8(strSql),
          AnsiToUtf8(strJndiName)));
       if data<>'' then    //raise Exception.Create('执行语句出错,出错原因:' + data);
       begin
           raise Exception.Create('执行语句出错,出错原因:' + data);
         // showmessage('执行语句出错,出错原因:' + data);
       end;
      except
        on E: Exception do
        begin
        //  raise Exception.Create('执行语句出错,出错原因:' + E.message);
          result:=1;
          exit;
        end;
      end;
      result:=0;

end;

end;

function TQJDBProvide.getBlobField(ASelectText,
  fieldName: WideString): TMemoryStream;
var
  data: string;
  ptd: Boolean;
  clientProxy: Variant;
  StrStream: TStringStream;
  ms:TMemoryStream;
  ClientDataSet: TClientDataSet;
  accept: TByteDynArray ;
begin
  try

        ms:=TMemoryStream.Create;
        clientProxy := FmyPHPRPC_Client.UseService(strUrl);
      //  FmyPHPRPC_Client.KeyLength := KeyLength;
       // FmyPHPRPC_Client.EncryptMode := EncryptMode;
        FmyPHPRPC_Client.Timeout:=1000;
        FmyPHPRPC_Client.EncryptMode := 0;
        data :=  clientProxy.getBolbField(AnsiToUtf8(ASelectText),
        strJndiName,AnsiToUtf8(strauthCode));
        //showmessage(inttostr(length(data)));
        ms.Write(PAnsiChar(base64.decode(data))^,length(base64.decode(data)))  ;
        //ms.Write(accept,length(accept));
        ms.Position:=0;
        // jpg.LoadFromStream(ms);
       // img1.Picture.Assign(jpg);

       //ms使用后需要放掉
        result:=ms;
  except
        on E: Exception do
        begin
        //  Self.FmyActive := False;
          raise Exception.Create('查询数据出错,出错原因:' + E.message);
           result:=nil;
        end;
  end;
end;

procedure TQJDBProvide.setAuthCode(AuthCode: WideString);
begin
  strAuthCode:=AuthCode;
end;

procedure TQJDBProvide.setJndiName(JndiName: WideString);
begin
   strJndiName:=JndiName;
end;

function TQJDBProvide.putBlobField(tableName:WideString;BlobField:WideString;
                LocateSql:WideString; ms:TmemoryStream): String;
var
  data,sql: string;
  ptd: Boolean;
  clientProxy: Variant;
  StrStream: TStringStream;
  ClientDataSet: TClientDataSet;
  
begin
  try
        StrStream:= TStringStream.Create('');
        clientProxy := FmyPHPRPC_Client.UseService(strUrl);
        ms.Position:=0;
        EncdDecd.EncodeStream(ms,strStream);  //Base64 编码
        data:=strStream.DataString;
        FmyPHPRPC_Client.Timeout:=500000;
        FmyPHPRPC_Client.EncryptMode := 0;
        //showmessage(inttostr(length(data)));
        if  length(data)>1024*1024*2 then
        begin
           showmessage('上传文件不能大于2M.('+inttostr(length(data))+')');
           result:='-1';
           exit;
        end;
        data :=  clientProxy.putBolbField(AnsiToUtf8(tablename),
                   AnsiToUtf8(blobfield),AnsiToUtf8(locateSql),
                    data,self.strJndiName,AnsiToUtf8(strauthCode) );

         result:=data;
         StrStream.Free;
  except
        on E: Exception do
        begin
          result:=E.message;
        //  Self.FmyActive := False;
          raise Exception.Create('查询数据出错,出错原因:' + E.message);
       //    result:=nil;
        end;
  end;
end;




end.
