unit fDataResForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls,DBClient,fBaseForm, ImgList,
  Menus, fTreeViewFrame ;


type
  TfrmDataRes = class(TBaseForm)
    TreeViewFrame1: TTreeViewFrame;
    pm1: TPopupMenu;
    menuDraw: TMenuItem;
    addNew: TMenuItem;
    pnl2: TPanel;
    mnuEdit: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    clear: TMenuItem;
    defineResource: TMenuItem;
    procedure btn1Click(Sender: TObject);
    procedure menuDrawClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);


    procedure mnuEditClick(Sender: TObject);
    procedure addNewClick(Sender: TObject);
    procedure defineResourceClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var frmDataRes: TfrmDataRes;

implementation
uses   fResourceForm,ufrmTableDefine;
var    resList:TStringList;
var    frmResource: TResourceForm;
var    frmTableDefine: TfrmTableDefine;


{$R *.dfm}

procedure TfrmDataRes.btn1Click(Sender: TObject);
var acds:TClientDataSet;
var tvNode:TTreenode;
begin                                    


end;





procedure TfrmDataRes.menuDrawClick(Sender: TObject);
var acds:TClientDataSet;
begin
  inherited;
  acds:=Tclientdataset.Create(self);
  self.mDBProvide.SelectCommand(acds,'select * from resource_list',0);
  TreeViewFrame1.setDataSource(acds);
  TreeViewFrame1.displayField:='Resource_name';
  TreeViewFrame1.keyField:='Resource_id';
  TreeViewFrame1.parentField:='Parent_id';
  TreeViewFrame1.DrawTreeView;
end;

procedure TfrmDataRes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmDataRes:=nil;
end;

procedure TfrmDataRes.FormCreate(Sender: TObject);
begin
  inherited;
  frmResource:= TResourceForm.create(self);
  frmResource.Parent:=self.pnl2;

  frmResource.BorderStyle:= bsNone;
  frmResource.Top:=0;
  frmResource.Left:=0;
  frmResource.Align:=alclient;
  frmResource.Show;
  frmResource.Visible:=false;
  menuDrawClick(self);
end;

procedure TfrmDataRes.mnuEditClick(Sender: TObject);
var myNode:TNodeCLs;
begin
  inherited;
    if not assigned(TreeViewFrame1.tvResource.Selected) then exit;

    frmResource.Visible:=true;
    myNode:=TNodeCls(TreeViewFrame1.tvResource.Selected.data);
    frmResource.primaryId:=mynode.keyField;

    //frmResource.primaryId:=TNodeCls( TreeViewFrame1.tvResource.Items[0].Data).keyField;
    frmResource.setState('UPDATE');
    frmResource.OnInputOver:=menuDrawClick;
end;

procedure TfrmDataRes.addNewClick(Sender: TObject);
var myNode:TNodeCLs;
begin
  inherited;
//    frmTableDefine.Visible:=False;
    frmResource.Visible:=true;
   if not assigned(TreeViewFrame1.tvResource.Selected) then
       frmResource.parentId:=''
   else
   begin
       myNode:=TNodeCls(TreeViewFrame1.tvResource.Selected.Data);
       frmResource.parentId:=mynode.keyField;
   end;
   frmResource.setState('ADDNEW');
   frmResource.OnInputOver:=menuDrawClick;
end;

procedure TfrmDataRes.defineResourceClick(Sender: TObject);
var myNode:TNodeCLs;
begin
  frmResource.Visible:=false;
  if not Assigned(frmTableDefine) then
  begin
    frmTableDefine:=TfrmTableDefine.create(self);
    frmTableDefine.Parent:=self.pnl2;
    frmTableDefine.BorderStyle:= bsNone;
    frmTableDefine.Top:=0;
    frmTableDefine.Left:=0;
    frmTableDefine.Align:=alclient;
    frmTableDefine.Show ;

    if not assigned(TreeViewFrame1.tvResource.Selected) then exit;
      myNode:=TNodeCls(TreeViewFrame1.tvResource.Selected.data);
      frmTableDefine.MyNodeValue(myNode.keyField);
  end
  else
  begin
    frmTableDefine.Visible:=True;
    frmTableDefine.Parent:=self.pnl2;
    frmTableDefine.BorderStyle:= bsNone;
    frmTableDefine.Top:=0;
    frmTableDefine.Left:=0;
    frmTableDefine.Align:=alclient;

     if not assigned(TreeViewFrame1.tvResource.Selected) then exit;
     myNode:=TNodeCls(TreeViewFrame1.tvResource.Selected.data);
     frmTableDefine.MyNodeValue(myNode.keyField);
     exit;
  end;

end;


end.
