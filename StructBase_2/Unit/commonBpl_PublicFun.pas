unit commonBpl_PublicFun;

interface
uses SysUtils,DBClient,ExtCtrls,StdCtrls,Mask,DB,Dialogs,classes,ComCtrls,zlib;

function FormatDateStr(strDate:String):String;
procedure   CDSClone(srcCds,toCds:TClientDataSet);

procedure UnCompressionStream(var ASrcStream:TMemoryStream);
procedure CompressionStream(var ASrcStream:TMemoryStream;ACompressionLevel:Integer = 2)  ;
implementation


function FormatDateStr(strDate:String):String;
var t:String;
begin
 // t:=strtodate(strDate);
   t:=StringReplace(strdate,'-','',[rfReplaceAll]);
   t:=StringReplace(t,':','',[rfReplaceAll]);
   t:=StringReplace(t,' ','',[rfReplaceAll]);
  result:=t;
end;

procedure CDSClone(srcCds,toCds:TClientDataSet);
var i:integer;
var ts:TStream;
begin
    // freeandnil(tocds);
   //  tocds:=Tclientdataset.Create(nil);

     for i:=0 to srccds.FieldCount-1 do
     begin
            with  tocds.FieldDefs.AddFieldDef  do
            begin
                  Name := srcCds.Fields[i].FieldName;
                  DataType := srcCds.Fields[i].DataType;
                  Size := srcCds.Fields[i].Size;
            end;
       end;

     srccds.First;
     tocds.CreateDataSet ;
     //tocds.Open;
   //  showmessage(inttostr(tocds.RecordCount));
     while not srccds.Eof do
     begin
         tocds.Insert;
          for i:=0 to srccds.FieldCount-1 do
         begin
         // showmessage(srccds.Fields[i].Value);
             tocds.Fields[i].Assign(srccds.Fields[i]);
         end;

         srccds.Next;
     end;
    // showmessage(inttostr(tocds.RecordCount));

    // srccds.SaveToStream(ts,[dfBinary]);
   //  tocds.LoadFromStream(ts);
end;




procedure UnCompressionStream(var ASrcStream:TMemoryStream); //解压缩
var
nTmpStream:TDecompressionStream;
nDestStream:TMemoryStream;
nBuf: array[1..512] of Byte;
nSrcCount: integer;
begin
ASrcStream.Position := 0;
nDestStream := TMemoryStream.Create;
nTmpStream := TDecompressionStream.Create(ASrcStream);
try
    repeat
      //读入实际大小
      nSrcCount := nTmpStream.Read(nBuf, SizeOf(nBuf));
      if nSrcCount > 0 then
        nDestStream.Write(nBuf, nSrcCount);
    until (nSrcCount = 0);
    ASrcStream.Clear;
    ASrcStream.LoadFromStream(nDestStream);
    ASrcStream.Position := 0;
finally
    nDestStream.Clear;
    nDestStream.Free;
    nTmpStream.Free;
end;
end;
procedure CompressionStream(var ASrcStream:TMemoryStream;ACompressionLevel:Integer = 2); //压缩流
var
nDestStream:TMemoryStream;
nTmpStream:TCompressionStream;
nCompressionLevel:TCompressionLevel;
begin
ASrcStream.Position := 0;
nDestStream := TMemoryStream.Create;
    try
        //级别
        case ACompressionLevel of
          0:nCompressionLevel := clNone;
          1:nCompressionLevel := clFastest;
          2:nCompressionLevel := clDefault;
          3:nCompressionLevel := clMax;
          else
            nCompressionLevel := clMax;
        end;
        //开始压缩
        nTmpStream := TCompressionStream.Create(nCompressionLevel,nDestStream);
        try
          ASrcStream.SaveToStream(nTmpStream);
        finally
          nTmpStream.Free;//释放后nDestStream才会有数据
        end;
        ASrcStream.Clear;
        ASrcStream.LoadFromStream(nDestStream);
        ASrcStream.Position := 0;
    finally
        nDestStream.Clear;
        nDestStream.Free;
    end;
end;


end.
