unit uImportExcelFile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls, StdCtrls, Mask,
  RzButton, ImgList;

type
  TImportExcelFile = class(TForm)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    ilMain: TImageList;
    btnFileSelect: TRzBitBtn;
    edtWJLJ: TMaskEdit;
    dlgOpen1: TOpenDialog;
    btnDisplay: TRzToolButton;
    ComboBox1: TComboBox;
    ADOTable1: TADOTable;
    DBGrid1: TDBGrid;
    procedure btnFileSelectClick(Sender: TObject);
    procedure btnDisplayClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    tableList:TStringList;
  public
    { Public declarations }
  end;

var
  ImportExcelFile: TImportExcelFile;

implementation
uses strUtils;
{$R *.dfm}

procedure TImportExcelFile.btnDisplayClick(Sender: TObject);
var connStr:String;
 var i:integer;
begin

  ADOTable1.Close;
  self.ADOTable1.TableDirect:=true;
  ADOTable1.TableName:=ComboBox1.Text;
  if ComboBox1.Text<>'' then
     ADOTable1.Open
  else
   begin
   messagebox(0,'请选择数据表!','提示',0);
   exit;
   end;

   for I := 0 to self.DBGrid1.Columns.Count - 1 do
     begin
       with self.DBGrid1.Columns do
       begin
             items[i].Width:=150;
       end;
     end;



end;

procedure TImportExcelFile.btnFileSelectClick(Sender: TObject);
var fname:string;
 var i:integer;
  var connStr:String;
begin
  inherited;
//  dlgOpen1.Filter:='*.xls';

  if  dlgOpen1.Execute then
  begin
     fname:=dlgOpen1.FileName;
     edtWJLJ.Text:=fname;
  end;


  if self.ADOConnection1.Connected then  adoconnection1.Close;

  connStr:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Test.xls;Extended Properties=Excel 8.0;Persist Security Info=False';
  connStr:=strUtils.ReplaceStr(connstr,'C:\Test.xls',edtWJLJ.Text) ;
  adoconnection1.ConnectionString:=connStr;
  adoconnection1.Open;

  ADOConnection1.GetTableNames(tableList);
  self.ComboBox1.Clear;
  for i := 0 to tableList.Count - 1 do
  begin
    self.ComboBox1.AddItem(tablelist.Strings[i],nil);
  end;


end;


procedure TImportExcelFile.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tableList.Free;
  ImportExcelFile:=nil;
end;

procedure TImportExcelFile.FormCreate(Sender: TObject);
begin
  tableList:=TStringList.Create;
end;

end.
