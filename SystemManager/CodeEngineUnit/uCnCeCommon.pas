{******************************************************************************}
{                       CnPack For Delphi/C++Builder                           }
{                     �й����Լ��Ŀ���Դ�������������                         }
{                   (C)Copyright 2001-2007 CnPack ������                       }
{                   ------------------------------------                       }
{                                                                              }
{            ���������ǿ�Դ��������������������� CnPack �ķ���Э������        }
{        �ĺ����·�����һ����                                                }
{                                                                              }
{            ������һ��������Ŀ����ϣ�������ã���û���κε���������û��        }
{        �ʺ��ض�Ŀ�Ķ������ĵ���������ϸ���������� CnPack ����Э�顣        }
{                                                                              }
{            ��Ӧ���Ѿ��Ϳ�����һ���յ�һ�� CnPack ����Э��ĸ��������        }
{        ��û�У��ɷ������ǵ���վ��                                            }
{                                                                              }
{            ��վ��ַ��http://www.cnpack.org                                   }
{            �����ʼ���master@cnpack.org                                       }
{                                                                              }
{******************************************************************************}

unit uCnCeCommon;
{* |<PRE>
================================================================================
* ������ƣ�������������
* ��Ԫ���ƣ�Delphi ������������ⵥԪ
* ��Ԫ���ߣ�SkyJacker
* ��    ע���õ�Ԫ�����˴�������ĳ�������������������
* ����ƽ̨��WinXP sp2  + Delphi 6.0 up2
* ���ݲ��ԣ���
* �� �� �����õ�Ԫ�е��ַ��������ϱ��ػ�����ʽ
* ��Ԫ��ʶ��$Id: uCnCeCommon.pas,v 1.0 2007/03/06 14:36:27 SkyJacker Exp $
* �޸ļ�¼��2007.03.14
*               ������Ԫ��ʵ�ֹ���
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
// ������س���
//------------------------------------------------------------------------------

  cnDBLinkUdl = 'data\DbLink.udl'; // ���ݿ�����
  cnTemplatePath ='data\CETemplates\';
  cnTemplateDpr = cnTemplatePath + 'Project1.dpr';
  cnTemplatePas = cnTemplatePath + 'Unit1.pas';
  cnTemplateDfm = cnTemplatePath + 'Unit1.dfm';

  cnTempPath: string = 'data\temp\';
  cnCESetIni: string = 'data\ceset.ini';
  CRLF = #13#10;
  NL = '';

//------------------------------------------------------------------------------
// ģ����س���
// ע: �˱��Ҳ������������ģ��, ��ǰ�����ֹ��޸�ģ��
//------------------------------------------------------------------------------

  // ������Ϣ
  cnPrgName = '<#PrgName>';         // ���̱�ʶ
  cnUnitName = '<#UnitName>';       // ��Ԫ��ʶ
  cnFormClass = '<#TFormName>';     // �������ʶ
  cnFormName = '<#FormName>';       // ��������ʶ
  cnFormCaption = '<#FormCaption>'; // �������Ʊ�ʶ

  // �û�������Ϣ�������
  cnAddUseGlobal = '<#AddUseGlobal>';      // ����ȫ�� uses ����Ԫ
  cnAddUseLocal = '<#AddUseLocal>';        // �������� uses ����Ԫ
  cnAddControl  = '<#AddControl>';         // �����ؼ�
  cnAddControlDfm = '<#AddControlDfm>';    // �����ؼ���Ӧ�� dfm
  cnAddPrivateData  = '<#AddPrivateData>'; // ����˽�б�������
  cnAddPrivateFunc  = '<#AddPrivateFunc>'; // ����˽�й��̻�������
  cnAddPublicData   = '<#AddPublicData>';  // ����������������
  cnAddPublicFunc   = '<#AddPublicFunc>';  // �����������̻�������

  // ����ȫ�ֺ��������౾�����������
  cnAddGlobalFunc = '<#AddGlobalFunc>';     // ����Ԫ�����ĺ���
  cnAddFormFunc = '<#AddFormFunc>';         // ��������ĺ���
  cnAddFormFuncHead = '<#AddFormFuncHead>'; // ��������ĺ���ͷ����

  //ȫ������
  cnTableName = '<#TableName>'; // ��Ҫ���������ݱ���
  cnPkFieldName = '<#PkFieldName>'; // ��Ҫ���������ݱ���

  // ��������ʽ���
  SDELI = '?'; // �ַ��������ָ���(ע����������к��� ? �ᵼ�½�������)
  SP1 = ' ';   // ���� 1 ~ 8 ���ո�
  SP2 = SP1 + SP1;
  SP4 = SP2 + SP2;
  SP6 = SP4 + SP2;
  SP8 = SP6 + SP2;

  // �������� Sql ����ʽ��
  cnFmtStr = ' ''''%s''''';
  cnFmtInt = ' %d';
  cnFmtFlt = ' %f';

  // �����ļ���չ��
  ExtDpr = '.dpr';
  ExtPas = '.pas';
  ExtDfm = '.dfm';
  UnSaveFlag = ' *';

var

//------------------------------------------------------------------------------
// ������ر���
//------------------------------------------------------------------------------

  BtnText: array[0..2] of string= ('ȷ��','ȡ��','����');
  AppTitle: string = 'CnPack Delphi �������� V1.0';
  AppPath: string;
  TemplatePath: string;
  FileSavePath: string;
  bMySql: Boolean;
  lstTableName: TStrings;
  SqlInteger, SqlFloat, SqlString: TStringArray;

//------------------------------------------------------------------------------
// ģ����ر���
//------------------------------------------------------------------------------

  PrgName: string = 'Project1';
  MyUnitName: string = 'Unit1';
  FormClass: string = 'TForm1';
  FormName: string = 'Form1';
  FormCaption: string = 'Form1';

  TableName: String ='MyTableName';
  PK_FieldName:String ='PK_FieldName';


  // �û�������Ϣ�������
  AddUseGlobal: string;       // ����ȫ�� uses ����Ԫ
  AddUseLocal: string;        // �������� uses ����Ԫ
  AddControl: TStrings;       // �����ؼ�
  AddCdsControl: TStrings;    // ����TClientDataset�ؼ�
  AddCdsFieldControl: TStrings;    // ����TClientDataset�ؼ�
  AddControlDfm: TStrings;    // �����ؼ���Ӧ�� dfm
  AddPrivateData: TStrings;   // ����˽�б�������
  AddPrivateFunc: TStrings;   // ����˽�й��̻�������
  AddPublicData: TStrings;    // ����������������
  AddPublicFunc: TStrings;    // �����������̻�������

  // ����ȫ�ֺ��������౾�����������
  AddGlobalFunc: TStrings;    // ����Ԫ�����ĺ���
  AddFormFunc: TStrings;      // ��������ĺ���
  AddFormFuncHead: TStrings;  // ��������ĺ���ͷ����

//------------------------------------------------------------------------------
// ��������
//------------------------------------------------------------------------------

procedure EnterPress(AFrm: TForm; var Key: Char);
{* �س�ģ�� Tab}

function StrToDfmFmt(const AStr: string): string;
{* ���л�Ӣ�ַ���ת��Ϊ Delphi Dfm �ĸ�ʽ}

function iGetDelimiterIndex(const AStr: string; n: integer): integer;
{* �����ַ����е� n ���ָ����λ��}

function GetDelimiterStr(const AStr: string; m: integer; n: integer): string;
{* �����ַ����е� m ���ָ����� n ���ָ��֮����ַ�(m<n)}

function GetDelimiterCount(const AStr, ADeli:string):integer;
{* ���طָ������}

function IsExistStr(const AStr: string;var AStrList: TStringArray): Boolean;
{* �ַ����б����Ƿ����ĳһ�ַ���}

//------------------------------------------------------------------------------
// ����������غ���
//------------------------------------------------------------------------------

procedure CEGenTLabel(ANo, ALeft, ATop: Integer; const ACaption: string);
{* ����һ�� TLabel}

procedure CEGenTEdit(ALeft, ATop: Integer; const AEdtName: string);
{* ����һ�� TEdit}

procedure CEGenTClientDataSet (const ATableName,AColumnName,AChineseName,AType,ASize: string);
{* ����һ�� TClientDataSet}

procedure CEGenTButton(ALeft, ATop: Integer; const AName, ACaption: string);
{* ����һ�� TButton}

procedure CEGenTADOConnection(ALeft, ATop: Integer; const AName: string);
{* ����һ�� TADOConnection}

procedure CEGenTADOQuery(ALeft, ATop: Integer; const AName, AAdoCon: string);
{* ����һ�� TADOQuery}

procedure CEGenShowTableRec(const AFormName, ATableName, AConQry: string; var ColumnsTypes: string);
{* ���ɲ�ѯ���ݱ��¼����, ��������ؿؼ�}

procedure CEGenDelTableRec(const AFormName, ATableName, AColumnName, AConQry, AAdoCon: string);
{* ����ɾ�����ݱ��¼����}

procedure CEGenInsertTableRec(const AFormName, ATableName, AConQry, AAdoCon: string; var ColumnsTypes: string);
{* ����������ݱ��¼����}

procedure CEGenUpdateTableRec(const AFormName, ATableName, AColumnName, AConQry, AAdoCon: string; var ColumnsTypes: string);
{* ���ɸ������ݱ��¼����}

implementation

//------------------------------------------------------------------------------
// ��������
//------------------------------------------------------------------------------

// �س�ģ�� Tab
procedure EnterPress(AFrm: TForm; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    AFrm.Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

// ���л�Ӣ�ַ���ת��Ϊ Delphi �� Dfm ��ʽ
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
    if Ord(W[i])>127 then // ���Ϊ����ͨ ascii������Ϊ�ǿ��ַ�
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

// �����ַ����е� n ���ָ����λ��
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

// �����ַ����е� m ���ָ����� n ���ָ��֮����ַ�(m<n)
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

// ���طָ������
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

// ʹ�� string case
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

// �ַ����б����Ƿ����ĳһ�ַ���
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

// ���ݿ��ֶ������Ƿ����תΪ Delphi ������
function IsInteger(const AStr: string): Boolean;
begin
  Result := IsExistStr(AStr, SqlInteger);
end;

// ���ݿ��ֶ������Ƿ����תΪ Delphi �ĸ�����
function IsFloat(const AStr: string): Boolean;
begin
  Result := IsExistStr(AStr, SqlFloat);
end;

// ���ݿ��ֶ������Ƿ����תΪ Delphi ���ַ���
function IsString(const AStr: string): Boolean;
begin
  Result := IsExistStr(AStr, SqlString);
end;

// ���ʵ�� case string
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
// ����������غ���
//------------------------------------------------------------------------------

// ����һ�� TLabel
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

// ����һ�� TEdit
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

// ����һ�� TClientdataset
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
   //TWideStringField�ַ���
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


// ����һ�� TButton
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

// ����һ�� TADOConnection
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

// ����һ�� TADOQuery
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

// ���ɲ�ѯ���ݱ����, ��������ؿؼ�
// ͬʱ����ע��: ע������Ϊ�ֶε�����
procedure CEGenShowTableRec(const AFormName, ATableName, AConQry: string; var ColumnsTypes: string);
const
  CeShowTableHead = 'procedure %sShow%s(const SID: string);';
  CeShowTable =
'const' + SDELI +
'  cnSql_Show%s = ''select top 1 * from %s where %s = %s; ''; ' + SDELI +// �����һ���ֶ�Ϊ����
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
  // ����ͷ
//  sCeShowTableHeadPriv := SP4 + Format(CeShowTableHead, ['', ATableName]);
//  AddPrivateFunc.Add(sCeShowTableHeadPriv);
//  sCeShowTableHeadForm := Format(CeShowTableHead, ['T' + AFormName + '.', ATableName]);
//  AddFormFunc.Add(sCeShowTableHeadForm);

  // ������
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

    CEGenTLabel(J, 80, J * 24, sColumnChineseName); // ���� TLabel/TEdit
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

// ����ɾ�����ݱ��¼����
procedure CEGenDelTableRec(const AFormName, ATableName, AColumnName, AConQry, AAdoCon: string);
const
  CeProcHead = 'function %sDel%s(const SID: string): Boolean;';
  CeProcBody =
'const' + SDELI +
'  cnSql_Del%s = ''delete  from %s where %s = %s; ''; ' + SDELI +// �����һ���ֶ�Ϊ����
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
  // ����ͷ
  sCeProcHeadPriv := SP4 + Format(CeProcHead, ['', ATableName]);
  AddPrivateFunc.Add(sCeProcHeadPriv);
  sCeProcHeadForm := Format(CeProcHead, ['T' + AFormName + '.', ATableName]);
  AddFormFunc.Add(sCeProcHeadForm);

  // ������
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

// ����������ݱ��¼����
procedure CEGenInsertTableRec(const AFormName, ATableName, AConQry, AAdoCon: string; var ColumnsTypes: string);
const
  CeProcHead = 'function %sInsert%s(%s): Boolean;';
  CeProcBody =
'const' + SDELI +
'  cnSql_Insert%s = ''insert into %s(%s) values(%s); ''; ' + SDELI +// �����һ���ֶ�Ϊ����
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

  sFormParams: string; // �β��б�
  sColumns: string; // ������б�
  sColumnsValue: string; // ��ֵ

  Count: Integer;
  I: Integer;
begin
  // ������
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

  // ����ͷ
  sCeProcHeadPriv := SP4 + Format(CeProcHead, ['', ATableName, sFormParams]);
  AddPrivateFunc.Add(sCeProcHeadPriv);
  sCeProcHeadForm := Format(CeProcHead, ['T' + AFormName + '.', ATableName, sFormParams]);
  AddFormFunc.Add(sCeProcHeadForm);
  
  // ������
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

// ���ɸ������ݱ��¼����
procedure CEGenUpdateTableRec(const AFormName, ATableName,AColumnName, AConQry, AAdoCon: string; var ColumnsTypes: string);
const
  CeProcHead = 'function %sUpdate%s(const SID: string; %s): Boolean;';
  CeProcBody =
'const' + SDELI +
'  cnSql_Update%s = ''update %s set %s where %s = %s ; ''; ' + SDELI +// �����һ���ֶ�Ϊ����
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
  sFormParams: string; // �β��б�
  sColumns: string; // ������б�
  sColumnsValue: string; // ��ֵ
  Count: Integer;
  I: Integer;
begin
  // ������
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

  // ����ͷ
  sCeProcHeadPriv := SP4 + Format(CeProcHead, ['', ATableName, sFormParams]);
  AddPrivateFunc.Add(sCeProcHeadPriv);
  sCeProcHeadForm := Format(CeProcHead, ['T' + AFormName + '.', ATableName, sFormParams]);
  AddFormFunc.Add(sCeProcHeadForm);
  
  // ������
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


