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
  //当前模块加载后执行，不要在这里取接口...
end;

destructor TRegModule.Destroy;
begin
  //当前模块卸载前执行，不要在这里取接口...
  inherited;
end;

procedure TRegModule.Init;
begin
  //初始化，所有模块加载完成后会执行到这里，在这取接口是安全的...
  inherited;
end;

procedure TRegModule.final;
begin
  //终始化，卸载模块前会执行到这里，这里取接口是安全的...
  inherited;
end;

procedure TRegModule.Notify(Flags: Integer; Intf: IInterface);
begin
  if Flags=NotifyFlag then
  begin
    (Intf as IClsRegister).RegCls('系统管理工具',TMainForm);
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
