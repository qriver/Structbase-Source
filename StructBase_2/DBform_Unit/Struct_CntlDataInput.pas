unit Struct_CntlDataInput;
{$DEFINE    NDEBUG}
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
 {$IFNDEF NDEBUG}
  CnDebug,
 {$ENDIF}
  RzEdit, RzBtnEdt,
  DBgrids,
  Mask,
  DB,
  DBCLient,
  StdCtrls,
  Dialogs,
  AppEvnts,
  CommonBpl_BaseType
  ;


Const
    state_wait=0;
    state_display=1;
    state_input=2;
    state_select=3;
type
  TStruct_CntlDataInput = class(TObject)
  private
    FCurrentState: Integer;
    FInputWindows:TForm;
    FCurControl:TMaskEdit;
    FDicDataSet:TClientDataSet;    //字典表格数据源
    FlocalLevelFilter:String ;     //分级字典在选择过程中,过滤条件是不断变化的,需要一个本地变量进行记录
    FlocalCurValue:String;         //分级字典当前选中的字典值
    ApplicationEvents1: TApplicationEvents;
    InputOverEvent:TNotifyEvent ;
    FSendTabKey:TNotifyEvent ;
    FStatusWhenExit:String;
    FCurKerPress:String;
    FFont:TFont;                //字典输入字体与目标对象保持一致
    procedure  ShowMe;           //在不同状态下控制对象的位置和状态
    procedure  CntlInputChange(sender:TObject);   //字典输入控件发生修改后，需要反映到原始目标
    procedure  CntlInputExit(sender:TObject);   //字典输入控件退出时，需要反映到原始目标
    procedure  CntlGridDblClick(sender:TObject);  //表格控件双击后,进行级别切换
    procedure  CntlInputButtonClick(Sender: TObject);
    procedure  RefreshGrid;

    procedure  buildDicGrid(aTargetDbCntrl: TDbControl);  //发生控件焦点切换后，对字典录入控件进行行为控制

    procedure  NextLevelAction;   //分级显示操作中,对下一级环境变量进行计划
    procedure  DicInputSure;    //字典输入结束

    procedure  DicDefaultFilter(DataSet: TDataSet;var Accept: Boolean);   //字典过滤
    procedure  DicLevelFilter(DataSet: TDataSet;var Accept: Boolean); //左过滤

         //系统拦截事件
    procedure  myActiveControlChange(Sender: TObject);
    procedure  ApplicationEvents1Message(var Msg: tagMSG;
               var Handled: Boolean);
  public
    TargetDbCntrl: TDbControl;   //目标对象
    CntlGrid: TDBGrid;          //字典表格
    CntlInput: TRzButtonEdit;   //修改用
    property   MyState: Integer read FCurrentState write FCurrentState; //当前输入状态
    property   StatusWhenExit: String read FStatusWhenExit write FStatusWhenExit; //当前输入状态
    property   CurActiveControl: Tmaskedit read FCurControl write FCurControl; //当前录入所在控件
    property   CurKerPress: String read FCurKerPress write FCurKerPress; //当前按键记录

    procedure  InitEnv;          //初始化环境
    procedure  ChangeState(uStatusCode:integer);
    procedure  myGetFocuse(sender:TObject);         //第一次得到焦点
    procedure  setTargetCntrl(aTargetDbCntrl: TDbControl);   //接收目标对象

   // function   getTargetCntrl:TDbControl;   //接收目标对象

    // 输入结束事件
    property    OnInputOver : TNotifyEvent read InputOverEvent write InputOverEvent;
    property    OnSendTabKey : TNotifyEvent read FSendTabKey write FSendTabKey;
    constructor Create(aowner:TComponent);
    Destructor  Destroy;override;


    procedure  Release;
  end;


