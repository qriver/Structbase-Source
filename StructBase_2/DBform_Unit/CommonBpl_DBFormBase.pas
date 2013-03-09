unit CommonBpl_DBFormBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Mask,
  uStructbaseFrameWork,
  Struct_DBControls,
  DBpl_IDBProvide,
  CommonBpl_BaseType,
  Dialogs;

type
  TDbFormBase = class(TForm)
  private
    { Private declarations }
    fDbProvide:IDBProvideInterface;
  public
    { Public declarations }
    dbControls: TDBControls;
    function getAppId():String;virtual; abstract;
    function mDbProvide:IDBProvideInterface;
    Constructor  Create(AOwner: TComponent);override;
    Destructor Destroy; override;

    procedure DBCntlOnEnterListener(Sender: TObject);
  end;



implementation

{$R *.dfm}

{ TDbFormBase }

constructor TDbFormBase.Create(AOwner: TComponent);
begin
  inherited;
  dbControls:=TDBControls.Create;
  fDbProvide:=nil;
end;

procedure TDbFormBase.DBCntlOnEnterListener(Sender: TObject);
var tmpObj:TMaskEdit;
begin
   tmpObj:=sender as TMaskEdit;
   structbase.CntlDataInput.CntlInput.Parent:=tmpobj.Parent;
   structbase.CntlDataInput.CntlGrid.Parent:=self;
   structbase.CntlDataInput.setTargetCntrl(dbcontrols.find(tmpobj.name));
   structbase.CntlDataInput.myGetFocuse(sender);

end;

destructor TDbFormBase.Destroy;
begin
    dbControls.Free;
    structbase.CntlDataInput.CntlGrid.Parent:=nil;
    structbase.CntlDataInput.CntlInput.Parent:=nil;
    structbase.CntlDataInput.TargetDbCntrl:=nil;
    inherited;
end;

function TDbFormBase.mDbProvide: IDBProvideInterface;
begin
if fDbProvide=nil then
  with structbase.Applications.find(self.getAppId)do
       fDbProvide:=MetaSource.dbProvide;

  result:= fDbProvide;
end;

end.
