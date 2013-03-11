unit uMessageWizard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TWizardForm = class(TForm)
    Label1: TLabel;
    Icon: TImage;
    BottomPanel: TPanel;
    YesBtn: TButton;
    LaterBtn: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure YesBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  WizardForm: TWizardForm;

implementation

{$R *.dfm}

procedure TWizardForm.Button1Click(Sender: TObject);
begin
   self.Hide;

end;

procedure TWizardForm.FormCreate(Sender: TObject);
begin
  self.Left:=(screen.Width-self.Width) div 2;
  self.Top:=(screen.Height-self.Height) div 2;

end;

procedure TWizardForm.YesBtnClick(Sender: TObject);
begin
  self.Hide;
end;

end.