implementation
 uses  //Struct_Util,
       Variants,
       Struct_Filter,
       IMCode_Delphi2010,
       //commonBpl_IMCode,
       uStructbaseFrameWork,
       StrUtils;
{
**************************** TStruct_CntlDataInput *****************************
}
procedure TStruct_CntlDataInput.ChangeState(uStatusCode: integer);
begin

   screen.OnActiveControlChange:=nil;
   if TargetDbCntrl=nil  then exit;
   case  uStatusCode of
   state_wait:
          begin
               //如果没有状态变动,不做输入确认(设置缺省值时,输入框中没值,确认会覆盖缺省值)
               if self.FCurrentState<>state_wait then
                   self.DicInputSure;


                          Self.TargetDbCntrl.cntlObjct.Color:=RGB(255,255,255);
               //if mystate=state_display then    //退出，清环境
               // begin

                   CntlInput.OnExit:=nil;
                   CntlInput.OnChange:=nil;
                   cntlInput.OnButtonClick:=nil;
                   screen.OnActiveControlChange:=nil;
                   application.OnMessage:= nil;
                   CntlInput.Visible:=False;
                   CntlGrid.Visible:=false;
                   self.FInputWindows.Visible:=false;
                   if FDicDataSet<>nil then
                      self.FDicDataSet.OnFilterRecord:=nil;
                   // Self.FSendTabKey(nil);
                   // CurActiveControl:= nil;
              //  end;
               self.FCurrentState:=state_wait;
              
          end;
          

   state_display:

          begin

               // 按esc或tab\enter时，转到显示状态
               self.DicInputSure;
              // Self.CntlInput.SetFocus;

               Self.CntlGrid.Visible:=false;
               self.FInputWindows.visible:=false;
               Self.TargetDbCntrl.cntlObjct.Color:=RGB(255,255,0);
               Self.CntlInput.SetFocus;
               Self.CntlInput.Visible:=false;
                self.FCurrentState:=state_display;
              // CntlInput.Hide;
              //  CntlInput.Top:=-1000;
                //CntlInput.lef:=-1000;

          end;

   state_input:
          begin
               //从等待转为录入状态
              if self.MyState=state_wait then
              begin
                  ShowMe;
                  self.FCurrentState:=state_input;

              end;
          end;
   state_select:
        begin
            self.FCurrentState:=state_select;
            CntlInput.OnExit:=CntlInputExit;
            CntlInput.OnChange:=CntlInputChange;
            cntlgrid.OnExit:= CntlInputExit;
            Cntlgrid.OnDblClick:=CntlGridDblClick;
            showme;
            buildDicGrid(self.TargetDbCntrl);
            self.NextLevelAction;
        end;
   end;
   screen.OnActiveControlChange:=myActiveControlChange;
end;



procedure TStruct_CntlDataInput.CntlInputExit(sender: TObject);
begin
     if CntlInput.Focused then exit;
     if cntlgrid.Focused then exit;
     DicInputSure ;
end;

constructor TStruct_CntlDataInput.Create(aowner:TComponent);
begin
     FInputWindows:=TForm.Create(nil);
     FInputWindows.BorderStyle:=bsNone;
     //FInputWindows.Visible:=false;
    // FInputWindows.Show;


   CntlGrid:= TDBGrid.create(FInputWindows);
   CntlInput:=TRzButtonEdit.create(nil);
 //  FDicDataSet:=TClientDataSet.create(self);
    CntlGrid.DataSource:=TDataSource.Create(nil);


   CntlInput.Top:=0;
   CntlInput.Left:=0;
  // CntlInput.Parent:=aowner as twincontrol;
   cntlgrid.Left:=0;
   //cntlgrid.Parent:=aowner as twincontrol;

   initEnv;
end;



procedure TStruct_CntlDataInput.InitEnv;
begin
         //集中退出出口
      
       application.OnMessage:= nil;
       CntlInput.OnExit:=nil;
       CntlInput.OnChange:=nil;
       cntlgrid.OnExit:=nil;
       Cntlgrid.OnDblClick:=nil;
       application.OnMessage:= nil;
       if  CntlGrid.DataSource <>nil  then
           if CntlGrid.DataSource.dataset<>nil then
                  CntlGrid.DataSource.dataset.OnFilterRecord:=nil;
       CntlGrid.Visible:=false;
       self.FInputWindows.Visible:=false;
       CntlInput.Visible:=false;
       CntlInput.Text:='';
       self.FlocalCurValue:='';
       self.FlocalLevelFilter:='';
       //if self.TargetDbCntrl<>nil
        //  then self.TargetDbCntrl.cntlObjct.SetFocus;
       screen.OnActiveControlChange:=nil;
       application.OnMessage:= nil;
       TargetDbCntrl:=nil;
       self.mystate:=state_wait;
