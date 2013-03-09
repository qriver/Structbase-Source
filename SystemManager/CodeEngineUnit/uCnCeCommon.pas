{******************************************************************************}
{                       CnPack For Delphi/C++Builder                           }
{                     中国人自己的开放源码第三方开发包                         }
{                   (C)Copyright 2001-2007 CnPack 开发组                       }
{                   ------------------------------------                       }
{                                                                              }
{            本开发包是开源的自由软件，您可以遵照 CnPack 的发布协议来修        }
{        改和重新发布这一程序。                                                }
{                                                                              }
{            发布这一开发包的目的是希望它有用，但没有任何担保。甚至没有        }
{        适合特定目的而隐含的担保。更详细的情况请参阅 CnPack 发布协议。        }
{                                                                              }
{            您应该已经和开发包一起收到一份 CnPack 发布协议的副本。如果        }
{        还没有，可访问我们的网站：                                            }
{                                                                              }
{            网站地址：http://www.cnpack.org                                   }
{            电子邮件：master@cnpack.org                                       }
{                                                                              }
{******************************************************************************}

unit uCnCeCommon;
{* |<PRE>
================================================================================
* 软件名称：开发包基础库
* 单元名称：Delphi 代码引擎基础库单元
* 单元作者：SkyJacker
* 备    注：该单元定义了代码引擎的常量、变量、公共函数
* 开发平台：WinXP sp2  + Delphi 6.0 up2
* 兼容测试：无
* 本 地 化：该单元中的字符串均符合本地化处理方式
* 单元标识：$Id: uCnCeCommon.pas,v 1.0 2007/03/06 14:36:27 SkyJacker Exp $
* 修改记录：2007.03.14
*               创建单元，实现功能
================================================================================
|</PRE>}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils;

type
  TStringArray = array of string;  

const

//------------------------------------------------------------------------------
// 程序相关常量
//------------------------------------------------------------------------------

  cnDBLinkUdl = 'data\DbLink.udl'; // 数据库设置
  cnTemplatePath ='data\CETemplates\';
  cnTemplateDpr = cnTemplatePath + 'Project1.dpr';
  cnTemplatePas = cnTemplatePath + 'Unit1.pas';
  cnTemplateDfm = cnTemplatePath + 'Unit1.dfm';

  cnTempPath: string = 'data\temp\';
  cnCESetIni: string = 'data\ceset.ini';
  CRLF = #13#10;
  NL = '';

//------------------------------------------------------------------------------
// 模板相关常量
// 注: 此标记也可以用于生成模板, 当前采用手工修改模板
//------------------------------------------------------------------------------

  // 基本信息
  cnPrgName = '<#PrgName>';         // 工程标识
  cnUnitName = '<#UnitName>';       // 单元标识
  cnFormClass = '<#TFormName>';     // 窗体类标识
  cnFormName = '<#FormName>';       // 窗体名标识
  cnFormCaption = '<#FormCaption>'; // 窗体名称标识

  // 用户新增信息存放区域
  cnAddUseGlobal = '<#AddUseGlobal>';      // 新增全局 uses 区单元
  cnAddUseLocal = '<#AddUseLocal>';        // 新增本地 uses 区单元
  cnAddControl  = '<#AddControl>';         // 新增控件
  cnAddControlDfm = '<#AddControlDfm>';    // 新政控件对应的 dfm
  cnAddPrivateData  = '<#AddPrivateData>'; // 新增私有变量区域
  cnAddPrivateFunc  = '<#AddPrivateFunc>'; // 新增私有过程或函数区域
  cnAddPublicData   = '<#AddPublicData>';  // 新增公共变量区域
  cnAddPublicFunc   = '<#AddPublicFunc>';  // 新增公共过程或函数区域

  // 新增全局函数或窗体类本身函数存放区域
  cnAddGlobalFunc = '<#AddGlobalFunc>';     // 本单元独立的函数
  cnAddFormFunc = '<#AddFormFunc>';         // 本窗体类的函数
  cnAddFormFuncHead = '<#AddFormFuncHead>'; // 本窗体类的函数头声明

  //全江新增
  cnTableName = '<#TableName>'; // 需要操作的数据表名
  cnPkFieldName = '<#PkFieldName>'; // 需要操作的数据表名

  // 解析、格式相关
  SDELI = '?'; // 字符串解析分隔符(注：如果参数中含有 ? 会导致解析错误)
  SP1 = ' ';   // 定义 1 ~ 8 个空格
  SP2 = SP1 + SP1;
  SP4 = SP2 + SP2;
  SP6 = SP4 + SP2;
  SP8 = SP6 + SP2;

  // 数据类型 Sql 语句格式化
  cnFmtStr = ' ''''%s''''';
  cnFmtInt = ' %d';
  cnFmtFlt = ' %f';

  // 常用文件扩展名
  ExtDpr = '.dpr';
  ExtPas = '.pas';
  ExtDfm = '.dfm';
  UnSaveFlag = ' *';

var

//------------------------------------------------------------------------------
// 程序相关变量
//------------------------------------------------------------------------------

  BtnText: array[0..2] of string= ('确定','取消','重置');
  AppTitle: string = 'CnPack Delphi 代码引擎 V1.0';
  AppPath: string;
  TemplatePath: string;
  FileSavePath: string;
  bMySql: Boolean;
  lstTableName: TStrings;
  SqlInteger, SqlFloat, SqlString: TStringArray;

//------------------------------------------------------------------------------
// 模板相关变量
//------------------------------------------------------------------------------

  PrgName: string = 'Project1';
  MyUnitName: string = 'Unit1';
  FormClass: string = 'TForm1';
  FormName: string = 'Form1';
  FormCaption: string = 'Form1';

  TableName: String ='MyTableName';
  PK_FieldName:String ='PK_FieldName';


  // 用户新增信息存放区域
  AddUseGlobal: string;       // 新增全局 uses 区单元
  AddUseLocal: string;        // 新增本地 uses 区单元
  AddControl: TStrings;       // 新增控件
  AddCdsControl: TStrings;    // 新增TClientDataset控件
  AddCdsFieldControl: TStrings;    // 新增TClientDataset控件
  AddControlDfm: TStrings;    // 新政控件对应的 dfm
  AddPrivateData: TStrings;   // 新增私有变量区域
  AddPrivateFunc: TStrings;   // 新增私有过程或函数区域
  AddPublicData: TStrings;    // 新增公共变量区域
  AddPublicFunc: TStrings;    // 新增公共过程或函数区域

  // 新增全局函数或窗体类本身函数存放区域
  AddGlobalFunc: TStrings;    // 本单元独立的函数
  AddFormFunc: TStrings;      // 本窗体类的函数
  AddFormFuncHead: TStrings;  // 本窗体类的函数头声明

//------------------------------------------------------------------------------
// 辅助函数
//------------------------------------------------------------------------------

procedure EnterPress(AFrm: TForm; var Key: Char);
{* 回车模拟 Tab}

function StrToDfmFmt(const AStr: string): string;
{* 将中或英字符串转换为 Delphi Dfm 的格式}

function iGetDelimiterIndex(const AStr: string; n: integer): integer;
{* 返回字符串中第 n 个分割符的位置}

function GetDelimiterStr(const AStr: string; m: integer; n: integer): string;
{* 返回字符串中第 m 个分割符与第 n 个分割符之间的字符(m<n)}

function GetDelimiterCount(const AStr, ADeli:string):integer;
{* 返回分割符总数}

function IsExistStr(const AStr: string;var AStrList: TStringArray): Boolean;
{* 字符串列表中是否存在某一字符串}

//------------------------------------------------------------------------------
// 代码引擎相关函数
//------------------------------------------------------------------------------

procedure CEGenTLabel(ANo, ALeft, ATop: Integer; const ACaption: string);
{* 生成一个 TLabel}

procedure CEGenTEdit(ALeft, ATop: Integer; const AEdtName: string);
{* 生成一个 TEdit}

procedure CEGenTClientDataSet (const ATableName,AColumnName,AChineseName,AType,ASize: string);
{* 生成一个 TClientDataSet}

procedure CEGenTButton(ALeft, ATop: Integer; const AName, ACaption: string);
{* 生成一个 TButton}

procedure CEGenTADOConnection(ALeft, ATop: Integer; const AName: string);
{* 生成一个 TADOConnection}

procedure CEGenTADOQuery(ALeft, ATop: Integer; const AName, AAdoCon: string);
{* 生成一个 TADOQuery}

procedure CEGenShowTableRec(const AFormName, ATableName, AConQry: string; var ColumnsTypes: string);
{* 生成查询数据表记录代码, 并创建相关控件}

procedure CEGenDelTableRec(const AFormName, ATableName, AColumnName, AConQry, AAdoCon: string);
{* 生成删除数据表记录代码}

procedure CEGenInsertTableRec(const AFormName, ATableName, AConQry, AAdoCon: string; var ColumnsTypes: string);
{* 生成添加数据表记录代码}

procedure CEGenUpdateTableRec(const AFormName, ATableName, AColumnName, AConQry, AAdoCon: string; var ColumnsTypes: string);
{* 生成更新数据表记录代码}

implementation

//------------------------------------------------------------------------------
// 辅助函数
//------------------------------------------------------------------------------

// 回车模拟 Tab
procedure EnterPress(AFrm: TForm; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    AFrm.Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

// 将中或英字符串转换为 Delphi 的 Dfm 格式
function StrToDfmFmt(const AStr: string): string;
const
  QM = '''';
var
  W: WideString;
  I: Integer;
  bEn: Boolean;
  Len: Integer;
begin
  bEn := False;
  W := AStr;
  Len := Length(W);
  for I:=1 to Len do
  begin
    if Ord(W[i])>127 then // 如果为非普通 ascii，就认为是宽字符
    begin
      if bEn then
        Result := Result + QM;

      Result := Result + '#' + IntToStr(Ord(W[I]));
      bEn := false;
    end
    else
    begin
      if not bEn then
        Result := Result + QM + W[i]
      else
        Result := Result + W[i];

      if I = Len then
        Result := Result + QM;
      bEn := true;
    end;
  end;
end;

// 返回字符串中第 n 个分割符的位置
function iGetDelimiterIndex(const AStr: string; n: integer): integer;
var
  Count, I: integer;
begin
  Result := 0;
  Count := 0;
  for I := 1 to length(AStr) do
  begin
    if AStr[I] = SDELI then
    begin
      Count := Count + 1;
      if (n = Count) then
      begin
        Result := i;
      end;
    end;
  end;
end;

// 返回字符串中第 m 个分割符与第 n 个分割符之间的字符(m<n)
function GetDelimiterStr(const AStr: string; m: integer; n: integer): string;
var
  iFirstDeli, iSecondDeli: integer;
begin
  if m >= n then
    Exit;
  iFirstDeli := iGetDelimiterIndex(AStr, m);
  iSecondDeli := iGetDelimiterIndex(AStr, n);
  result := copy(AStr, iFirstDeli + 1, iSecondDeli - iFirstDeli - 1);
end;

// 返回分割符总数
function GetDelimiterCount(const AStr, ADeli:string):integer;
var
  I: integer;
begin
  Result := 0;
  for I := Length(AStr) downto 1 do
  begin
    if ADeli = AStr[I] then
    begin
      Inc(Result);
    end;
  end;
end;

// 使用 string case
function StringToCaseSelect(Selector : string; CaseList: array of string): Integer;
var
  cnt: integer;
begin
   Result := -1;
   for cnt := 0 to Length(CaseList)-1 do
   begin
     if CompareText( Selector, CaseList[cnt]) = 0 then
     begin
       Result := cnt;
       Break;
     end;
   end;
end;

// 字符串列表中是否存在某一字符串
function IsExistStr(const AStr: string; var AStrList: TStringArray): Boolean;
var
  cnt: Integer;
begin
  Result := false;
  for cnt := Low(AStrList) to High(AStrList) do
  begin
    if CompareText(AStr, AStrList[cnt]) = 0 then
    begin
      Result := true;
      Break;
    end;
  end;
end;

// 数据库字段类型是否可以转为 Delphi 的整数
function IsInteger(const AStr: string): Boolean;
begin
  Result := IsExistStr(AStr, SqlInteger);
end;

// 数据库字段类型是否可以转为 Delphi 的浮点数
function IsFloat(const AStr: string): Boolean;
begin
  Result := IsExistStr(AStr, SqlFloat);
end;

// 数据库字段类型是否可以转为 Delphi 的字符串
function IsString(const AStr: string): Boolean;
begin
  Result := IsExistStr(AStr, SqlString);
end;

// 间接实现 case string
function ParseSqlDataType(const ADataType: string): Integer;
begin
  Result := 0;
  if IsInteger(ADataType) then
    Result := 1
  else if IsFloat(ADataType) then
    Result := 2
  else if IsString(ADataType) then
    Result := 3;
end;

//------------------------------------------------------------------------------
// 代码引擎相关函数
//------------------------------------------------------------------------------

// 生成一个 TLabel
procedure CEGenTLabel(ANo, ALeft, ATop: Integer; const ACaption: string);
const
  CeTLabel = SP4 + 'lbl%d: TStaticText;';
  CeTLabelDfm =
      '  object lbl%d: TStaticText' + SDELI
    + '    Left = %d ' + SDELI
    + '    Top = %d ' + SDELI
    + '    Width = 120 ' + SDELI
    + '    AutoSize = False ' + SDELI
    + '    BorderStyle = sbsSingle ' + SDELI
    + '    Color = clBtnFace ' + SDELI
    + '    Alignment = taCenter ' + SDELI
    + '    Height = 25 ' + SDELI
    + '    Caption = %s ' + SDELI
    + '  end ' + SDELI;
var
  sCeTLabel: string;
  sCeTLabelDfm: string;
  Count: Integer;
  I: Integer;
begin
  sCeTLabel := Format(CeTLabel, [ANo]);
  AddControl.Add(sCeTLabel);

  sCeTLabelDfm := Format(CeTLabelDfm, [ANo, ALeft, ATop, StrToDfmFmt(ACaption)]);
  Count := GetDelimiterCount(sCeTLabelDfm, SDELI);
  for I := 1 to Count do
  begin
    AddControlDfm.Add(GetDelimiterStr(sCeTLabelDfm, I-1, I));
  end;
end;

// 生成一个 TEdit
procedure CEGenTEdit(ALeft, ATop: Integer; const AEdtName: string);
const
  CeTEdit = SP4 + 'edt%s: TMaskEdit;';
  CeTEditDfm =
      '  object edt%s: TMaskEdit' + SDELI
    + '    Left = %d ' + SDELI
    + '    Top = %d ' + SDELI
    + '    AutoSize = False ' + SDELI
    + '    Width = 121 ' + SDELI
    + '    Height = 25 ' + SDELI
    + '    Ctl3D = false ' + SDELI
    + '    BorderStyle = bsSingle ' + SDELI
    + '    Text = ''edt%s'' ' + SDELI
    + '  end ' + SDELI;
var
  sCeTEdit: string;
  sCeTEditDfm: string;
  Count: Integer;
  I: Integer;
begin
  sCeTEdit := Format(CeTEdit, [AEdtName]);
  AddControl.Add(sCeTEdit);

  sCeTEditDfm := Format(CeTEditDfm, [AEdtName, ALeft, ATop, AEdtName]);
  Count := GetDelimiterCount(sCeTEditDfm, SDELI);
  for I := 1 to Count do
  begin
    AddControlDfm.Add(GetDelimiterStr(sCeTEditDfm, I-1, I));
  end;
end;

// 生成一个 TClientdataset
procedure CEGenTClientDataSet( const ATableName,AColumnName,AChineseName,AType,ASize: string);
const
  CeTEdit = SP4 + 'object cds_table: TClientDataSet ' + SDELI
                +' Aggregates = <> ' + SDELI
                +' Params = <> ' + SDELI
                +' Left = 144 ' + SDELI
                +' Top = 256 ' + SDELI ;
  CeTEditDfm =
      '   object %s%s: %s' + SDELI
    + '       DisplayLabel = %s ' + SDELI
    + '       DisplayWidth = 20 ' + SDELI
    + '       FieldName = ''%s'' ' + SDELI
    + '       Size = %s ' + SDELI
    + '   end '  + SDELI;
var
  sCeTEdit: string;
  sCeTEditDfm: string;
  sType:String;
  Count: Integer;
  I: Integer;
begin
   //TWideStringField字符型
   if AddCdsControl.Count=0 then
   begin
    //  sCeTEdit:=format(CeTedit,[aTableName]  );
      Count := GetDelimiterCount(sCeTEdit, SDELI);
      for I := 1 to Count do
      begin
         AddCdsControl.Add(GetDelimiterStr(sCeTEdit, I-1, I));
      end;
   end;

  // if upperCase(aType)='C' then sType:='TWideStringField';
   sType:='TWideStringField';
   sCeTEditDfm:=format(CeTEditDfm,[aTableName,aColumnName,sType,StrToDfmFmt(AChineseName),AColumnName,aSize]);
   Count := GetDelimiterCount(sCeTEditDfm, SDELI);
   for I := 1 to Count do
    begin
         AddCdsControl.Add(GetDelimiterStr(sCeTEditDfm, I-1, I));
   end;

   AddCdsFieldControl.Add(aTableName+aColumnName+':TWideStringField; ' );


end;


// 生成一个 TButton
procedure CEGenTButton(ALeft, ATop: Integer; const AName, ACaption: string);
const
  CeTx = SP4 + 'btn%s: TButton;';
  CeTxDfm =
      '  object btn%s: TButton' + SDELI
    + '    Left = %d ' + SDELI
    + '    Top = %d ' + SDELI
    + '    Width = 75 ' + SDELI
    + '    Height = 25 ' + SDELI
    + '    Caption = %s ' + SDELI
    + '  end ' + SDELI;
var
  sCeTx: string;
  sCeTxDfm: string;
  Count: Integer;
  I: Integer;
begin
  sCeTx := Format(CeTx, [AName]);
  AddControl.Add(sCeTx);

  sCeTxDfm := Format(CeTxDfm, [AName, ALeft, ATop, StrToDfmFmt(ACaption)]);
  Count := GetDelimiterCount(sCeTxDfm, SDELI);
  for I := 1 to Count do
  begin
    AddControlDfm.Add(GetDelimiterStr(sCeTxDfm, I-1, I));
  end;
end;

// 生成一个 TADOConnection
procedure CEGenTADOConnection(ALeft, ATop: Integer; const AName: string);
const
  CeTx = SP4 + 'con%s: TADOConnection;';
  CeTxDfm =
      '  object con%s: TADOConnection' + SDELI
    + '    Left = %d ' + SDELI
    + '    Top = %d ' + SDELI
    + '  end ' + SDELI;
var
  sCeTx: string;
  sCeTxDfm: string;
  Count: Integer;
  I: Integer;
begin
  sCeTx := Format(CeTx, [AName]);
  AddControl.Add(sCeTx);

  sCeTxDfm := Format(CeTxDfm, [AName, ALeft, ATop]);
  Count := GetDelimiterCount(sCeTxDfm, SDELI);
  for I := 1 to Count do
  begin
    AddControlDfm.Add(GetDelimiterStr(sCeTxDfm, I-1, I));
  end;
end;

// 生成一个 TADOQuery
procedure CEGenTADOQuery(ALeft, ATop: Integer; const AName, AAdoCon: string);
const
  CeTx = SP4 + 'qry%s: TADOQuery;';
  CeTxDfm =
      '  object qry%s: TADOQuery' + SDELI
    + '    Connection = %s' + SDELI
    + '    Parameters = <> ' + SDELI
    + '    Left = %d ' + SDELI
    + '    Top = %d ' + SDELI
    + '  end ' + SDELI;
var
  sCeTx: string;
  sCeTxDfm: string;
  Count: Integer;
  I: Integer;
begin
  sCeTx := Format(CeTx, [AName]);
  AddControl.Add(sCeTx);

  sCeTxDfm := Format(CeTxDfm, [AName,AAdoCon, ALeft, ATop]);
  AddControlDfm.Add('');
  Count := GetDelimiterCount(sCeTxDfm, SDELI);
  for I := 1 to Count do
  begin
    AddControlDfm.Add(GetDelimiterStr(sCeTxDfm, I-1, I));
  end;
end;

// 生成查询数据表代码, 并创建相关控件
// 同时生成注释: 注释内容为字段的类型
procedure CEGenShowTableRec(const AFormName, ATableName, AConQry: string; var ColumnsTypes: string);
const
  CeShowTableHead = 'procedure %sShow%s(const SID: string);';
  CeShowTable =
'const' + SDELI +
'  cnSql_Show%s = ''select top 1 * from %s where %s = %s; ''; ' + SDELI +// 以最后一个字段为条件
'var' + SDELI +
'  ExeSql: string; ' + SDELI +
'begin' + SDELI +
'  ExeSql := Format(cnSql_Show%s, [SID]);' + SDELI +
'  with %s do' + SDELI +
'  begin' + SDELI +
'    close;' + SDELI +
'    sql.clear;' + SDELI +
'    sql.add(ExeSql);' + SDELI +
'    Open;' + SDELI +
'    if RecordCount=1 then' + SDELI +
'    begin' + SDELI +
'%s' + //SDELI +
'    end;' + SDELI +
'  end;' + SDELI +
'end;' + SDELI ;

  // edt%s.Text :=  FieldByName(''%s'').AsString;
  CeEdit = 'edt%s';
  CeEditField =  SP6 + '%s.Text :=  FieldByName(''%s'').AsString; // %s' + SDELI;
var
  sCeShowTableHeadPriv: string;
  sCeShowTableHeadForm: string;
  sCeShowTable: string;
  sColumnName: string;
  sColumnChineseName:String;
  sTableName:String;
  sColumnSIze:String;
  sTypeName: string;
  sCeEdit: string;
  sCeEditField: string;
  Count: Integer;
  I: Integer;
  J: Integer;
begin
  // 过程头
//  sCeShowTableHeadPriv := SP4 + Format(CeShowTableHead, ['', ATableName]);
//  AddPrivateFunc.Add(sCeShowTableHeadPriv);
//  sCeShowTableHeadForm := Format(CeShowTableHead, ['T' + AFormName + '.', ATableName]);
//  AddFormFunc.Add(sCeShowTableHeadForm);

  // 过程体
  Count := GetDelimiterCount(ColumnsTypes, SDELI);
  I := 0;
  J := 0;
  while I < Count do
  begin
    Inc(J);
    sColumnName := GetDelimiterStr(ColumnsTypes, I, I + 1);
    Inc(I);
    sTypeName := GetDelimiterStr(ColumnsTypes, I, I + 1);
    Inc(I);     //quanj
    sColumnChineseName := GetDelimiterStr(ColumnsTypes, I, I + 1);  //quanj
    if    sColumnChineseName='' then sColumnChineseName:=  sColumnName;
    Inc(I);
    sTableName := GetDelimiterStr(ColumnsTypes, I, I + 1);  //quanj
    Inc(I);
    sColumnSIze := GetDelimiterStr(ColumnsTypes, I, I + 1);  //quanj
    Inc(I);
    sCeEdit := Format(CeEdit, [sColumnName]);
    sCeEditField := sCeEditField + Format(CeEditField, [sCeEdit, sColumnName, sTypeName]);

    CEGenTLabel(J, 80, J * 24, sColumnChineseName); // 生成 TLabel/TEdit
    CEGenTEdit(180, J * 24, sColumnName);

  end;

//  sCeShowTable := Format(CeShowTable, [ATableName,ATableName, sColumnName, '''''%s''''',
//    ATableName, AConQry, sCeEditField]);
//  Count := GetDelimiterCount(sCeShowTable, SDELI);
//  for I := 1 to Count do
//  begin
//    AddFormFunc.Add(GetDelimiterStr(sCeShowTable, I-1, I));
//  end;
//  if Count > 0 then
//    AddFormFunc.Add('');
end;

// 生成删除数据表记录代码
procedure CEGenDelTableRec(const AFormName, ATableName, AColumnName, AConQry, AAdoCon: string);
const
  CeProcHead = 'function %sDel%s(const SID: string): Boolean;';
  CeProcBody =
'const' + SDELI +
'  cnSql_Del%s = ''delete  from %s where %s = %s; ''; ' + SDELI +// 以最后一个字段为条件
'var' + SDELI +
'  ExeSql: string; ' + SDELI +
'begin' + SDELI +
'  Result := true; ' + SDELI +
'  ExeSql := Format(cnSql_Del%s, [SID]);' + SDELI +
'  try' + SDELI +
'    %s.BeginTrans; ' + SDELI +
'    with %s do' + SDELI +
'    begin' + SDELI +
'      close;' + SDELI +
'      sql.clear;' + SDELI +
'      sql.add(ExeSql);' + SDELI +
'      ExecSql;' + SDELI +
'    end;' + SDELI +
'    %s.CommitTrans; ' + SDELI +
'  except ' + SDELI +
'    %s.RollbackTrans; ' + SDELI +
'    Result := false; ' + SDELI +
'  end; ' + SDELI +
'end;' + SDELI ;

var
  sCeProcHeadPriv: string;
  sCeProcHeadForm: string;
  sCeProcBody: string;
  Count: Integer;
  I: Integer;
begin
  // 过程头
  sCeProcHeadPriv := SP4 + Format(CeProcHead, ['', ATableName]);
  AddPrivateFunc.Add(sCeProcHeadPriv);
  sCeProcHeadForm := Format(CeProcHead, ['T' + AFormName + '.', ATableName]);
  AddFormFunc.Add(sCeProcHeadForm);

  // 过程体
  sCeProcBody := Format(CeProcBody, [ATableName,ATableName, AColumnName, '''''%s''''',
    ATableName, AAdoCon, AConQry, AAdoCon, AAdoCon]);
  Count := GetDelimiterCount(sCeProcBody, SDELI);
  for I := 1 to Count do
  begin
    AddFormFunc.Add(GetDelimiterStr(sCeProcBody, I-1, I));
  end;
  if Count > 0 then
    AddFormFunc.Add('');
end;

// 生成添加数据表记录代码
procedure CEGenInsertTableRec(const AFormName, ATableName, AConQry, AAdoCon: string; var ColumnsTypes: string);
const
  CeProcHead = 'function %sInsert%s(%s): Boolean;';
  CeProcBody =
'const' + SDELI +
'  cnSql_Insert%s = ''insert into %s(%s) values(%s); ''; ' + SDELI +// 以最后一个字段为条件
'var' + SDELI +
'  ExeSql: string; ' + SDELI +
'begin' + SDELI +
'  Result := true; ' + SDELI +
'  ExeSql := Format(cnSql_Insert%s, [%s]);' + SDELI +
'  try' + SDELI +
'    %s.BeginTrans; ' + SDELI +
'    with %s do' + SDELI +
'    begin' + SDELI +
'      close;' + SDELI +
'      sql.clear;' + SDELI +
'      sql.add(ExeSql);' + SDELI +
'      ExecSql;' + SDELI +
'    end;' + SDELI +
'    %s.CommitTrans; ' + SDELI +
'  except ' + SDELI +
'    %s.RollbackTrans; ' + SDELI +
'    Result := false; ' + SDELI +
'  end; ' + SDELI +
'end;' + SDELI ;

var
  sCeProcHeadPriv: string;
  sCeProcHeadForm: string;
  sCeProcBody: string;
  
  sColumnName: string;
  sTypeName: string;

  sFormParams: string; // 形参列表
  sColumns: string; // 表的列列表
  sColumnsValue: string; // 列值

  Count: Integer;
  I: Integer;
begin
  // 过程体
  Count := GetDelimiterCount(ColumnsTypes, SDELI);
  I := 0;
  while I < Count do
  begin
    sColumnName := GetDelimiterStr(ColumnsTypes, I, I + 1);
    Inc(I);
    sTypeName := GetDelimiterStr(ColumnsTypes, I, I + 1);
    Inc(I);

    sColumns := sColumns + sColumnName + ', ';
    case ParseSqlDataType(sTypeName) of
      1:
        begin
          sFormParams := sFormParams + sColumnName + ': Integer; ';
          sColumnsValue := sColumnsValue + cnFmtInt + ', ';
        end;
      2:
        begin
          sFormParams := sFormParams + sColumnName + ': Single; ';
          sColumnsValue := sColumnsValue + cnFmtFlt + ', ';
        end;
      3:
        begin
          sFormParams := sFormParams + sColumnName + ': string; ';
          sColumnsValue := sColumnsValue + cnFmtStr + ', ';
        end;
      else
      begin
        sFormParams := sFormParams + sColumnName + ': string; ';
        sColumnsValue := sColumnsValue + cnFmtStr + ', ';
      end;
    end;
    
    if I = Count then
    begin
      sColumns := LeftStr(sColumns, Length(sColumns) - 2);
      sColumnsValue := LeftStr(sColumnsValue, Length(sColumnsValue) - 2);

      sFormParams := LeftStr(sFormParams, Length(sFormParams) - 2);
      sFormParams := 'const ' + sFormParams;
    end;
  end;

  // 过程头
  sCeProcHeadPriv := SP4 + Format(CeProcHead, ['', ATableName, sFormParams]);
  AddPrivateFunc.Add(sCeProcHeadPriv);
  sCeProcHeadForm := Format(CeProcHead, ['T' + AFormName + '.', ATableName, sFormParams]);
  AddFormFunc.Add(sCeProcHeadForm);
  
  // 过程体
  sCeProcBody := Format(CeProcBody, [ATableName, ATableName, sColumns, sColumnsValue, 
    ATableName, sColumns, AAdoCon, AConQry, AAdoCon, AAdoCon]);
  Count := GetDelimiterCount(sCeProcBody, SDELI);
  for I := 1 to Count do
  begin
    AddFormFunc.Add(GetDelimiterStr(sCeProcBody, I-1, I));
  end;
  if Count > 0 then
    AddFormFunc.Add('');
end;

// 生成更新数据表记录代码
procedure CEGenUpdateTableRec(const AFormName, ATableName,AColumnName, AConQry, AAdoCon: string; var ColumnsTypes: string);
const
  CeProcHead = 'function %sUpdate%s(const SID: string; %s): Boolean;';
  CeProcBody =
'const' + SDELI +
'  cnSql_Update%s = ''update %s set %s where %s = %s ; ''; ' + SDELI +// 以最后一个字段为条件
'var' + SDELI +
'  ExeSql: string; ' + SDELI +
'begin' + SDELI +
'  Result := true; ' + SDELI +
'  ExeSql := Format(cnSql_Update%s, [%s]);' + SDELI +
'  try' + SDELI +
'    %s.BeginTrans; ' + SDELI +
'    with %s do' + SDELI +
'    begin' + SDELI +
'      close;' + SDELI +
'      sql.clear;' + SDELI +
'      sql.add(ExeSql);' + SDELI +
'      ExecSql;' + SDELI +
'    end;' + SDELI +
'    %s.CommitTrans; ' + SDELI +
'  except ' + SDELI +
'    %s.RollbackTrans; ' + SDELI +
'    Result := false; ' + SDELI +
'  end; ' + SDELI +
'end;' + SDELI ;

var
  sCeProcHeadPriv: string;
  sCeProcHeadForm: string;
  sCeProcBody: string;
  sColumnName: string;
  sTypeName: string;
  sFormParams: string; // 形参列表
  sColumns: string; // 表的列列表
  sColumnsValue: string; // 列值
  Count: Integer;
  I: Integer;
begin
  // 过程体
  Count := GetDelimiterCount(ColumnsTypes, SDELI);
  I := 0;
  while I < Count do
  begin
    sColumnName := GetDelimiterStr(ColumnsTypes, I, I + 1);
    Inc(I);
    sTypeName := GetDelimiterStr(ColumnsTypes, I, I + 1);
    Inc(I);

    sColumns := sColumns + sColumnName + ', ';
    case ParseSqlDataType(sTypeName) of
      1:
        begin
          sFormParams := sFormParams + sColumnName + ': Integer; ';
          sColumnsValue := sColumnsValue + sColumnName + '=' + cnFmtInt + ', ';
        end;
      2:
        begin
          sFormParams := sFormParams + sColumnName + ': Single; ';
          sColumnsValue := sColumnsValue + sColumnName + '=' + cnFmtFlt + ', ';
        end;
      3:
        begin
          sFormParams := sFormParams + sColumnName + ': string; ';
          sColumnsValue := sColumnsValue + sColumnName + '=' + cnFmtStr + ', ';
        end;
      else
      begin
        sFormParams := sFormParams + sColumnName + ': string; ';
        sColumnsValue := sColumnsValue + sColumnName + '=' + cnFmtStr + ', ';
      end;
    end;
    
    if I = Count then
    begin
      sColumns := sColumns + 'SID, ';
      sColumns := LeftStr(sColumns, Length(sColumns) - 2);
      sColumnsValue := LeftStr(sColumnsValue, Length(sColumnsValue) - 2);

      sFormParams := LeftStr(sFormParams, Length(sFormParams) - 2);
      sFormParams := 'const ' + sFormParams;
    end;
  end;

  // 过程头
  sCeProcHeadPriv := SP4 + Format(CeProcHead, ['', ATableName, sFormParams]);
  AddPrivateFunc.Add(sCeProcHeadPriv);
  sCeProcHeadForm := Format(CeProcHead, ['T' + AFormName + '.', ATableName, sFormParams]);
  AddFormFunc.Add(sCeProcHeadForm);
  
  // 过程体
  sCeProcBody := Format(CeProcBody, [ATableName, ATableName, sColumnsValue, AColumnName, cnFmtStr,
    ATableName, sColumns, AAdoCon, AConQry, AAdoCon, AAdoCon]);
  Count := GetDelimiterCount(sCeProcBody, SDELI);
  for I := 1 to Count do
  begin
    AddFormFunc.Add(GetDelimiterStr(sCeProcBody, I-1, I));
  end;
  if Count > 0 then
    AddFormFunc.Add('');
end;

initialization
  SetLength(SqlInteger, 5);
  SetLength(SqlFloat, 2);
  SetLength(SqlString, 8);

  SqlInteger[0] := 'tinyint';
  SqlInteger[1] := 'smallint';
  SqlInteger[2] := 'int';
  SqlInteger[3] := 'bigint';
  SqlInteger[4] := 'decimal';

  SqlFloat[0] := 'float';
  SqlFloat[1] := 'real';

  SqlString[0] := 'char';
  SqlString[1] := 'nchar';
  SqlString[2] := 'varchar';
  SqlString[3] := 'nvarchar';
  SqlString[4] := 'text';
  SqlString[5] := 'smalldatetime';
  SqlString[6] := 'datetime';
  SqlString[7] := 'timestamp';

end.


