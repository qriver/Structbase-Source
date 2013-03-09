unit uMyException;

interface

uses sysutils;

Const
    XML文件不存在 = 10001;

Type
  TCustomException = class(Exception)
  private
    fExceptionCode: integer;
  public
    constructor Create(const Msg: string; eCode: integer);
    property   ECode: Integer read fExceptionCode write fExceptionCode; //错误代码
    procedure showMsg;    overload;
    Class procedure showMsg(msg:String);    overload;
  end;

implementation

uses Dialogs;
{ TCustomException }

constructor TCustomException.Create(const Msg: string; eCode: integer);
begin
  self.Message := Msg;
  fExceptionCode := eCode;
end;

procedure TCustomException.showMsg;
begin
  showmessage(Message);
end;

class procedure TCustomException.showMsg(msg: String);
begin
    showmessage(msg);
end;

end.
