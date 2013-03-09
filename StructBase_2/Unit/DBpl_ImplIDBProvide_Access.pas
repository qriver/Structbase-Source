unit DBpl_ImplIDBProvide_Access;

interface
uses DBpl_IDBProvide,DBClient,ADODB,Provider,DB,Classes,MidasLib;

Type

  TAccessDBProvide=Class(TInterfacedObject,IDBProvideInterface)      // IDBProvideInterface接口的全江版本实现
  private
      function GetData(ADataSet:TDataSet):OleVariant;

  public
      {IDBProvideInterface}
       FRefCount: Integer;
//        function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
        function _AddRef: Integer; stdcall;
        function _Release: Integer; stdcall;

        function SelectCommand(var ACDS: TClientDataSet;ASelectText:WideString;RowNumber:integer):integer;
        function  ExecuteSql(var strSql:String):Integer;
        function  getBlobField(ASelectText:WideString;fieldName:WideString):TMemoryStream;
        function  putBlobField(tableName:WideString;BlobField:WideString;LocateSql:WideString; ms:TmemoryStream ):String;
        procedure setUrl(Url:String);
        function getUrl():String;
        procedure setAuthCode( AuthCode:WideString);
        procedure setJndiName( JndiName:WideString);

       constructor Create(); overload;
       destructor Destroy;   overload;
       function getRefCount():integer;

  End;

var
    strUrl:String ;
    adoConnect: TADOConnection;

implementation
uses Windows,SysUtils,Dialogs,Variants,Base64 ;
{ TJunDBProvide }




function TAccessDBProvide.SelectCommand(var ACDS: TClientDataSet;
  ASelectText: WideString; RowNumber: integer): integer;
 
{-------------------------------------------------------------------------------
  过程名:    TAccessDBProvide.SelectCommand
  作者:      quanj
  日期:      2012.03.13
  参数:      ACDS:             TClientDataSet;
             ASelectText:      WideString;
             RowNumber:        integer        取回行限制,0为不限制
  返回值:    无
-------------------------------------------------------------------------------}
var    adoDataset: TADODataSet;
begin
 try
     //acds.RecordCount;

     adoDataset:= TADODataSet.create(nil);
     adoDataset.Connection:=adoConnect;
     adoDataset.CommandText:=aSelectText;
     adoDataset.Active;
     ACDS.Data := GetData(adoDataset) ;
     adoDataset.Free;
 except
    on E: Exception do showmessage(E.Message);


  end

end;






function TAccessDBProvide.getUrl: String;
begin
       result:=strurl;
end;



procedure TAccessDBProvide.setUrl(url: String);
begin
    strUrl:=url;
    adoconnect.ConnectionString:=url;
    adoconnect.LoginPrompt:=false;
    adoconnect.Open();
end;



function TAccessDBProvide._AddRef: Integer;
begin
    INC(FRefCount);
// ShowMessage(Format('Increase reference count to %d.', [FRefCount]));
  result:=FRefCount;
end;

function TAccessDBProvide._Release: Integer;
begin
  DEC(FRefCount);
  if FRefCount <> 0 then
  //  ShowMessage(Format('Decrease reference count to %d.', [FRefCount]))
  else begin
        // adoConnect.CLOSE;
      //   adoConnect.Free;
      //   self.Destroy;
  end;
  result:=FRefCount;
end;

constructor TAccessDBProvide.Create();
begin
    //strUrl:='Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source=..\Db\db.mdb;Mode=ReadWrite|Share Deny None;Persist Security Info=false';
    inherited;
    adoConnect:= ADODB.TADOConnection.create(nil);
    FRefCount:=0;
end;


function TAccessDBProvide.GetData( ADataSet:TDataSet):OleVariant;
begin

  with TDataSetProvider.Create(nil) do
  begin
      DataSet := ADataSet;
      Result := Data;
      free;
  end;
end;



function TAccessDBProvide.getRefCount: integer;
begin
   result:= FRefCount;
end;



destructor TAccessDBProvide.Destroy ;
begin
   adoConnect.CLOSE;
   adoConnect.Free;

   inherited;
end;

function TAccessDBProvide.ExecuteSql(var strSql: String): Integer;
begin
  try
    adoConnect.Execute(strSql);
    result:=0;
  except
      result:=-1;
  end;
end;

function TAccessDBProvide.getBlobField(ASelectText,
  fieldName: WideString): TMemoryStream;
begin

end;

procedure TAccessDBProvide.setAuthCode(AuthCode: WideString);
begin

end;

procedure TAccessDBProvide.setJndiName(JndiName: WideString);
begin

end;

function TAccessDBProvide.putBlobField(tableName:WideString;BlobField:WideString;LocateSql:WideString; ms:TmemoryStream): String;
begin

end;

initialization

finalization


end.
