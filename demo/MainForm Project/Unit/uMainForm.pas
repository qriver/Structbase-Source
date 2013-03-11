unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzTabs;

Const const_AppName='SYSTEM';
type
  TMainForm = class(TForm)
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    RzPageControl2: TRzPageControl;
    RzTabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    TabSheet4: TRzTabSheet;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses      uStructbaseFrameWork;
{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
   StructBase.LoadAppInstance(const_AppName);
end;

end.