end;



procedure TStruct_CntlDataInput.myActiveControlChange(Sender: TObject);
begin
  //处理焦点切换时的字典输入界面控制
  //输入确认在loastfocuse 事件中处理，这里不做处理

   {$IFNDEF NDEBUG}
        cndebugger.traceobject(sender);
   {$ENDIF}
  //  ShowMessage(Sender.ClassName);
  // if CntlInput.Visible=False then exit;
    //if self.MyState<>state_wait then  self.ChangeState(state_wait);
    if CntlInput.Focused then exit;
    if cntlgrid.Focused then exit;
     // self.TargetDbCntrl.cntlObjct.Name;
     self.ChangeState(state_wait);    //从显示和录入状态转变入等待状态, 结束字典修改
end;

procedure TStruct_CntlDataInput.Release;
begin
       screen.OnActiveControlChange:=nil;
end;

procedure TStruct_CntlDataInput.setTargetCntrl(aTargetDbCntrl: TDbControl);
//为字典输入设置目标元件
    begin
     TargetDbCntrl:=aTargetDbCntrl;
end;

procedure TStruct_CntlDataInput.ShowMe;
var x1,y1:integer;
begin
   if self.FCurrentState=state_wait then
   begin
       self.FInputWindows.Visible:=false;
       CntlGrid.Visible:=false;
       CntlInput.Visible:=true;
            //x1:=self.TargetDbCntrl.cntlObjct.ClientToParent(point(0,0)).x;
           // y1:=self.TargetDbCntrl.cntlObjct.ClientToParent(point(0,0)).y;
        // x1:=(CntlInput.Owner as TControl).clienttoscreen(point(0,0)).X;
       //  y1:=(CntlInput.Owner as TControl).clienttoscreen(point(0,0)).y;
       //  with self.TargetDbCntrl.cntlObjct.ClientToScreen(point(0,0)) do
       //  begin
       //      x1:=x-x1;
       //      y1:=y-y1;
       //      CntlInput.left:=x1;
      //       CntlInput.top:=y1 ;
      //   end;
      cntlinput.Parent:=self.TargetDbCntrl.cntlObjct.Parent;
      cntlinput.Left:=self.TargetDbCntrl.cntlObjct.Left;
      cntlinput.Top:= self.TargetDbCntrl.cntlObjct.Top;


      // self.Top:=self.TargetDbCntrl.cntlObjct.Top;
       //self.Left:= self.TargetDbCntrl.cntlObjct.Left;


     //  self.Height:=self.TargetDbCntrl.cntlObjct.Height;
       //self.Width:=self.TargetDbCntrl.cntlObjct.Width;
       //CntlInput.Top:=self.TargetDbCntrl.cntlObjct.Top;
       //CntlInput.Left:=self.TargetDbCntrl.cntlObjct.Left;
       CntlInput.Height:=self.TargetDbCntrl.cntlObjct.Height;
       CntlInput.Width:=self.TargetDbCntrl.cntlObjct.Width;

       CntlInput.Text:=self.TargetDbCntrl.realValue;
       CntlInput.SetFocus;
   end;

   if self.FCurrentState=state_select then
   begin
       CntlGrid.Parent:=self.FInputWindows;
       self.FInputWindows.Visible:=true;
       CntlGrid.Align:=alClient;
       CntlGrid.Visible:=true;
       CntlInput.Visible:=true;

          x1:=(CntlGrid.parent as TControl).clienttoscreen(point(0,0)).X;
          y1:=(CntlGrid.parent as TControl).clienttoscreen(point(0,0)).y;
         with self.TargetDbCntrl.cntlObjct.ClientToScreen(point(0,0)) do
         begin
             x1:=x-x1;
             y1:=y-y1;
             self.FInputWindows.Left:=x;
             self.FInputWindows.Top:=y+cntlinput.Height ;
            // CntlGrid.left:=x1;
           //  CntlGrid.top:=y1+cntlinput.Height ;
         end;
         with cntlgrid do
         begin
          if left+width> (parent as twincontrol).Width then
              left:=(parent as twincontrol).Width -width;
         end;
    //   self.Height:=self.TargetDbCntrl.cntlObjct.Height+cntlgrid.Height;
     //  self.Width:=self.TargetDbCntrl.cntlObjct.Width;
       //CntlInput.Top:=self.TargetDbCntrl.cntlObjct.Top;
       //CntlInput.Left:=self.TargetDbCntrl.cntlObjct.Left;
       CntlInput.Height:=self.TargetDbCntrl.cntlObjct.Height;
       CntlInput.Width:=self.TargetDbCntrl.cntlObjct.Width;
      // CntlGrid.Top:=cntlinput.Height;
       CntlInput.SetFocus;
   end;
