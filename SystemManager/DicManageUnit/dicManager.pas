unit dicManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBClient, ExtCtrls, Buttons,
  fBaseForm, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfrmDicManager = class(TBaseForm)
    pnl1: TPanel;
    ds1: TDataSource;
    dbgrd1: TDBGrid;
    btn1: TBitBtn;
    lbl1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    ds2:TClientDataSet;
  public
    { Public declarations }
     constructor Create(AOwner: TComponent); override;
  end;

var  dicForm: TfrmDicManager;
implementation
 uses
 uStructbaseFrameWork,
 commonBpl_PublicFun;
{$R *.dfm}

{ TfrmDicManager }

constructor TfrmDicManager.Create(AOwner: TComponent);
begin
   inherited;
    ds2:=TClientDataSet.create(self);
   self.mDBProvide.SelectCommand(ds2,'select * from dic_source',0);
   ds1.DataSet:=ds2;
   dbgrd1.DataSource:=ds1;
   dbgrd1.Refresh;

end;

procedure TfrmDicManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 // application.Terminate;
    dicForm:=nil;
end;

procedure TfrmDicManager.btn1Click(Sender: TObject);
var rsList,rsDic:TClientDataSet;
var dicfilename,dicid,filename,tablename,appId,strsql:String;
var srcStream : TMemoryStream;
 
begin
    rsList:=Tclientdataset.Create(self);
    self.mDBProvide.SelectCommand(rsList,'select * from dic_Download',0)  ;
    rslist.First;
    while not rslist.Eof do
    begin
        rsdic:=Tclientdataset.Create(self);
        dicfilename:=rslist.FieldByName('dicfilename').AsString;
        filename:= ExtractFilePath(application.ExeName)+'/dic/'+rslist.FieldByName('dicfilename').AsString;
        lbl1.Caption:='正在处理字典文件:'+filename+'......';
        lbl1.Refresh;
        tablename:=rslist.FieldByName('dicsourceTable').AsString;
        dicid:=rslist.FieldByName('dicid').AsString;

        appId:=rslist.FieldByName('appId').AsString;
//      tablename:=self.pnl1
        //tablename:=self.dbFormProxy.getAppSchema(appId)+tablename;
        strsql:='select * from '+tablename;
       // self.DBProvide.SelectCommand(rsdic,strsql,0)  ;
        structbase.DBProvids.find('SYSMANAGE').SelectCommand(rsdic,strsql,0);
       // self.DBUtil.getDBProvide('SYSMANAGE').SelectCommand(rsdic,strsql,0);
      //  rsdic.SaveToFile(filename,dfBinary);
        freeandnil(srcStream);
        srcStream:=TMemoryStream.Create;
        rsdic.SaveToStream(srcStream,dfbinary);
        CompressionStream(srcStream,2);
        srcstream.SaveToFile(filename);


        strSql:='delete from dic_file where dic_name='''+dicid+'''';
        self.mDBProvide.ExecuteSql(strSql) ;
        strSql:='insert into dic_file (dic_name,dic_filename) values ('''+dicid+''','''+dicfilename+''')';
        self.mDBProvide.ExecuteSql(strSql);
        self.mDBProvide.putBlobField('DIC_FILE','DIC_FILE','DIC_NAME='''+dicid+'''',srcstream);
        //IdHTTP1.Request.ContentType:=
        

         //.putBlobField('UPLOAD_DOCUMENT','zywj','lsh=''1''',ms);
        rslist.Next;
    end;
    lbl1.Caption:='处理结束';
    lbl1.Refresh;
end;

end.
