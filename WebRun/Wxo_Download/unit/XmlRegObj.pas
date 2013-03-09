{ TRegObj }
unit XmlRegObj;
InterFace

Uses SysUtils, Classes,  XMLDoc, XMLIntf;
Type
  TXmlRegObj = class(TObject)
  private
    FRegFile: String;
    FXMLDoc: IXMLDocument;
    FCurrNode: IXMLNode;
  protected
  public
    constructor Create;
    destructor Destroy; override; 
    procedure LoadRegistryFile(const FileName: Widestring); overload;
    procedure LoadRegistryFile(ms:TStream); overload;
    function GetNode(const key: Widestring; CanCreate: Boolean): IXMLNode;
    function ReadValue(const aName: Widestring;
      out Value: OleVariant): Boolean;
    function GetNodeValue(key:WideString; ValueName:String):String;
  end;
implementation



{ TRegObj }

constructor TXmlRegObj.Create;
begin

end;

destructor TXmlRegObj.Destroy;
begin

  inherited;
end;



procedure TXmlRegObj.LoadRegistryFile(const FileName: Widestring);
begin
  Try
    FRegFile := FileName;
    if FileExists(FRegFile) then
      FXMLDoc := LoadXMLDocument(FileName)

    else begin
 //     FXMLDoc:=NewXMLDocument;
    //  FXMLDoc.Encoding:='UTF-8';
    //  FXMLDoc.DocumentElement:=FXMLDoc.CreateNode('Doc');
    //  FXMLDoc.SaveToFile(FRegFile);
    end;
  Except
    on E: Exception do
      // Raise ERegistryException.CreateFmt('打开注册表出错：%s', [E.Message]);
  End;
end;



function TXmlRegObj.GetNode(const key: Widestring; CanCreate: Boolean): IXMLNode;
// 内部函数
  function InnerGetNode(const NodeStr: Widestring; FromNode: IXMLNode;
    aCanCreate: Boolean): IXMLNode;
  begin
    Result := Nil;
    if Trim(NodeStr) = '' then
      exit;
    if FromNode = Nil then
      exit;
    if aCanCreate then
      Result := FromNode.ChildNodes[NodeStr]
    else
      Result := FromNode.ChildNodes.FindNode(NodeStr);
  end;

var
  aList: TStrings;
  ParentNode, FoundNode: IXMLNode;
  i: Integer;
  tmpKey: String;
begin
  tmpKey := UpperCase(Trim(key)); // WideUpperCase
  if tmpKey = '' then
  Begin
    Result := FXMLDoc.DocumentElement;
    exit;
  End;
  ParentNode := FXMLDoc.DocumentElement;
  aList := TStringList.Create;
  try
    ExtractStrings(['\'], [], pchar(tmpKey), aList);
    for i := 0 to aList.Count - 1 do
    begin
      FoundNode := InnerGetNode(aList[i], ParentNode, CanCreate);
      if FoundNode = Nil then
        exit;
      ParentNode := FoundNode;
    end;
    FCurrNode:= FoundNode;
    Result := FoundNode; // 同上
  Finally
    aList.Free;
  end;
end;




function TXmlRegObj.ReadValue(const aName: Widestring;
  out Value: OleVariant): Boolean;
var
  Node: IXMLNode;
begin
  Result := False;
  if assigned(FCurrNode) then
  begin
    Node := FCurrNode.AttributeNodes.FindNode(WideUpperCase(aName));
    if assigned(Node) then
    begin
      Value := Node.NodeValue;
      Result := True;
    end;
  end;
end;


function TXmlRegObj.GetNodeValue( key: WideString;
   ValueName: String): String;
  var flag:Boolean;
  var value:OleVariant;
  var str:String;
begin
    self.GetNode(key,flag);
    ReadValue(ValueName,value)  ;
 //   FValue:=value;
    GetNodeValue:=value;
end;

procedure TXmlRegObj.LoadRegistryFile(ms: TStream);
begin
    FXMLDoc:=NewXMLDocument;
    FXMLDoc.LoadFromStream(ms,TXMLEncodingType.xetUTF_8);
end;

end.
