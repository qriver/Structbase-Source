unit uChildMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, RzGroupBar;

type
  TChildMainForm = class(TForm)
    Panel1: TPanel;
    RzGroupBar1: TRzGroupBar;
    procedure ove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    procedure RzGroupBar1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChildMainForm: TChildMainForm;

implementation

{$R *.dfm}

procedure TChildMainForm.ove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  Index, i: Integer;
begin
  Index := TRzGroup(Sender).ItemAtPos(Point(X, Y));
  if Index >= 0 then
  begin
    TRzGroup(Sender).Items[Index].FontStyle := TRzGroup(Sender)
      .Items[Index].FontStyle + [fsUnderLine];
    TRzGroup(Sender).Items[Index].FontColor := clRed;
  end
  else
  begin
    for i := 0 to TRzGroup(Sender).Items.Count - 1 do
    begin
      TRzGroup(Sender).Items[i].FontStyle := TRzGroup(Sender)
        .Items[i].FontStyle - [fsUnderLine];
      TRzGroup(Sender).Items[i].FontColor := clBlack;
    end;
  end;
end;

procedure TChildMainForm.RzGroupBar1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  Index, i: Integer;
begin
  Index := TRzGroup(Sender).ItemAtPos(Point(X, Y));
  if Index >= 0 then
  begin
    TRzGroup(Sender).Items[Index].FontStyle := TRzGroup(Sender)
      .Items[Index].FontStyle + [fsUnderLine];
    TRzGroup(Sender).Items[Index].FontColor := clRed;
  end
  else
  begin
    for i := 0 to TRzGroup(Sender).Items.Count - 1 do
    begin
      TRzGroup(Sender).Items[i].FontStyle := TRzGroup(Sender)
        .Items[i].FontStyle - [fsUnderLine];
      TRzGroup(Sender).Items[i].FontColor := clBlack;
    end;
  end;
end;

end.
