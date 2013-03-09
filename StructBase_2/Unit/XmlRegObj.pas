{ TRegObj }
unit XmlRegObj;

InterFace

Uses SysUtils, Classes, XMLDoc, XMLIntf, Dialogs;

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
    procedure LoadRegistryFile(const FileName: Widestring);
    function GetNode(const key: Widestring; CanCreate: Boolean): IXMLNode;
    function ReadValue(const aName: Widestring; out Value: OleVariant): Boolean;
    function GetNodeValue(key: Widestring; ValueName: String): String;
  end;

implementation

uses Variants,uMyException;

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
  try
    FRegFile := FileName;
    if FileExists(FRegFile) then
    begin
      FXMLDoc := nil; // �ͷŶԽӿڵ����ã�ȷ��ֻ��һ������ʵ���ڱ�������������
      FXMLDoc := LoadXMLDocument(FileName);
    end
    else
      raise TCustomException.Create('XML�ļ���' + FRegFile + '������',XML�ļ�������);
  Except
     on E: TCustomException do
       if e.ecode=XML�ļ������� then
       begin
           e.showMsg;
           raise Exception.Create('XML�ļ�װ�ش���!');
       end;
     on exception do
          raise Exception.Create('XML�ļ�װ�ش���!');
  end;
end;

function TXmlRegObj.GetNode(const key: Widestring; CanCreate: Boolean)
  : IXMLNode;
// �ڲ�����
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
    FCurrNode := FoundNode;
    Result := FoundNode; // ͬ��
  Finally
    aList.Free;
  end;
end;

function TXmlRegObj.ReadValue(const aName: Widestring; out Value: OleVariant)
  : Boolean;
var
  Node: IXMLNode;
begin
  Result := False;
  if assigned(FCurrNode) then
  begin
    Node := FCurrNode.AttributeNodes.FindNode(WideUpperCase(aName));
    if assigned(Node) then
    begin
      if not varisnull(Node.NodeValue) then
        Value := Node.NodeValue
      else
        Value := '';
      Result := True;
    end;
  end;
end;

function TXmlRegObj.GetNodeValue(key: Widestring; ValueName: String): String;
var
  flag: Boolean;
var
  Value: OleVariant;
var
  str: String;
begin
  self.GetNode(key, flag);
  ReadValue(ValueName, Value);
  // FValue:=value;
  GetNodeValue := Value;
end;

end.
