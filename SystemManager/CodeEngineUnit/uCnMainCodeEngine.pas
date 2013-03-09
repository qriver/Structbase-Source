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

unit uCnMainCodeEngine;
{* |<PRE>
================================================================================
* 软件名称：CnPack IDE 专家包
* 单元名称：Delphi 代码引擎
* 单元作者：SkyJacker (HeMiaoYu@gmail.com)
* 备    注：该单元为代码引擎主界面
* 开发平台：WinXP sp2  + Delphi 6.0 up2
* 兼容测试：无
* 本 地 化：该单元中的字符串不符合本地化处理方式
* 单元标识：$Id: uCnMainCodeEngine.pas,v 1.0 2007/03/06 14:36:27 SkyJacker Exp $
* 修改记录：2007.03.14
*               创建单元，实现功能
================================================================================
|</PRE>}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, ShellAPI, DB, ADODB, IniFiles, ExtCtrls,
  Menus, ComCtrls, Spin, ImgList, ScktComp, TypInfo, Mask, Grids, DBGrids;

type
  TCnMainCodeEngine = class(TForm)
    actlst1: TActionList;
    actGenCode: TAction;
    actSaveFile: TAction;
    actDBLinkSet: TAction;
    con1: TADOConnection;
    qry1: TADOQuery;
    actPrgSet: TAction;
    actLinkDB: TAction;
    actCtrlsSet: TAction;
    actDBSet: TAction;
    actInit: TAction;
    grpTable: TGroupBox;
    lbTable: TListBox;
    pgc1: TPageControl;
    tsSet: TTabSheet;
    grpPrgSet: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtPrgName: TEdit;
    edtUnitName: TEdit;
    edtFormName: TEdit;
    edtFormCaption: TEdit;
    edtAddUseGlobal: TEdit;
    edtAddUseLocal: TEdit;
    tsControls: TTabSheet;
    grpCtrls: TGroupBox;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl10: TLabel;
    Label1: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    seTButtonNum: TSpinEdit;
    seTEditNum: TSpinEdit;
    seTLabelNum: TSpinEdit;
    seLeft: TSpinEdit;
    seTop: TSpinEdit;
    edtLabelCaption: TEdit;
    seTEditLeftAdd: TSpinEdit;
    edtEdtAppend: TEdit;
    edtBtnAppend: TEdit;
    edtBtnCaption: TEdit;
    edtAdoQryName: TEdit;
    edtAdoConName: TEdit;
    seTAdoConNum: TSpinEdit;
    seTAdoQryNum: TSpinEdit;
    tsDB: TTabSheet;
    rgDbChoose: TRadioGroup;
    grpDBSet: TGroupBox;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl27: TLabel;
    grp1: TGroupBox;
    imgRecordOne: TImage;
    edtFuncQryName: TEdit;
    edtFuncConName: TEdit;
    grpTableInfo: TGroupBox;
    lbl20: TLabel;
    edtTabName: TEdit;
    tsDpr: TTabSheet;
    mmoDpr: TMemo;
    tsPas: TTabSheet;
    mmoPas: TMemo;
    tsDfm: TTabSheet;
    mmoDfm: TMemo;
    BtnClose: TButton;
    btnHelp: TButton;
    bvl1: TBevel;
    bvl2: TBevel;
    bvl4: TBevel;
    bvl5: TBevel;
    grpComment: TGroupBox;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl23: TLabel;
    btnLinkDB: TButton;
    btnDBLinkSet: TButton;
    rbRecordOne: TRadioButton;
    grpOP: TGroupBox;
    lblPath: TLabel;
    edtFileSavePath: TEdit;
    btnSaveFile: TButton;
    btnUpdateCode: TButton;
    actCodeWinStatus: TAction;
    actCodeSaved: TAction;
    rbMsSql: TRadioButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    mmoDBListPas: TMemo;
    mmoDbListFrm: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure actGenCodeExecute(Sender: TObject);
    procedure actSaveFileExecute(Sender: TObject);
    procedure actDBLinkSetExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure actPrgSetExecute(Sender: TObject);
    procedure actLinkDBExecute(Sender: TObject);
    procedure con1AfterConnect(Sender: TObject);
    procedure rbMySql5Click(Sender: TObject);
    procedure rbMsSqlClick(Sender: TObject);
    procedure actCtrlsSetExecute(Sender: TObject);
    procedure actDBSetExecute(Sender: TObject);
    procedure edtPrgNameKeyPress(Sender: TObject; var Key: Char);
    procedure edtUnitNameKeyPress(Sender: TObject; var Key: Char);
    procedure edtFormNameKeyPress(Sender: TObject; var Key: Char);
    procedure edtFormCaptionKeyPress(Sender: TObject; var Key: Char);
    procedure edtAddUseGlobalKeyPress(Sender: TObject; var Key: Char);
    procedure edtAddUseLocalKeyPress(Sender: TObject; var Key: Char);
    procedure lbTableClick(Sender: TObject);
    procedure actInitExecute(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure actCodeWinStatusExecute(Sender: TObject);
    procedure actCodeSavedExecute(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    lstTemp: TStringList;

    // 初始化
    procedure InitVar;
    procedure DestroyVar;
    procedure ReadIni;
    procedure WriteIni;
    procedure InitForm;
    procedure InitCEForm;

    // 生成代码
    procedure UpdateDpr;
    procedure UpdatePas;
    procedure UpdateDfm;

    // 数据库操作
    procedure ShowTable;
    procedure GenTableCodes(const AFormName, ATableName, AAdoQry, AAdoCon: string);
  public
    { Public declarations }
  end;

var
  CnMainCodeEngine: TCnMainCodeEngine;

implementation
  uses uCnCeCommon, uCnCeConstSql,filectrl;

{$R *.dfm}

procedure TCnMainCodeEngine.ReadIni();
var
  iniFilename: string;
  setini: TIniFile;
begin
  try
    iniFilename := AppPath + cnCESetIni;
    setini := Tinifile.Create(iniFilename);
    with setini do
    begin
      AppTitle := ReadString('SYSTEM', 'Title', AppTitle);
      FileSavePath := ReadString('SYSTEM', 'FileSavePath', FileSavePath);
      PrgName := ReadString('SYSTEM', 'PrgName', PrgName);
      MyUnitName := ReadString('SYSTEM', 'UnitName', UnitName);
      FormClass := ReadString('SYSTEM', 'FormClass', FormClass);
      FormName := ReadString('SYSTEM', 'FormName', FormName);
      FormCaption := ReadString('SYSTEM', 'FormCaption', FormCaption);
    end;
  finally
    FreeAndNil(setini);
  end;
end;

procedure TCnMainCodeEngine.WriteIni();
var
  iniFilename: string;
  setini: TIniFile;
begin
  try
    iniFilename := AppPath + cnCESetIni;
    setini := Tinifile.Create(iniFilename);
    with setini do
    begin
      SetIni.WriteString('SYSTEM', 'FileSavePath', FileSavePath);
      SetIni.WriteString('SYSTEM', 'AppTitle', AppTitle);
      SetIni.WriteString('SYSTEM', 'PrgName', PrgName);
      SetIni.WriteString('SYSTEM', 'UnitName', UnitName);
      SetIni.WriteString('SYSTEM', 'FormClass', FormClass);
      SetIni.WriteString('SYSTEM', 'FormName', FormName);
      SetIni.WriteString('SYSTEM', 'FormCaption', FormCaption);
    end;
  finally
    FreeAndNil(setini);
  end;
end;

procedure TCnMainCodeEngine.InitVar;
begin
  AppPath := ExtractFilePath(Application.ExeName);
  TemplatePath := AppPath + cnTemplatePath;
  FileSavePath := AppPath;

  lstTableName := TStringList.create;
  AddControlDfm := TStringList.Create;
  AddControl := TStringList.create;
  AddPrivateData := TStringList.create;
  AddPrivateFunc := TStringList.create;
  AddPublicData := TStringList.create;
  AddPublicFunc := TStringList.create;
  AddGlobalFunc := TStringList.create;
  AddFormFunc := TStringList.create;
  AddFormFuncHead := TStringList.create;
  AddCdsControl := TStringList.create;
  AddCdsFieldControl:= TStringList.create;
  lstTemp := TStringList.Create;
end;

procedure TCnMainCodeEngine.DBGrid1DblClick(Sender: TObject);
begin
   edtTabName.Text:= dbgrid1.DataSource.DataSet.FieldByName('TabName').Value;
   TableName:= edtTabName.Text;

   self.edtUnitName.Text:='u'+Tablename+'_Form';
   self.edtFormName.text:=TableName+'_Form';
   //FieldByName('TabName').ToString;
end;

procedure TCnMainCodeEngine.DestroyVar;
begin
  lstTableName.free;
  AddControlDfm.Free;
  AddControl.Free;
  AddPrivateData.Free;
  AddPrivateFunc.Free;
  AddPublicData.Free;
  AddPublicFunc.Free;
  AddGlobalFunc.Free;
  AddFormFunc.Free;
  AddFormFuncHead.Free;
  AddCdsControl.Free;
  AddCdsFieldControl.Free;
  lstTemp.Free;
end;

procedure TCnMainCodeEngine.InitForm;
begin
  edtFileSavePath.Text := FileSavePath;
  Self.Caption := AppTitle;
  Application.Title := AppTitle;
end;

procedure TCnMainCodeEngine.InitCEForm;
begin
  edtPrgName.Text := PrgName;
  edtUnitName.Text := UnitName;
  edtFormName.Text := FormName;
  edtFormCaption.Text := FormCaption;
end;

procedure TCnMainCodeEngine.UpdateDpr;
var
  DprStr: string;
begin
  DprStr := mmoDpr.Text;
  DprStr := StringReplace(DprStr, cnPrgName, PrgName, [rfReplaceAll, rfIgnoreCase]);
  DprStr := StringReplace(DprStr, cnUnitName, UnitName, [rfReplaceAll, rfIgnoreCase]);
  DprStr := StringReplace(DprStr, cnFormName, FormName,  [rfReplaceAll, rfIgnoreCase]);
  DprStr := StringReplace(DprStr, cnFormClass, FormClass,  [rfReplaceAll, rfIgnoreCase]);
  mmoDpr.Text := DprStr;
end;

procedure TCnMainCodeEngine.UpdatePas;
var
  DprStr: string;
  TempStr: string;
  I: Integer;
begin
  DprStr := mmoPas.Text;
  DprStr := StringReplace(DprStr, cnUnitName, MyUnitName, [rfReplaceAll, rfIgnoreCase]);
  DprStr := StringReplace(DprStr, cnFormName, FormName, [rfReplaceAll, rfIgnoreCase]);
  DprStr := StringReplace(DprStr, cnFormClass, FormClass, [rfReplaceAll, rfIgnoreCase]);

  DprStr := StringReplace(DprStr, cnAddUseGlobal, AddUseGlobal, [rfReplaceAll, rfIgnoreCase]);
  DprStr := StringReplace(DprStr, cnAddUseLocal, AddUseLocal, [rfReplaceAll, rfIgnoreCase]);

  DprStr := StringReplace(DprStr, cnTableName, TableName, [rfReplaceAll, rfIgnoreCase]);
  DprStr := StringReplace(DprStr, cnPkFieldName, PK_FieldName, [rfReplaceAll, rfIgnoreCase]);

  for I := 0 to AddControl.Count - 1 do
  begin
    TempStr := TempStr + CRLF + AddControl.Strings[I];
  end;
  DprStr := StringReplace(DprStr, cnAddControl,TempStr,  [rfReplaceAll, rfIgnoreCase]);
  TempStr := '';

  for I := 0 to AddPrivateData.Count - 1 do
  begin
    TempStr := TempStr + CRLF + AddPrivateData.Strings[I];
  end;
  DprStr := StringReplace(DprStr, cnAddPrivateData,TempStr,  [rfReplaceAll, rfIgnoreCase]);
  TempStr := '';

  for I := 0 to AddPrivateFunc.Count - 1 do
  begin
    TempStr := TempStr + CRLF + AddPrivateFunc.Strings[I];
  end;
  DprStr := StringReplace(DprStr, cnAddPrivateFunc,TempStr,  [rfReplaceAll, rfIgnoreCase]);
  TempStr := '';

  for I := 0 to AddPublicData.Count - 1 do
  begin
    TempStr := TempStr + CRLF + AddPublicData.Strings[I];
  end;
  DprStr := StringReplace(DprStr, cnAddPublicData,TempStr,  [rfReplaceAll, rfIgnoreCase]);
  TempStr := '';

  for I := 0 to AddPublicFunc.Count - 1 do
  begin
    TempStr := TempStr + CRLF + AddPublicFunc.Strings[I];
  end;
  DprStr := StringReplace(DprStr, cnAddPublicFunc,TempStr,  [rfReplaceAll, rfIgnoreCase]);
  TempStr := '';

  for I := 0 to AddGlobalFunc.Count - 1 do
  begin
    TempStr := TempStr + CRLF + AddGlobalFunc.Strings[I];
  end;
  DprStr := StringReplace(DprStr, cnAddGlobalFunc,TempStr,  [rfReplaceAll, rfIgnoreCase]);
  TempStr := '';

  for I := 0 to AddFormFunc.Count - 1 do
  begin
    TempStr := TempStr + CRLF + AddFormFunc.Strings[I];
  end;
  DprStr := StringReplace(DprStr, cnAddFormFunc,TempStr,  [rfReplaceAll, rfIgnoreCase]);
  TempStr := '';

  for I := 0 to AddFormFuncHead.Count - 1 do
  begin
    TempStr := TempStr + CRLF + AddFormFuncHead.Strings[I];
  end;
  DprStr := StringReplace(DprStr, cnAddFormFuncHead,TempStr,  [rfReplaceAll, rfIgnoreCase]);
  TempStr := '';

  mmoPas.Text := DprStr;
end;

procedure TCnMainCodeEngine.UpdateDfm;
var
  DprStr: string;
  TempStr: string;
  sFormCaption: string;
  I: Integer;
begin
  DprStr := mmoDfm.Text;

  sFormCaption := StrToDfmFmt(FormCaption);
  DprStr := StringReplace(DprStr, cnFormCaption, sFormCaption, [rfReplaceAll, rfIgnoreCase]);
  DprStr := StringReplace(DprStr, cnFormName, FormName,  [rfReplaceAll, rfIgnoreCase]);
  DprStr := StringReplace(DprStr, cnFormClass, FormClass,  [rfReplaceAll, rfIgnoreCase]);

  for I := 0 to AddControlDfm.Count - 1 do
  begin
    TempStr := TempStr + CRLF + AddControlDfm.Strings[I];
  end;
  DprStr := StringReplace(DprStr, cnAddControlDfm, TempStr,  [rfReplaceAll, rfIgnoreCase]);
  TempStr := '';

  for I := 0 to AddCdsControl.Count - 1 do
  begin
    TempStr := TempStr + CRLF + AddCdsControl.Strings[I];
  end;
  DprStr := StringReplace(DprStr, '<#AddCdsControl>', TempStr,  [rfReplaceAll, rfIgnoreCase]);
  TempStr := '';
  mmoDfm.Text := DprStr;
end;

procedure TCnMainCodeEngine.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  con1.Close;
  CnMainCodeEngine:=nil;
end;

procedure TCnMainCodeEngine.FormCreate(Sender: TObject);
begin
  InitVar;
  ReadIni;
  InitForm;
  InitCEForm;
end;

procedure TCnMainCodeEngine.FormDestroy(Sender: TObject);
begin
  DestroyVar;
end;

procedure TCnMainCodeEngine.actGenCodeExecute(Sender: TObject);
begin
  // 初始化
  actInit.Execute;

  // 读取设置
  actPrgSet.Execute;
  actCtrlsSet.Execute;
  actDBSet.Execute;

  // 生成代码
  mmoDpr.Clear;
  mmoPas.Clear;
  mmoDfm.Clear;
  mmoDpr.Lines.LoadFromFile(AppPath + cnTemplateDpr);
  mmoPas.Lines.LoadFromFile(AppPath + cnTemplatePas);
  mmoDfm.Lines.LoadFromFile(AppPath + cnTemplateDfm);

  UpdateDpr;
  UpdatePas;
  UpdateDfm;
end;

procedure TCnMainCodeEngine.actSaveFileExecute(Sender: TObject);
var strTmp,TempStr:String;
var i:integer;
begin
 // FileSavePath := edtFileSavePath.Text;
  if not selectDirectory('请选择操作目录' ,'',FileSavePath)  then exit;
  WriteIni;
  FileSavePath:=FileSavePath+'\';
 // mmoDpr.Lines.SaveToFile(FileSavePath + PrgName + ExtDpr);
  mmoPas.Lines.SaveToFile(FileSavePath + myUnitName + ExtPas);
  mmoDfm.Lines.SaveToFile(FileSavePath + myUnitName + ExtDfm);

  actCodeSaved.Execute;

  //全江增加,生成数据管理主界面

  self.edtUnitName.Text:='u'+Tablename+'_MainForm';
  self.edtFormName.text:=TableName+'_MainForm';
  actInit.Execute;
  actPrgSet.Execute;
  actCtrlsSet.Execute;
  actDBSet.Execute;

  // 生成代码
  mmoDpr.Clear;
  mmoPas.Clear;
  mmoDfm.Clear;
  mmoPas.Lines.LoadFromFile(AppPath + 'Data\CeTemplates\uTemplateForm.pas');
  mmoDfm.Lines.LoadFromFile(AppPath + 'Data\CeTemplates\uTemplateForm.dfm');

  strTmp:=mmoDfm.Text;
  strTmp := StringReplace(strTmp, 'TemplateForm', FormName, [rfReplaceAll, rfIgnoreCase]);
  TempStr:='';
  for I := 0 to AddCdsControl.Count - 1 do
  begin
    TempStr := TempStr + CRLF + AddCdsControl.Strings[I];
  end;
  strTmp := StringReplace(strTmp, '<#AddCdsControl>', TempStr, [rfReplaceAll, rfIgnoreCase]);

  mmoDfm.Text:=strTmp;

  strTmp:=mmoPas.Text;
  strTmp := StringReplace(strTmp, 'TemplateForm', FormName, [rfReplaceAll, rfIgnoreCase]);
  strTmp := StringReplace(strTmp, 'TABLEDEFINEForm', Tablename+'_Form', [rfReplaceAll, rfIgnoreCase]);
  strTmp := StringReplace(strTmp, '''TABLEDEFINE''',QuotedStr(tablename), [rfReplaceAll, rfIgnoreCase]);
  strTmp := StringReplace(strTmp, '''COLID''',QuotedStr(PK_FieldName), [rfReplaceAll, rfIgnoreCase]);

  TempStr:='';
  for I := 0 to AddCdsFieldControl.Count - 1 do
  begin
    TempStr := TempStr + CRLF + AddCdsFieldControl.Strings[I];
  end;
  strTmp := StringReplace(strTmp, '<#AddCdsFieldControl>', TempStr, [rfReplaceAll, rfIgnoreCase]);

  mmoPas.text:=strTmp;


  mmoPas.Lines.SaveToFile(FileSavePath + myUnitName + ExtPas);
  mmoDfm.Lines.SaveToFile(FileSavePath + myUnitName + ExtDfm);

  ShowMessage('代码保存成功'
   // + CRLF + FileSavePath + PrgName + ExtDpr
    + CRLF + FileSavePath + myUnitName + ExtPas
    + CRLF + FileSavePath + myUnitName + ExtDfm
    );


end;

procedure TCnMainCodeEngine.actDBLinkSetExecute(Sender: TObject);
var
  DBLinkFile: string;
begin
  DBLinkFile := AppPath + cnDBLinkUdl;
  ShellExecute(handle,'open',PChar(DBLinkFile),nil,nil,SW_SHOW);
end;

procedure TCnMainCodeEngine.btnHelpClick(Sender: TObject);
begin
  Application.MessageBox(PChar(AppTitle + CRLF + 'CnPack CnWizards'), '提示信息', MB_OK);
end;

// 更新工程和窗体设置
procedure TCnMainCodeEngine.actPrgSetExecute(Sender: TObject);
begin
  PrgName     :=  Trim( edtPrgName.Text 		);
  MyUnitName    :=  Trim( edtUnitName.Text 		);
  FormName    :=  Trim( edtFormName.Text 		);
  FormCaption :=  Trim( edtFormCaption.Text );
  FormClass := 'T' + FormName;

  tsDpr.Caption := PrgName + '.dpr';
  tsPas.Caption := UnitName + '.pas';
  tsDfm.Caption := UnitName + '.dfm';

  AddUseGlobal := Trim(edtAddUseGlobal.Text);
  AddUseLocal := Trim(edtAddUseLocal.Text);
  
  if AddUseGlobal <> '' then
    AddUseGlobal := ',' + AddUseGlobal;

  if AddUseLocal <> '' then
    AddUseLocal := 'uses '  + AddUseLocal + ';';

  WriteIni;
end;

procedure TCnMainCodeEngine.actLinkDBExecute(Sender: TObject);
const
  cnTableInfo = '数据表数 [ %d ]';
var
  LinkFile: string;
begin
 try
    LinkFile := AppPath + cnDBLinkUdl;
    Con1.Close;
    if bMysql then
      Con1.Provider := 'MSDASQL.1'
    else
      Con1.Provider := 'SQLOLEDB';

    Con1.LoginPrompt := false;
    Con1.ConnectionTimeout := 0;
    Con1.CommandTimeout := 0;
    Con1.ConnectionString := 'File name=' + LinkFile;
    Con1.Open;
  except
  end;

  if (Con1.Connected) then
  begin
    ShowTable;
  end
  else
  begin
    ShowMessage('连接失败');
    actDBLinkSet.Execute;
  end;

  grpTable.Caption := Format(cnTableInfo, [lbTable.count]);
end;

procedure TCnMainCodeEngine.con1AfterConnect(Sender: TObject);
begin
  if bMySql then
    Con1.Execute('SET NAMES gb2312');
end;

procedure TCnMainCodeEngine.ShowTable;
begin
  lstTableName.Clear;
  lbTable.Clear;
   with qry1 do
   begin
     close;
     SQL.Clear;
     SQL.Add(cnSql_AllTable);
     Open;
     while not Eof do
     begin
       lstTableName.Add( FieldByName('TabName').AsString );
       Next;
     end;
   end;
   lbTable.Items.Assign(lstTableName);
end;

procedure TCnMainCodeEngine.GenTableCodes(const AFormName, ATableName, AAdoQry, AAdoCon: string);
var
  ExeSql: string;
  ColumnName: string;
  TypeName: string;
  ColumnsTypes: string;
  ColumnChineseName:String;  //quanj add
  ColumnSize:String;
begin
  ExeSql := Format(cnSql_ColumnInfo, [ATableName]);
  with qry1 do
  begin
    close;
    sql.Clear;
    SQL.Add(ExeSql);
    Open;
    while Not Eof do
    begin
      if FieldByName('PkFlag').AsString ='Y' then
         PK_FieldName:=FieldByName('ColumnName').AsString;

      ColumnName := FieldByName('ColumnName').AsString;
      TypeName := FieldByName('TypeName').AsString;
      ColumnChineseName := FieldByName('ColumnChineseName').AsString;
      ColumnSize:=FieldByName('length').asString;
     // ColumnsTypes :=ColumnsTypes + ColumnName + SDELI + TypeName + SDELI;
      ColumnsTypes :=ColumnsTypes+  ColumnName + SDELI + TypeName + SDELI+
                     ColumnChineseName + SDELI   //quanjadd
                     +ATableName + SDELI
                     +ColumnSize + SDELI ;
      CEGenTClientDataSet(ATableName,ColumnName,ColumnChineseName,TypeName,ColumnSize);
      next;
    end;
    AddCdsControl.Add('END');
  end;
  // 生成显示代码
   CEGenShowTableRec(AFormName, ATableName, AAdoQry, ColumnsTypes);
  // 生成添加代码
 // CEGenInsertTableRec(AFormName, ATableName, AAdoQry, AAdoCon, ColumnsTypes);
  // 生成更新代码
 // CEGenUpdateTableRec(AFormName, ATableName, ColumnName, AAdoQry, AAdoCon, ColumnsTypes);
  // 生成删除代码
 // CEGenDelTableRec(AFormName, ATableName, ColumnName, AAdoQry, AAdoCon);
end;

procedure TCnMainCodeEngine.rbMySql5Click(Sender: TObject);
begin
  bMySql := true;
end;

procedure TCnMainCodeEngine.rbMsSqlClick(Sender: TObject);
begin
  bMySql := false;
end;

// 生成控件
procedure TCnMainCodeEngine.actCtrlsSetExecute(Sender: TObject);
var
  sCaption: string;
  sEdtAppend: string;
  sBtnAppend: string;
  sBtnCaption: string;
  iTLabelNum: Integer;
  iTEditNum: Integer;
  iTButtonNum: Integer;
  iLeft, iTop: Integer;
  iLeftEditAdd: Integer;

  sConAppend: string;
  sQryAppend: string;
  iTAdoConNum: Integer;
  iTAdoQryNum: Integer;

  I: Integer;
begin
  iTLabelNum := seTLabelNum.Value;
  iTEditNum := seTEditNum.Value;
  iTButtonNum := seTButtonNum.Value;
  iTAdoConNum := seTAdoConNum.Value;
  iTAdoQryNum := seTAdoQryNum.Value;

  iLeft := seLeft.Value;
  iTop := seTop.Value;
  sCaption := Trim(edtLabelCaption.Text);
  iLeftEditAdd := seTEditLeftAdd.Value;
  sEdtAppend := Trim(edtEdtAppend.Text);
  sBtnAppend := Trim(edtBtnAppend.Text);
  sBtnCaption := Trim(edtBtnCaption.Text);

  sConAppend := Trim(edtAdoConName.Text);
  sQryAppend := Trim(edtAdoQryName.Text);

  // 生成 TLabel
  for I:= 1 to iTLabelNum do
  begin
    CEGenTLabel(I, iLeft, iTop * I, sCaption + IntToStr(I));
  end;

  // 生成 TEdit
  for I:= 1 to iTEditNum do
  begin
    CEGenTEdit(iLeft + iLeftEditAdd, iTop * I, sEdtAppend + IntToStr(I));
  end;

  // 生成 TButton
  for I:= 1 to iTButtonNum do
  begin
    CEGenTButton(400, 25 * I, sBtnAppend + IntToStr(I), sBtnCaption + IntToStr(I));
  end;

  // 生成 TAdoConnection
  for I:= 1 to iTAdoConNum do
  begin
    CEGenTADOConnection(30 * I, 10, sConAppend + IntToStr(I));
  end;

  // 生成 TAdoQuery
  for I:= 1 to iTAdoQryNum do
  begin
    CEGenTADOQuery(30 * I, 30, sQryAppend + IntToStr(I), 'con' + sConAppend + '1');
  end;
end;

// 生成数据库操作代码
procedure TCnMainCodeEngine.actDBSetExecute(Sender: TObject);
var
  sTableName: string;
  sAdoQry: string;
  sAdoCon: string;
begin
  sTableName := Trim(edtTabName.Text);
  sAdoQry := Trim(edtFuncQryName.Text);
  sAdoCon := Trim(edtFuncConName.Text);
  if sTableName = NL then
    Exit;
  GenTableCodes(FormName,sTableName, sAdoQry, sAdoCon);
end;

procedure TCnMainCodeEngine.edtPrgNameKeyPress(Sender: TObject; var Key: Char);
begin
  EnterPress(self, Key);
end;

procedure TCnMainCodeEngine.edtUnitNameKeyPress(Sender: TObject; var Key: Char);
begin
  EnterPress(self, Key);
end;

procedure TCnMainCodeEngine.edtFormNameKeyPress(Sender: TObject; var Key: Char);
begin
  EnterPress(self, Key);
end;

procedure TCnMainCodeEngine.edtFormCaptionKeyPress(Sender: TObject;
  var Key: Char);
begin
  EnterPress(self, Key);
end;

procedure TCnMainCodeEngine.edtAddUseGlobalKeyPress(Sender: TObject;
  var Key: Char);
begin
  EnterPress(self, Key);
end;

procedure TCnMainCodeEngine.edtAddUseLocalKeyPress(Sender: TObject;
  var Key: Char);
begin
  EnterPress(self, Key);
end;

procedure TCnMainCodeEngine.lbTableClick(Sender: TObject);
var
  I: Integer;
begin
  for i := 0 to lbTable.Items.Count - 1 do
  if lbTable.Selected[i] then
  begin
    edtTabName.Text := lbTable.Items[I];
    exit;
  end;
end;

procedure TCnMainCodeEngine.actInitExecute(Sender: TObject);
begin
  AddControlDfm.Clear;
  AddControl.Clear;
  AddPrivateData.Clear;
  AddPrivateFunc.Clear;
  AddPublicData.Clear;
  AddPublicFunc.Clear;
  AddGlobalFunc.Clear;
  AddFormFunc.Clear;
  AddFormFuncHead.Clear;
  AddCdsControl.Clear;
  AddCdsFieldControl.clear;
  mmoDpr.Clear;
  mmoPas.Clear;
  mmoDfm.Clear;
end;

procedure TCnMainCodeEngine.actCodeWinStatusExecute(Sender: TObject);
begin
  tsDpr.Caption := PrgName + ExtDpr + UnSaveFlag;
  tsPas.Caption := UnitName + ExtPas + UnSaveFlag;
  tsDfm.Caption := UnitName + ExtDfm + UnSaveFlag;
end;

procedure TCnMainCodeEngine.actCodeSavedExecute(Sender: TObject);
begin
  tsDpr.Caption := PrgName + ExtDpr;
  tsPas.Caption := UnitName + ExtPas;
  tsDfm.Caption := UnitName + ExtDfm;
end;

procedure TCnMainCodeEngine.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
