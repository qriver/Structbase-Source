unit fTreeViewFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ImgList, ComCtrls, ExtCtrls,DBClient,DB,commctrl;
{ TNodeCls :自定义节点类型}
type
  PNode = ^TNodeCls;
  TNodeCls = class(TObject)
  private
     fKeyField:String;
     fItemId: HTreeItem;
  public
    property   keyField: String read fKeyField write fKeyField;
    property   itemId: HTreeItem read fItemId write fItemId;
  published

  end;


type
  TTreeViewFrame = class(TFrame)
    tvResource: TTreeView;
    ilMain: TImageList;
    procedure tvResourceGetImageIndex(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
     fKeyField:String;
     fdisplayField:String;
     fParentField:String;
     fDataSource:TClientDataSet;
     resList:TStringList;
     procedure addNode(strKey:String);
     function  getParentNode(strKey:String):TTreeNode;
  public
    { Public declarations }
     procedure  DrawTreeView;
     property   keyField: String read fKeyField write fKeyField;
     property   parentField: String read fParentField write fParentField;
     property   displayField: String read fdisplayField write fdisplayField;
     function   getNodeKeyValue():String;
     procedure  setDataSource(uDataSource:TClientDataSet) ;
     constructor Create;
     destructor destroy;   overload;
  end;

implementation

{$R *.dfm}

{ TTreeViewFrame }

procedure TTreeViewFrame.addNode(strKey: String);
var strParent,strDisplay,str:String;
var myNode:TNodeCLs;
var newNode:TTreeNode;

begin
   myNode:= resList.Objects[resList.IndexOf(strKey)] as TNodeCLs;
   if  myNode<>nil then  exit;


   fDataSource.First;
   fDataSource.Locate(fKeyField, VarArrayOf([strKey]), [loCaseInsensitive]);

   strParent:=fdatasource.FieldByName(fParentField).AsString;
   strDisplay:=fdatasource.FieldByName(self.fdisplayField).AsString;
   strDisplay:=strDisplay+' ('+strKey+')';

    myNode:=TNodeCls.Create;
    myNode.keyField:=strKey;
    newNode:=tvResource.Items.AddChildObject(getParentNode(strKey),strDisplay,myNode) ;
    myNode.itemId:=newNode.ItemId;

    resList.Objects[resList.IndexOf(strKey)]:= myNode;


end;


constructor TTreeViewFrame.Create;
begin
   // resList:=TStringList.Create;
end;



destructor TTreeViewFrame.destroy;
var i:integer;
begin
    inherited;
    for I := 0 to resList.Count - 1 do
       TNodeCls(resList.Objects[i]).Free;

    reslist.Free;
end;

procedure TTreeViewFrame.DrawTreeView;
var i:integer;
begin
 if not assigned(resList) then
 begin
         freeandnil(reslist);
         resList:=TStringList.Create;
 end;
  resList.Clear;
  tvResource.Items.Clear;
  while not fDataSource.Eof do
  begin
      //resList.Add(fDataSource.fieldbyname(keyField).AsString);
      resList.AddObject(fDataSource.fieldbyname(keyField).AsString,nil) ;
      fDataSource.Next;
  end;

  for i:=0 to resList.Count-1 do
  begin
      addNode(resList.Strings[i]);
  end;

end;


function TTreeViewFrame.getNodeKeyValue: String;
var s:String;
begin
  s:=PNode(tvResource.items[0].Data)^.keyField;
  result:=  PNode(tvResource.items[0].Data)^.keyField;
end;

function TTreeViewFrame.getParentNode(strKey: String): TTreeNode;
var strParent,strDisplay,str:String;
var myNode:TNodeCLs;
var newNode:TTreeNode;
begin
   fDataSource.First;
   fDataSource.Locate(fKeyField, VarArrayOf([strKey]), [loCaseInsensitive]);
   strParent:=fdatasource.FieldByName(fParentField).AsString;
   strDisplay:=fdatasource.FieldByName(self.fdisplayField).AsString;
   if strParent='' then
   begin
      result:=nil;
      exit;
   end;
   if  resList.Objects[resList.IndexOf(strParent)]=nil then
   begin
          addNode(strParent);
   end;
   myNode:=resList.Objects[resList.IndexOf(strParent)] as TNodeCLs;
   result:=tvResource.Items.GetNode(mynode.itemId)  ;
end;

procedure TTreeViewFrame.setDataSource(uDataSource:TClientDataSet);
begin
    fDataSource:=uDataSource;
end;

procedure TTreeViewFrame.tvResourceGetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
  if Node.HasChildren then
    if Node.Expanded then
      Node.ImageIndex := 0
    else
      Node.ImageIndex := 1
  else
    Node.ImageIndex := 1;
end;

end.



