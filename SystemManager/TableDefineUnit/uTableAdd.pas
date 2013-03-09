unit uTableAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, DB,fBaseForm,dbclient;

type
  TfrmTableAdd = class(TBaseForm)
    pnl3: TPanel;
    CbbAppName: TDBLookupComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtTableName: TEdit;
    edtChineseName: TEdit;
    ds1: TDataSource;
    ds2: TClientDataSet;
    btn1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    strMode:String;
  public
    { Public declarations }
    property  appDs: TDataSource read ds1 write ds1;
    procedure addNewReady;
    procedure editReady(tablename,chineseName,appid:String);
  end;

var
  frmTableAdd: TfrmTableAdd;
  oldTableName:String;
  oldAppId:String;
implementation

{$R *.dfm}

procedure TfrmTableAdd.addNewReady;
begin
   self.strMode:='ADD';
   self.edtTableName.text:='';
   self.edtChineseName.text:='';


end;

procedure TfrmTableAdd.editReady(tablename,ChineseName, appid: String);
begin
    oldTablename:=tablename;
    oldAppid:=appid;
    self.strMode:='MODIFY';
    self.edtTableName.Text:=tablename;
    self.edtChineseName.Text:=chinesename;
    self.CbbAppName.KeyValue:=appid;
end;

procedure TfrmTableAdd.FormCreate(Sender: TObject);
var CDSApp:TClientDataSet;
begin
  //cdsApp:=TclientDataSet.create(self);
  //self.DBProvide.SelectCommand(cdsapp,'select * from app_name',0);
  //ds1.DataSet:=cdsapp;

 // cbbAppName.Refresh;
 self.strMode:='';

end;

procedure TfrmTableAdd.FormShow(Sender: TObject);
begin
    cbbappname.Refresh;
end;


procedure TfrmTableAdd.btn1Click(Sender: TObject);
var strSql:String;
begin
  if strMode='ADD' then
  begin
      strSql:='insert into app_table_name ';
      strSql:=strSql+'(';
      strSql:=strSql+'table_name,table_ChineseName,appid';
      strSql:=strSql+')';
      strSql:=strSql+' values ';
      strSql:=strSql+'(';
      strSql:=strSql+''''+self.edtTableName.Text+''',';
      strSql:=strSql+''''+self.edtChineseName.Text+''',';
      strSql:=strSql+''''+self.CbbAppName.KeyValue +'''';
      strSql:=strSql+')';
  end;
  if strMode='MODIFY' then
  begin
      strSql:='update app_table_name set';
      strSql:=strSql+' table_name='''+self.edtTableName.text+''',';
      strSql:=strSql+' table_ChineseName='''+self.edtChineseName.text+''',';
      strSql:=strSql+' appid='''+self.CbbAppName.KeyValue+'''';
      strSql:=strSql+' where ';
      strSql:=strSql+'appid='''+oldappid+''' ';
      strSql:=strSql+'and table_name ='''+oldtablename+'''';
  end;
  self.mDBProvide.ExecuteSql(strsql);
  self.close;
end;

end.
