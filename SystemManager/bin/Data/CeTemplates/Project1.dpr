program <#PrgName>;

uses
  Forms,
  <#UnitName> in '<#UnitName>.pas' {<#FormName>};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(<#TFormName>, <#FormName>);
  Application.Run;
end.