end;







procedure TStruct_CntlDataInput.buildDicGrid(aTargetDbCntrl: TDbControl);
var i:integer;
var strKey,strVal:String;
var f1,f2:Boolean;
begin
    f1:=false;
    f2:=False;
    CntlGrid.Columns.Clear;
    strKey:=aTargetDbCntrl.fieldMetaBase.dicId;
    if strKey='' then exit;


    if FDicDataSet<>nil then
        FDicDataSet.OnFilterRecord:=nil;
        if structbase.DicItems.find(strKey).dicFilterSql='' then
             FDicDataSet:= structbase.DicItems.find(strKey).dicDataSet
         else
             FDicDataSet:= structbase.DicItems.find(strKey).dicCloneCursorDataSet;
   // structutil.getApplication(aTargetDbCntrl.appName).MetaSource.getDicCds(strkey);
    FDicDataSet.OnFilterRecord:=nil;

    strKey:=aTargetDbCntrl.dicMetaBase.dicKeyField;
    FDicDataSet.IndexFieldNames:=strkey;

    {$IFNDEF NDEBUG}
        //  CnDebugger.TraceMsg(inttostr(grid_diccds.RecordCount));
    {$ENDIF}
    CntlGrid.DataSource.DataSet:=FDicDataSet;

    CntlGrid.Height:=200;
    CntlGrid.Options := [dgTitles, dgColumnResize, dgColLines,
                      dgRowLines, dgRowSelect, dgAlwaysShowSelection] ;
          for i:=0 to FDicDataSet.FieldCount-1 do
          begin
             if (f1 and f2) then break;
              with  aTargetDbCntrl.dicMetaBase do
              begin
                   if (FDicDataSet.FieldDefs[i].Name=  dicKeyField) then
                   begin
                         CntlGrid.Columns.Add;

                        with  CntlGrid.Columns.Items[CntlGrid.Columns.count-1]  do
                        begin
                             fieldname:=dicKeyField;
                             title.Caption:='编码';
                             f1:=True;
                        end;
                   end;
                   if (FDicDataSet.FieldDefs[i].Name= dicValueField) then
                   begin
                        CntlGrid.Columns.Add;
                        with  CntlGrid.Columns.Items[CntlGrid.Columns.count-1]  do
                        begin
                             fieldname:=dicValueField;
                             title.Caption:='编码值';
                             f2:=true ;
                        //     title.Caption:=dicChineseName;
                        end;
                   end;
               end;
          end;
end;




procedure TStruct_CntlDataInput.DicInputSure;
var inputFlag:integer;
begin
         if self.CntlInput.Visible  =true then
         inputFlag:=self.MyState;
        

         self.TargetDbCntrl.realValue:=cntlinput.Text;
         self.TargetDbCntrl.displayValue:=
                 TargetDbCntrl.dicMetaBase.translateDicValue(TargetDbCntrl.realValue) ; ;
         self.TargetDbCntrl.cntlObjct.Text:=targetdbcntrl.displayValue;

        // self.InitEnv;

        // if inputFlag<>state_wait then
       //      if assigned(OnInputOver) then OnInputOver(self);
          

end;

procedure TStruct_CntlDataInput.CntlInputChange(sender: TObject);
var strTmp:String;
begin
    //字典输入控件发生修改后，需要反映到原始目标
    self.TargetDbCntrl.realValue:=self.CntlInput.Text;

    //字典录入时,如果值发生变动,需要对grid进行拼音检索\过滤等操作
    if (self.MyState=state_select) then
    begin
             FlocalLevelFilter:='';
             self.RefreshGrid;
             self.NextLevelAction;
    end;
