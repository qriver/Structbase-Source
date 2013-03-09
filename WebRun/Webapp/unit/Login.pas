unit Login;

interface

uses
     //

     //
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, jpeg, ExtCtrls,  StdCtrls,  DB, ADODB;

type
  TForm_Login = class(TForm)
    Panel_Frame: TPanel;
    ADOQuery: TADOQuery;
    ComboBox_Users: TComboBox;
    Edit_Password: TEdit;
    Image_OK: TImage;
    Image_Cancel: TImage;
    btnLogin: TButton;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure Image_OKClick(Sender: TObject);
    procedure Image_CancelClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
     UserID    : Integer;     //用于返回用户的ID
    { Public declarations }
  end;

var
     Form_Login: TForm_Login;

implementation

{$R *.dfm}

procedure TForm_Login.btnLoginClick(Sender: TObject);
begin
   self.Tag:=1;
    Edit_Password.SetFocus;
end;

procedure TForm_Login.FormShow(Sender: TObject);
var
     iLeft     : Integer;
     iTop      : Integer;
begin
     //<调整位置以适应各分辨率
     iLeft     := Panel_Frame.Left;
     iTop      := Panel_Frame.Top;
     //
     Panel_Frame.Left    := (Screen.Width-Panel_Frame.Width) div 2;
     Panel_Frame.Top     := (Screen.Height-Panel_Frame.Height) div 2;
     //>


     //
     Edit_Password.SetFocus;
     
end;

procedure TForm_Login.Image_OKClick(Sender: TObject);
var
     sPsd      : String;
begin
     //取得系统保存的密码
       Edit_Password.SetFocus;
end;

procedure TForm_Login.Image1Click(Sender: TObject);
begin
     Edit_Password.SetFocus;
end;

procedure TForm_Login.Image_CancelClick(Sender: TObject);
begin
     Form_Login.Tag := 0;
     Close;
end;

end.
