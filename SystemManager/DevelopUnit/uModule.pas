unit uModule;

interface

uses SysUtils,Classes,uTangramModule,SysModule,RegIntf;

Type
  TRegModule=Class(TModule)
  private 
  public 
    Constructor Create; override;
    Destructor Destroy; override;

    procedure Init; override;
    procedure final; override;
    procedure Notify(Flags: Integer; Intf: IInterface); override;

    class procedure RegisterModule(Reg:IRegistry);override;
    class procedure UnRegisterModule(Reg:IRegistry);override;
  End;

implementation

uses SysSvc,notifyIntf,uMainForm;

const
  InstallKey='SYSTEM\LOADMODULE\USER';

{ TRegModule }

constructor TRegModule.Create;
begin 
  inherited;
  //��ǰģ����غ�ִ�У���Ҫ������ȡ�ӿ�...
end;

destructor TRegModule.Destroy;
begin
  //��ǰģ��ж��ǰִ�У���Ҫ������ȡ�ӿ�...
  inherited;
end;

procedure TRegModule.Init;
begin
  //��ʼ��������ģ�������ɺ��ִ�е��������ȡ�ӿ��ǰ�ȫ��...
  inherited;
end;

procedure TRegModule.final;
begin
  //��ʼ����ж��ģ��ǰ��ִ�е��������ȡ�ӿ��ǰ�ȫ��...
  inherited;
end;

procedure TRegModule.Notify(Flags: Integer; Intf: IInterface);
begin
  if Flags=NotifyFlag then
  begin
    (Intf as IClsRegister).RegCls('ϵͳ������',TMainForm);
  end;
end;

class procedure TRegModule.RegisterModule(Reg: IRegistry);
begin
  DefaultRegisterModule(Reg,InstallKey);
end;

class procedure TRegModule.UnRegisterModule(Reg: IRegistry);
begin
  DefaultunRegisterModule(Reg,installKey);
end;

initialization
  RegisterModuleClass(TRegModule);
finalization

end.
