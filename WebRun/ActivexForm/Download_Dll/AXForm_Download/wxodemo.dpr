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
          ApplicationHandle : THandle;  //������
          IEHandle : THandle;           //IE���
          CtrlHandle : THandle;         //IE���ƾ��
          Url : PChar;                  //URL�ַ���
          Flag : PChar                  //��ز���,���Զ���
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
