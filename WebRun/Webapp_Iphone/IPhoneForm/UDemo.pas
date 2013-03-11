unit UDemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Spin, ImageViewYM;
//download by http://www.codefans.net
type
  TfrmDemo = class(TForm)
    Panel2: TPanel;
    seN: TSpinEdit;
    seH: TSpinEdit;
    seX: TSpinEdit;
    seY: TSpinEdit;
    seD: TSpinEdit;
    CheckBox1: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox2: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    CheckBox3: TCheckBox;
    bbtAdd: TBitBtn;
    bbtExit: TBitBtn;
    bbtClear: TBitBtn;
    CheckBox4: TCheckBox;
    BitBtn3: TBitBtn;
    CheckBox5: TCheckBox;
    SpinEdit1: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtAddClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bbtExitClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);

    procedure myClick(Sender: TObject);
    procedure bbtClearClick(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);

  private
    { Private declarations }
     procedure test(Sender: TObject);
  public
    { Public declarations }
    dvym : TImageViewYM;//DragViewYM

    procedure WMLButtonUp(var msg:TWMLButtonUp); message WM_LButtonUp;

  end;

var
  frmDemo: TfrmDemo;

implementation

{$R *.dfm}

procedure TfrmDemo.FormCreate(Sender: TObject);
begin
  //320*480,640*480
  dvym := TImageViewYM.Create(Self);
  dvym.Parent := Self;
  dvym.Align := alClient;
//  dvym.BuildComponents;
//  dvym.subClick := myClick;
  dvym.OnItemClick := myClick;
  //}
  
end;

procedure TfrmDemo.FormDestroy(Sender: TObject);
begin
  dvym.Free;
//  dig.Free;
end;

procedure TfrmDemo.bbtAddClick(Sender: TObject);
var
  i : Integer;
  ss : string;
begin
//  dvym.MoveAction := CheckBox1.Checked;
   bbtClear.Click;
  
  dvym.ColCount := seH.Value;
  dvym.CellWidth:= seX.Value;
  dvym.CellHeight:= seY.Value;
  dvym.CRDistance := seD.Value;
  //}
  dvym.BigWH := SpinEdit1.Value;

  dvym.ClearComponents;
  dvym.ClearItem();
  for i := 0 to seN.Value-1 do
  begin
    ss := IntToStr( Random(99)+1 );
    if Length(ss)<2 then
    begin
      ss := '0'+ss;
    end;
    ss := '.\png\img'+ ss +'.png';
//    ss := '.\img\img'+ ss +'.bmp';
    {
    if i=10 then
    begin
      ss := '';
    end;
    //}
    dvym.AddItem( '图标 '+inttostr(dvym.ItemCout),ss );
    
  end;
  dvym.ColCount := seH.Value;
  dvym.BuildComponents;
  
end;

procedure TfrmDemo.BitBtn1Click(Sender: TObject);
var
  ss : string;
begin
  ss := IntToStr( Random(99)+1 );
  if Length(ss)<2 then
  begin
    ss := '0'+ss;
  end;
  ss := '.\png\img'+ ss +'.png';

  dvym.AddItem( '图 标',ss );
//  dvym.HCTS := False;
  dvym.BuildComponents;
//  dvym.HCTS := True;
  dvym.OnItemClick:=test;
end;

procedure TfrmDemo.BitBtn2Click(Sender: TObject);
begin
  dvym.DeleteItem( dvym.ItemCout-1 );

//  dvym.HCTS := False;
  dvym.BuildComponents;
//  dvym.HCTS := True;

end;

procedure TfrmDemo.bbtExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDemo.CheckBox1Click(Sender: TObject);
begin
  dvym.MoveAction := CheckBox1.Checked;
end;

procedure TfrmDemo.CheckBox2Click(Sender: TObject);
begin

  if CheckBox2.Checked then
  begin
    dvym.DragModel := 1;
  end
  else
  begin
    dvym.DragModel := 0;
  end;
  
end;

procedure TfrmDemo.myClick(Sender: TObject);
begin
  //图标点击索引事件
  Self.Caption := dvym.ItemCaption +' | ' + IntToStr(dvym.ItemIndex);
end;

procedure TfrmDemo.test(Sender: TObject);
begin
 showmessage('asdfadsf');
end;

procedure TfrmDemo.WMLButtonUp(var msg : TWMLButtonUp);
begin
  //
  Self.Caption := 'WMLButtonUp';
  seD.Value := 1;

end;

procedure TfrmDemo.bbtClearClick(Sender: TObject);
begin
  dvym.ClearComponents;
  dvym.ClearItem();
end;

procedure TfrmDemo.CheckBox3Click(Sender: TObject);
begin
  Panel2.Visible := CheckBox3.Checked;
  Panel2.BringToFront;
end;

procedure TfrmDemo.CheckBox4Click(Sender: TObject);
begin
  dvym.DoubleBuf := CheckBox4.Checked;
end;

procedure TfrmDemo.BitBtn3Click(Sender: TObject);
begin
  dvym.loadBackPic('.\Wallpaper2.png');
end;

procedure TfrmDemo.CheckBox5Click(Sender: TObject);
begin
  dvym.ShowCaption := CheckBox5.Checked;
end;

end.