end;

procedure TStruct_CntlDataInput.RefreshGrid;
var str,strFilter,strTmp:String;
begin
     //分级过滤
    if   (self.TargetDbCntrl.dicMetaBase.dicLevelMode<>'')   then
    begin
          CntlGrid.DataSource.dataset.Filtered:=false;
          CntlGrid.DataSource.dataset.OnFilterRecord:=DicLevelFilter;
          CntlGrid.DataSource.dataset.Filtered:=true;
          exit;
    end;

     //其它,左过滤\拼音过滤
          CntlGrid.DataSource.dataset.Filtered:=false;
          CntlGrid.DataSource.dataset.OnFilterRecord:=DicDefaultFilter;
          CntlGrid.DataSource.dataset.Filtered:=true;
          exit;
end;



destructor TStruct_CntlDataInput.Destroy;
begin
   Release;

    CntlGrid.DataSource.Free;
 //  CntlGrid.Free;
    FInputWindows.Free;
    CntlInput.Free;

end;

procedure TStruct_CntlDataInput.DicDefaultFilter(DataSet: TDataSet;
  var Accept: Boolean);
var p1:integer;
var str,str1,strFilter,strKey:String;

begin
        //str1:=dicLevelitem.dicDisplayFormat;    accept:=false;
    strKey:=TargetDbCntrl.dicMetaBase.dicKeyField;
        with TargetDbCntrl do
        begin
         if filterLevelRootValue<>'' then
         begin
              strFilter:=strkey+'=';
              strFilter:=strFilter+ filterLevelRootValue;
              if  not FilterPassAnalyse(strFilter,dataset) then
              begin
                      accept:=false;
                     exit;
              end;
          end;
       end;

    if TargetDbCntrl.dicMetaBase.dicpy='Y' then
    begin
       str1:=TargetDbCntrl.dicMetaBase.dicValueField;
       str1:=dataset.FieldByName(str1).AsString;
       //showmessage(inttostr(dataset.RecordCount));
       //str1:=gethzpy(str1);
        str1:=MakeSpellCode(str1, 2, 255);
      // showmessage(inttostr(pos(dicLevelitem.dicCurValue,str1 )));
       //showmessage(inttostr(length(dicLevelitem.dicCurValue)));
       if pos(uppercase(cntlinput.text),uppercase(str1) )>0 then
       begin
          accept:=true;
          exit;
       end;
    //   Exit;
    end;


    str:=TargetDbCntrl.dicMetaBase.dicKeyField;
    str:=dataset.FieldByName(str).AsString;
    p1:=length(cntlinput.text);
    if p1<Length(str)  then
    begin
        str:=leftstr(str,p1 );
        if str<> cntlinput.text then
        begin
           accept:=false ;
           exit;
        end;
    end;
    accept:=true;

end;

procedure TStruct_CntlDataInput.CntlGridDblClick(sender: TObject);
var strKey:String;
begin
   cntlinput.OnChange:=nil;
   if self.TargetDbCntrl.dicMetaBase.dicLevelMode<>'' then
   begin
      if cntlgrid.DataSource.dataset.RecordCount<2 then
      begin
        self.FStatusWhenExit:='ENTER';
        strKey:=self.TargetDbCntrl.dicMetaBase.dicKeyField;
        cntlinput.Text:=cntlgrid.DataSource.dataset.FieldByName(strKey).AsString;
        self.DicInputSure;
        FlocalLevelFilter:='';
        Self.ChangeState(state_display);
        exit;
      end;

      CntlInput.OnChange:=nil;
      strKey:=self.TargetDbCntrl.dicMetaBase.dicKeyField;
      cntlinput.Text:=cntlgrid.DataSource.dataset.FieldByName(strKey).AsString;
      NextLevelAction;
      CntlInput.OnChange:=CntlInputChange;
      Exit;
   end;

   //CntlInput.OnChange:=nil;
   strKey:=self.TargetDbCntrl.dicMetaBase.dicKeyField;
   cntlinput.Text:=FDicDataSet.FieldByName(strKey).AsString;
   self.DicInputSure;
   Self.ChangeState(state_display);
