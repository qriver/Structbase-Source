unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzTabs,DBClient,ImageViewYM;

type
  TMainForm = class(TForm)
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    RzPageControl2: TRzPageControl;
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    TabSheet4: TRzTabSheet;
    TabSheet5: TRzTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure RzPageControl2Change(Sender: TObject);
  private
    { Private declarations }
    APP_CDS:TCLientDataSet;
  public
    { Public declarations }
        dvym : TImageViewYM;//DragViewYM
       procedure  LoadApplication(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation
uses uStructbaseFrameWork;
{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
    APP_CDS:=TClientDataSet.Create(self);
    StructBase.DBProvids.find('MetaSource').SelectCommand(app_Cds,'select * from app_name',0);

    dvym := TImageViewYM.Create(Self);
    dvym.Align := alClient;
    dvym.ColCount := 8;
    dvym.CellWidth:= 55;
    dvym.CellHeight:= 55;
    dvym.CRDistance := 20;


    RzPageControl2Change(self);
end;



procedure TMainForm.RzPageControl2Change(Sender: TObject);
var rzidx:String;
begin
     dvym.ClearItem;
     rzIdx:=inttostr(rzPageControl2.ActivePageIndex);
     dvym.Parent:= rzPageControl2.ActivePage;
     APP_CDS.First;
     while not APP_CDS.Eof  do
     begin
         if app_cds.FieldByName('App_GroupId').AsString=rzIdx   then
         begin
            with app_cds  do
               dvym.AddItem( FieldByName('App_DisplayLabel').AsString, FieldByName('App_ImageId').AsString  );
         end;
         APP_CDS.Next;
     end ;

     dvym.BuildComponents;
     dvym.OnItemClick:=self.LoadApplication;
 //    dvym.loadBackPic(sysutils.getCurrentDir+ '\1.jpg');
end;

end.
