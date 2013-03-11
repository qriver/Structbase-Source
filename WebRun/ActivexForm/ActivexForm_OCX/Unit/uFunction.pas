unit uFunction;

interface
uses XmlRegObj,Classes,XMLIntf,sysutils,Dialogs,Windows;

function getXmlFileVer(AFileName:String):String;
function GetFileVersionString(const AFileName: String): String;
procedure buildDownloadQueue(downloadQueue:TStringList;ms:TStream);
procedure myShowMessage(strMessage:String);

//function GetFileVersionInfoSize(
//lptstrFilename: PChar; // 文件名
//var lpdwHandle: DWORD // set to zero
// ): DWORD; stdcall;

var FCurDir:String;
implementation
uses uMessageWizard;

procedure buildDownloadQueue(downloadQueue:TStringList;ms:TStream);
 var
    FxmlObj:TXmlRegObj;
    node,node1:IXMLNode;
    i:integer;
    filename,downurl,fileversion,fileversion2:String;
begin
   //  showmessage(FCurDir);
     downloadQueue.Clear;
     FxmlObj:=TXmlRegObj.Create;
     FxmlObj.LoadRegistryFile(ms);
     downurl:= FxmlObj.GetNode(uppercase('DOWNLOAD'),false).Attributes['URL'];
     {升级系统依赖包}
     node:=FxmlObj.GetNode(uppercase('PKGFILES'),false);
     for i:=0 to  node.ChildNodes.Count-1 do
     begin
        filename:=node.ChildNodes[i].Attributes['NAME'];
        if NOT FileExists(FCurDir + '\' +filename) then
              downloadQueue.Add(downurl+filename);
     end;

     {升级程序文件}

     node:=FxmlObj.GetNode(uppercase('PROGRAME'),false);
     for i:=0 to  node.ChildNodes.Count-1 do
     begin
        fileversion2:='';
        filename:=node.ChildNodes[i].Attributes['NAME'];
        fileversion:=node.ChildNodes[i].Attributes['VER'];
        if NOT FileExists(FCurDir + '\' +filename) then
              downloadQueue.Add(downurl+filename)
        else
            begin
                fileversion2:= GetFileVersionString(filename);
                if (fileversion<>fileversion2) then
                    downloadQueue.Add(downurl+filename);
                 // showmessage(inttostr(sysutils.GetFileVersion(filename)) );
            end;
     end;

     FxmlObj.Free;
end;




function GetFileVersionString(const AFileName: String): String;
var
  FileName: string;
  InfoSize, Wnd: DWORD;
  VerBuf: Pointer;
  FI: PVSFixedFileInfo;
  VerSize: DWORD;
begin
  if pos('.XML',uppercase(AFIleName))>0 then
  begin
      result:=getXmlFileVer(AFIleName);
      exit;
  end;
  Result := '';
  FileName := FCurDir + '\'+AFileName;
  UniqueString(FileName);
  InfoSize := GetFileVersionInfoSize(PChar(FileName), Wnd);
  if InfoSize <> 0 then
  begin
    GetMem(VerBuf, InfoSize);
    try
      if GetFileVersionInfo(PChar(FileName), Wnd, InfoSize, VerBuf) then
        if VerQueryValue(VerBuf, '\', Pointer(FI), VerSize) then
        begin
          Result:= InttoStr(FI.dwFileVersionMS div $10000)+'.'
            +IntToStr(FI.dwFileVersionMS mod $10000)+'.'
            +IntToStr(FI.dwFileVersionLS div $10000)+'.'
            +IntToStr(FI.dwFileVersionLS mod $10000);
        end;
    finally
      FreeMem(VerBuf);
    end;
  end;
end;


function getXmlFileVer(AFileName:String):String;
var
    FxmlObj:TXmlRegObj;
    node,node1:IXMLNode;

begin
     FxmlObj:=TXmlRegObj.Create;
     FxmlObj.LoadRegistryFile(FCurDir + '\'+AFileName);
     result:= FxmlObj.GetNode(uppercase('AUTODOWNLOAD'),false).Attributes['VER'];
     FxmlObj.Free;
end;

procedure myShowMessage(strMessage:String);
begin
  //WizardForm.Visible:=true;
 // WizardForm.show;
 // WizardForm.Label1.Caption:=strMessage;
end;

end.