end;

procedure TStruct_CntlDataInput.NextLevelAction;
var str,strtmp,strKey:String;
begin
      strKey:=TargetDbCntrl.dicMetaBase.dicKeyField;
      //有用户过滤条件的,执行用户过滤
       if (TargetDbCntrl.dicMetaBase.dicLevelMode='') and
          (TargetDbCntrl.filterLevelRootValue<>'') then
       begin
            CntlGrid.DataSource.dataset.Filtered:=false;
            CntlGrid.DataSource.dataset.OnFilterRecord:=Self.DicDefaultFilter;
            CntlGrid.DataSource.dataset.Filtered:=true;
            CntlGrid.DataSource.dataset.Locate(strkey,
                     VarArrayOf([CntlInput.text]),
                      [loCaseInsensitive ]);
            exit;
       end;
       //没有任何过滤条件的，定位当前记录
       if (TargetDbCntrl.dicMetaBase.dicLevelMode='') then
       begin

            CntlGrid.DataSource.dataset.Locate(strkey,
                     VarArrayOf([CntlInput.text]),
                      [loCaseInsensitive ]);
            exit;
       end;
       //以下为级别过滤
        with TargetDbCntrl do
        begin
           str:=  dicMetaBase.dicLevelMode;
          // strTmp:=stringreplace(dicMetaBase.dicLevelMode,'*','0',[rfReplaceAll] ) ;
           strTmp:=stringreplace(str,',','',[rfReplaceAll] ) ;


             if length(cntlinput.text)<length(strTmp) then
                strTmp:= cntlinput.text+rightstr(strTmp,length(strTmp)-length(cntlinput.text))
             else
                strTmp:= cntlinput.text;

              if  cntlinput.text='' then strtmp:='';
             FlocalCurValue:=strTmp;
             strtmp:=TargetDbCntrl.filterLevelRootValue;
             if  (FlocalCurValue='') and  (strtmp<>'')  then
                  FlocalCurValue:=stringreplace(strtmp,'*','0',[rfReplaceAll] ) ;

             FlocalLevelFilter:=GetNextLevelFilterStr(FlocalCurValue,
                                               FlocalLevelFilter,
                                                 str);
             {$IFNDEF NDEBUG}
              // CnDebugger.TraceMsg('curvalue:'+FlocalCurValue);
               //CnDebugger.TraceMsg('filter:'+FlocalLevelFilter);
             {$ENDIF}

       end;

          CntlGrid.DataSource.dataset.Filtered:=false;
          CntlGrid.DataSource.dataset.OnFilterRecord:=DicLevelFilter;
          CntlGrid.DataSource.dataset.Filtered:=true;
          { 以下代码决定当最后可选字典只有一个是,是否直接退出

          if cntlgrid.DataSource.dataset.RecordCount<2 then
          begin
            self.FStatusWhenExit:='ENTER';
            self.DicInputOver;
            exit;
          end;
           }
end;

procedure TStruct_CntlDataInput.DicLevelFilter (DataSet: TDataSet;
  var Accept: Boolean);
var strKey,strValue,str,strFilter,strTmp:String;
var dicCds:TClientDataSet;
var tmpCurrentValue:String;
begin

    strKey:=TargetDbCntrl.dicMetaBase.dicKeyField;

   //------------------分级过滤--------------------------------
    if  TargetDbCntrl.dicMetaBase.dicLevelMode<> ''then
    begin
       // --------- 首先进行根值过滤,是强制必须符合的过滤条件  ----------
       //   如不符合,直接过滤退出
        with TargetDbCntrl do
        begin
         if filterLevelRootValue='' then
             filterLevelRootValue:=stringreplace(dicMetaBase.dicLevelMode,',','',[rfReplaceAll] );
          strFilter:=strkey+'=';
          strFilter:=strFilter+ filterLevelRootValue;
          if not FilterPassAnalyse(strFilter,dataset) then
          begin
                 accept:=false;
                 exit;
          end;
       end;

       // --------- 根值过滤后,分级过滤 ----------
         strFilter:=strkey+'='+ FlocalLevelFilter;
         if not FilterPassAnalyse(strFilter,dataset) then
          begin
                   accept:=false;
                   exit;
          end;
          accept:=true;
    end;

