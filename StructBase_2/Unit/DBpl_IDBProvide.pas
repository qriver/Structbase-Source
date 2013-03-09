unit DBpl_IDBProvide;
interface

uses DBClient,classes;
Type
  //数据服务接口定义
  IDBProvideInterface = interface(IInterface)
    ['{C2448A6E-DE3B-4AE8-A9D3-06E53595D874}']
    function getRefCount: Integer;
    function getUrl: string;
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function SelectCommand(var ACDS: TClientDataSet;ASelectText:WideString;
        RowNumber:integer): Integer;
    function  ExecuteSql(var strSql:String):Integer;
    function  getBlobField(ASelectText:WideString;fieldName:WideString):TMemoryStream;
    function  putBlobField(tableName:WideString;
                           BlobField:WideString;
                           LocateSql:WideString;
                           ms:TmemoryStream ):String;
    //function  WriteBlobField(ASelectText:WideString;fieldName:WideString):TMemoryStream;
    procedure setUrl(strUrl:String);
    procedure setAuthCode( AuthCode:WideString);
    procedure setJndiName( JndiName:WideString);
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

  end;

implementation

end.





