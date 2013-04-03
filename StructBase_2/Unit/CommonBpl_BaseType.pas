unit CommonBpl_BaseType;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  Dbclient,
  Mask,Struct_DicBaseItem;

type
  TDbFormFieldBase = class(TObject)
  private
    FdicId: string;
    FfieldChinese: string;
    FfieldLen: string;
    FfieldName: string;
    FfieldPkFlag: string;
    FfieldType: string;
    FfilterType: string;
    FschemaName: string;
    FtableName: string;
  public
    property dicId: string read FdicId write FdicId;
    property fieldChinese: string read FfieldChinese write FfieldChinese;
    property fieldLen: string read FfieldLen write FfieldLen;
    property fieldName: string read FfieldName write FfieldName;
    property fieldPkFlag: string read FfieldPkFlag write FfieldPkFlag;
    property fieldType: string read FfieldType write FfieldType;
    property filterType: string read FfilterType write FfilterType;
    property schemaName: string read FschemaName write FschemaName;
    property tableName: string read FtableName write FtableName;
  end;


  { TDicInputBase }
  TCntrlMapItem = class(TObject)
  private
    FcntlName: string;
    FcntlObjct: TMaskEdit;
    FdicItem: TDicBaseItem;
    FdicValue: string;
    FfieldItem: TDbFormFieldBase;
  public
    property cntlName: string read FcntlName write FcntlName;
    property cntlObjct: TMaskEdit read FcntlObjct write FcntlObjct;
    property dicItem: TDicBaseItem read FdicItem write FdicItem;
    property dicValue: string read FdicValue write FdicValue;
    property fieldItem: TDbFormFieldBase read FfieldItem write FfieldItem;
  end;

  TDicInputBase = class(TObject)
  private
    FdicCDS: TClientDataset;
    FdicCurValue: string;
    FdicDisplayFormat: string;
    FdicFilterStr: string;
    FdicLevelFilterStr: string;
    FdicLevelStr: string;
    FdicStyle: string;
  public
    property dicCDS: TClientDataset read FdicCDS write FdicCDS;
    property dicCurValue: string read FdicCurValue write FdicCurValue;
    property dicFilterStr: string read FdicFilterStr write FdicFilterStr;
    property dicLevelFilterStr: string read FdicLevelFilterStr write
        FdicLevelFilterStr;
    property dicLevelStr: string read FdicLevelStr write FdicLevelStr;
    property dicLimitFormat: string read FdicDisplayFormat write
        FdicDisplayFormat;
    property dicStyle: string read FdicStyle write FdicStyle;
  end;


  TDbControl = class(TObject)
  private
    FappName: string;
    FcntlObjct: TMaskEdit;
    FdisplayValue: string;
    FrealValue: string;
    Ftablename: string;
    Ffieldname: string;
    FfiterString:string;
    ForiginalValue:String;
    FfilterLevelRootValue:String;
    FfieldMeta: TDbFormFieldBase;
    FdicMetaBase: TDicBaseItem;
    FdicDataInput:TObject;
    FallowDataInputProxy:Boolean;
    procedure setDicCodeValue(strCode:String);

  public
    property appName: string read FappName write FappName;
    property cntlObjct: TMaskEdit read FcntlObjct write FcntlObjct;
    property displayValue: string read FdisplayValue write FdisplayValue;
    property realValue: string read FrealValue write FrealValue;
    property tablename: string read Ftablename write Ftablename;
    property fieldname: string read Ffieldname write Ffieldname;
    property fiterString: string read FfiterString write FfiterString;
    property originalValue: string read ForiginalValue write ForiginalValue;
    property filterLevelRootValue: string read FfilterLevelRootValue write FfilterLevelRootValue;
    property fieldMetaBase: TDbFormFieldBase read FfieldMeta write FfieldMeta;
    property dicMetaBase: TDicBaseItem read FdicMetaBase write FdicMetaBase;
    property dataInputCntl: TObject read FdicDataInput write FdicDataInput;
    property allowDataInputProxy: Boolean read FallowDataInputProxy write FallowDataInputProxy;
    property dicCodeValue: String read FrealValue write setDicCodeValue;
    property dicCodeDisplayValue: String read FdisplayValue write FdisplayValue;
    procedure setLevelRootValue(strValue: String);
  end;
implementation



uses uDicFunction;

{ TDbControl }

procedure TDbControl.setDicCodeValue(strCode: String);
begin
  self.FrealValue:=strCode;
  self.FdisplayValue:=self.FdicMetaBase.translateDicValue(strCode);
  self.FcntlObjct.Text:=dicCodeDisplayValue;
end;

procedure TDbControl.setLevelRootValue( strValue:String);
{根据字典过滤模式符,通过初始值计算过滤字符串
  输入:  42050251000000     模式符: ******,**,**
  输出:  42050251******
}
begin
    if self.dicMetaBase.dicLevelMode<>'' then
    begin
        filterLevelRootValue:=GetCurLevelFilterStr(strvalue, dicMetaBase.dicLevelMode);
     end;
end;



end.