end;

procedure TStruct_CntlDataInput.CntlInputButtonClick(Sender: TObject);
begin
    //当处理显示状态时 ,如果值发生变动,将状态置为录入状态 ,弹出GRID控件
    if self.MyState=state_input then
    begin
       self.ChangeState(state_select);
    end;
end;


procedure TStruct_CntlDataInput.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var
  buf: array[0..31] of Char;
  rect: TRect;
  str,strKey: string;
begin
   if self.TargetDbCntrl=nil then exit;
   //if self.MyState=state_display then exit;
   
  if Msg.message = WM_KEYDOWN then
  begin
       screen.OnActiveControlChange:=nil;
     //IDicselect.AcceptInupt;
     GetKeyNameText(Msg.lParam, buf, Length(buf));
     str := buf;
     {$IFNDEF NDEBUG}
     //CnDebugger.TraceMsg('key press');
     //cndebugger.TraceMsg(str);
    {$ENDIF}
     FCurKerPress:=str;
    if (str='Num Enter') or (str='Enter')   then
    begin
      if mystate =state_display then
          begin
                     
             self.ChangeState(state_wait);
             if assigned(self.OnSendTabKey) then self.OnSendTabKey(nil);
          end  ;
      if mystate =state_input then
         begin
           StatusWhenExit:='ENTER';
           self.ChangeState(state_Display);
         end;
      if mystate =state_select then
         begin
           StatusWhenExit:='ENTER';
           Self.CntlGridDblClick(nil);
         end;
    end;

    if (str='Esc') or (str='Tab')  then
    begin
       if  (MyState=state_input) or  (MyState=state_select) then
       begin
          StatusWhenExit:='CANCEL';
          self.ChangeState(state_Display);
          exit;
       end else
          begin
            self.ChangeState(state_wait);
            if assigned( self.OnSendTabKey) then  self.OnSendTabKey(nil);
          end;
    end;


    if str='Down'   then
    begin
         //激活字典录入窗
         if  (MyState=state_input) or (self.MyState=state_select) then
         begin

                  CntlInputButtonClick(self.TargetDbCntrl.cntlObjct);
                  if cntlgrid.Focused then exit;
                  screen.OnActiveControlChange:=nil;
                  cntlinput.OnExit:=nil;
                  CntlGrid.SetFocus;
                  CntlInput.OnExit:= CntlInputExit ;
                 //  screen.OnActiveControlChange:=myActiveControlChange;
                 //  Self.RefreshGrid;
                 //  Self.NextLevelAction;
                 //  if not cntlgrid.DataSource.DataSet.eof then
                 //   cntlgrid.DataSource.DataSet.Next;
         end;
    end;
       screen.OnActiveControlChange:=myActiveControlChange;
  end;
end;


//function TStruct_CntlDataInput.getTargetCntrl: TDbControl;
//begin
//  result:=TargetDbCntrl;
//end;

 

procedure TStruct_CntlDataInput.myGetFocuse(sender:TObject);
var strName:String;
begin


         strName:= (Sender as TMaskEdit).Name;

        // TargetDbCntrl:=Sender as TDbControl;
         if Assigned(CurActiveControl) then   CurActiveControl.Color:=RGB(255,255,255);
         CurActiveControl:= TargetDbCntrl.cntlObjct;
         self.FFont:= TargetDbCntrl.cntlObjct.Font;

      //   CntlGrid.DataSource.DataSet:='';
         CntlInput.Font:=FFont;
         FStatusWhenExit:='';
         self.MyState:=state_wait;
         Self.FlocalLevelFilter:='';
         self.ChangeState(state_input);

         CntlInput.OnExit:=CntlInputExit;
         CntlInput.OnChange:=CntlInputChange;
         cntlInput.OnButtonClick:=CntlInputButtonClick;
         screen.OnActiveControlChange:=myActiveControlChange;
         application.OnMessage:= ApplicationEvents1Message;
end;

initialization

finalization
       screen.OnActiveControlChange:=nil;
end.
