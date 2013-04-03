library SampleDll;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  forms,
  WxoUnit in 'unit\WxoUnit.pas',
  uChildMainForm in 'unit\uChildMainForm.pas' {ChildMainForm};

{$R *.res}

var Form_Child:TChildMainForm;


function LoadWebXoneForm(
          ApplicationHandle : THandle;  //程序句柄
          IEHandle : THandle;           //IE句柄
          CtrlHandle : THandle;         //IE控制句柄
          Url : PChar;                  //URL字符串
          Flag : PChar                  //相关参数,可自定义
          ):THandle;cdecl;

begin
     try
          giCtrl    := CtrlHandle;
          giApp     := ApplicationHandle;
          giIE      := IEHandle;
          giUrl     := pansichar(Url);
          Form_Child  := TChildMainForm.Create(nil);
          wxoShowForm(Form_Child);
     finally
     end;
     Result    := Form_Child.Handle;
end;


exports
     LoadWebXoneForm;
end.
