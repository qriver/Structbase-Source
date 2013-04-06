 unit Struct_Filter;
{$DEFINE     NDEBUG}
interface
uses XmlRegObj,SYSUTILS,FORMS,XMLDoc,
     {$IFNDEF NDEBUG}CnDebug,{$ENDIF}
     DBClient,DB,Dialogs;




//TClientDataSet 过滤条件函数
function  FilterPassAnalyse(aFilterStr:String;DataSet: TDataSet):Boolean;
function  FilterBitCompare(strSource,strFilterTarget:String):Boolean;
function  computeCurLevel(curvalue,modestr:String):integer;

function  GetNextLevelFilterStr(curValue,curFilter,modeStr:String): String; //分级过滤计算函数
function  GetCurLevelFilterStr(curValue,modeStr:String): String; //分级过滤计算函数


implementation
uses  StrUtils,classes;






//--------------------------TClientDataSet Filter 过滤条件函数  ----------------------------------

 function  FilterPassAnalyse(aFilterStr:String;DataSet: TDataSet):Boolean;
 var strKey,strValue,strDataValue:String;
 var pos1:integer;
 begin
     pos1:=pos('=',aFilterStr);
     strKey:=leftstr(aFilterStr,pos1-1);
     strValue:=rightstr(afilterstr,length(afilterstr)-pos1);

     strDataValue:=dataset.FieldByName(strKey).AsString;
     result:=FilterBitCompare(strdatavalue,strValue) ;

 end;

  function FilterBitCompare(strSource,strFilterTarget:String):Boolean;
  var i:integer;
  var s1,s2:String;
  begin
      for i:=1 to length(strFilterTarget)  do
      begin
          s1:=midstr(strFilterTarget,i,1);
          s2:=midstr(strSource,i,1);
          if (s1<>'*') and (s1<>s2) and (s2<>'*') then
          begin
             result:=false;
             exit
          end;
      end;
      result:=true;

  end;



  function GetNextLevelFilterStr(curValue,curFilter,modeStr: String): String;
  var tmp:TStringList;
  var i,idx:integer;
  var strTmp,strLeft,strRight,s1,s2,strMode:String;
  begin
      //=====初次录入,没有条件,按第一级显示 ========
      tmp:=TStringList.Create;
      tmp.CommaText:=modestr;

     if (curvalue='') and (curfilter='') then    //当前值和过滤值都为空
      begin
          for i:=0 to tmp.count-1 do
          begin
             if i=0 then
                  strtmp:=tmp[i]
                 else strTmp:=stringreplace(tmp[i],'*','0',[rfReplaceAll] );
             s1:=s1+strtmp;
          end;
          result:=s1;
          tmp.Free;
          exit;
      end;
      idx:=pos('*',curfilter);
      if (curvalue<>'') and (
           (curfilter='') or (pos('*',curfilter)=0) ) then    //当前值和过滤值都为空
      begin
          strleft:='';
          idx:=computeCurLevel(curvalue,modestr);
          for i:=0 to tmp.count-1  do
          begin
             if i<idx  then
                  strleft:=strleft+midstr(curvalue,length(strleft)+1,length(tmp[i]));
             if i=idx then
                  strleft:=strleft+tmp[i];
             if i>idx then
                  strleft:=strleft+stringreplace(tmp[i],'*','0',[rfReplaceAll]) ;
          end;
          result:=strleft;
          tmp.Free;
          exit;
      end;

      //=====没有通配符到了level的最未端 ======
     //cndebugger.TraceMsg('curfilter:'+curfilter+' '+inttostr(pos('*',curFilter)));
      if pos('*',curFilter)=0 then
      begin
             result:=curFilter;
             tmp.Free;
             exit;
      end;

     // tmp.CommaText:=curFilter;
      idx:=0;
      for i:=0 to tmp.count-1 do
      begin
           strleft:=strleft+midstr(curFilter,length(strleft)+1,length(tmp[i]));
           if pos('*',strleft)>0 then
          begin
             idx:=i;
             break;
          end;
         end;
      //最后一级
      if (idx=tmp.Count-1) then
      begin
         result:= curvalue;
         tmp.Free;
         exit;
      end;
      strleft:='';
      for i:=0 to tmp.count-1 do
      begin
          if i<> idx+1  then
              strleft:=strleft+midstr(curvalue,length(strleft)+1,length(tmp[i]))
          else
             strleft:=strleft+tmp[i];
      end;
      result:=strleft;

      tmp.Free;
      exit;
  end;

function computeCurLevel(curvalue,modestr:String):integer;
var tmp:TStringList;
var i,idx:integer;
var strTmp,strLeft,strRight,s1,s2,strMode:String;
begin
      //初次录入,没有条件,按第一级显示
      strLeft:='';
      tmp:=TStringList.Create;
      tmp.CommaText:=modestr;



      for i:=0 to tmp.count-1 do
      begin
         strTmp:=midstr(curvalue,length(strleft)+1,length(tmp[i]));
         strleft:=strleft+strtmp;
                s2:=midstr(tmp[i],0,length(tmp[i])-1) ;
         strmode:=stringreplace(tmp[i],'*','0',[rfReplaceAll]);
          idx:=pos(strTmp,strmode);
        // cndebugger.TraceMsg(inttostr(CompareStr(strTmp,strmode)));
         if CompareStr(strTmp,strmode)=0 then
         begin
            result:=i;
           // cndubuger.tracemsg(inttostr(i))
            exit;
         end;

      end;
      result:=i;
      tmp.Free;
end;


function  GetCurLevelFilterStr(curValue,modeStr:String): String; //分级过滤计算函数
var tmp:TStringList;
var i,idx:integer;
var strTmp,strLeft,strRight,s1,s2,strMode:String;
begin

      tmp:=TStringList.Create;
      tmp.CommaText:=modestr;

      idx:=computeCurLevel(curvalue,modestr);
      strLeft:='';
      for i:=0 to tmp.count-1 do
      begin
          if i< idx   then
              strleft:=strleft+midstr(curvalue,length(strleft)+1,length(tmp[i]))
          else
              strleft:=strleft+tmp[i];
      end;
      result:=strleft;
      tmp.Free;
end;


end.


