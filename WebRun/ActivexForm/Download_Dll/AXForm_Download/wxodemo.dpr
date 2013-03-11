Library wxodemo;


uses
  ShareMem,
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  WxoUnit in 'WxoUnit.pas',
  Main in 'Main.pas' {Form_Wxo};

{$E .wxo}

function LoadWebXoneForm(
          ApplicationHandle : THandle;  //程序句柄
          IEHandle : THandle;           //IE句柄
          CtrlHandle : THandle;         //IE控制句柄
          Url : PChar;                  //URL字符串
          Flag : PChar                  //相关参数,可自定义
          ):THandle;cdecl;

begin
     try
          //
          Form_Wxo  := TForm_WXO.Create(nil);
          giCtrl    := CtrlHandle;
          giApp     := ApplicationHandle;
          giIE      := IEHandle;
          wxoShowForm(Form_Wxo);
     finally
     end;
     Result    := Form_Wxo.Handle;
end;


exports
     LoadWebXoneForm;

end.
