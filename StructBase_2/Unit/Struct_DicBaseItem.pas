unit Struct_DicBaseItem;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  Dbclient,
  Mask;

type
  TDicBaseItem = class(TObject)
  private
    FdicChineseName: string;
    FdicFileName: string;
    FdicFilterSql: string;
    FdicId: string;
    FdicKeyField: string;
    FdicName: string;
    FdicSourceTable: string;
    FdicValueField: string;
    FLevelMode: string;
    FPy: string;
    FDicDataSet:TClientDataSet;
    FCursorDicDataSet:TClientDataSet;
    function getCursorDicDataSet:TClientDataset;
  public
    property dicChineseName: string read FdicChineseName write FdicChineseName;
    property dicFileName: string read FdicFileName write FdicFileName;
    property dicFilterSql: string read FdicFilterSql write FdicFilterSql;
    property dicId: string read FdicId write FdicId;
    property dicKeyField: string read FdicKeyField write FdicKeyField;
    property dicLevelMode: string read FLevelMode write FLevelMode;
    property dicName: string read FdicName write FdicName;
    property dicPy: string read FPy write FPy;
    property dicSourceTable: string read FdicSourceTable write FdicSourceTable;
    property dicValueField: string read FdicValueField write FdicValueField;
    property dicDataSet:TClientDataSet read FDicDataSet write FDicDataSet;
    property dicCloneCursorDataSet:TClientDataSet read getCursorDicDataSet;
    constructor Create;
    function translateDicValue(uCode:String):String;
  end;

implementation

uses uStructbaseFrameWork,DB,strUtils,variants;

{ TDicBaseItem }

constructor TDicBaseItem.Create;
begin
   FDicDataSet:=nil;
   FCursorDicDataSet:=nil;
end;

function TDicBaseItem.getCursorDicDataSet: TClientDataset;
var tmpDS:TClientDataSet;
begin
   if dicFilterSql='' then
   begin
      result:= self.dicDataSet  ;
      exit;
   end;


  if FCursorDicDataSet=nil then
  begin
     if FDicDataSet.State<>dsInactive then
     begin
       tmpDS:= TClientDataSet.Create(nil);
       tmpDS.CloneCursor(FDicDataSet,true);
       tmpDS.OnFilterRecord:=nil;
       tmpDS.Filter:=FdicFilterSql;
       tmpDS.Filtered:=true;
       tmpDS.filename:=dicid+'_'+FdicFilterSql;
       Structbase.DicDataSets.AddDicDataSet(tmpDS); //确保系统退出时被正确释放
       FCursorDicDataSet:=   tmpDS;
       FDicDataSet.Filtered:=false;
     end;
  end;
  result:=FCursorDicDataSet;
end;



function TDicBaseItem.translateDicValue(uCode:String): String;
var cdsDic:TClientDataset;
var dicId:String;
var value:Variant;
var dicKey,dicValue,dicFilter,dicGroup,dicGroupValue:String;
begin
   if dicFilterSql<>'' then
      cdsDic:= dicCloneCursorDataSet
   else
      cdsDic:= dicDataSet;

   dicFilter:=dicFilterSql;
   dicKey:= dicKeyField;
   dicvalue:=dicValueField;
   dicGroup:=leftstr(dicFilter,pos('=',dicfilter)-1);
   //去掉引号
   dicGroupValue:=rightstr(dicFilter,length(dicfilter)-pos('=',dicfilter)-1);
   dicGroupValue:=leftstr(dicGroupValue,length(dicGroupValue)-1);

   value:= cdsdic.Lookup(dicKey,uCode,dicvalue);

  if varisnull(value) then result:=uCode else result:=value;


end;

end.
