{==============================================================================}
{▎ 单元功能：  仿iPhone界面图标效果                                           }
{▎ 单元版本：  V1.1                                                           }
{▎ 开发平台：  WinXP + SP2 + Delphi 7                                         }
{▎ 作    者：  maybloss   吉林长春人士   邮箱：maybloss@163.com               }
{▎ 声    明：  本单元创意以及实现纯属个人爱好+灵机一动+（调试*N），如有雷同纯 }
{▎属巧合。本单元可编译成控件，也可直接调用（参见例程）。实现了iPhone界面基本效}
{▎果，还有待于改进，希望有志之士加以发扬光大。                                }
{                                                                              }
{本单元如出于学习交流目的可随机复制和修改，发行时请附带此声明，也请顺手电邮一份}
{给作者，共同学习。未经作者允许，也可用于商业目的，但必须附带以上声明并公布全部}
{源码，否则作者保留追究当事人责任和追讨商业盈利的一切权利。                    }
{==============================================================================}
{
  Version 1.1 [2010-09-28]
    引入 pngimage （出自 www.ccrun.com ）第三方控件，可以支持 PNG 格式的图标、效果更好。
    pngimage 很有意思，Delphi版包括4个pas文件（具体哪个是关键没有仔细研究），
    只要 uses pngimage 就可用 Image 来载入PNG格式的图片，很神奇，佩服作者。
    增加缓冲功能 DoubleBuf，减少闪烁。
    添加 Align 属性的继承，编译成控件时便于摆放。
    增加控制标题文本区显示控制的属性设置 ShowCaption。
    添加载入背景方法 loadBackPic。
    加强整个界面拖动的效果。
     

  Version 1.0 [2010-09-27]
    完成模仿iPhone的基本界面效果。
    功能实现未使用第三方控件。
    测试版，不一定稳定。
}
    
unit ImageViewYM;
//download by http://www.codefans.net
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, ExtCtrls, pngimage,uDataModule;

type
  TPnlRec = record
    iH,iL : Integer;//行列号
    iChg : Integer;//变动标志
    sName : string;//控件名称
    pImg : TImage;//ExtCtrls  控件指针
    pRect : TRect;//Types 控件对应边界区域
  end;

  TDragImage = record
    sName : string;//显示标签
    sKeyStr : string;//关键字符
    sPicPathName : string;//图片路径名
    index : Integer;//本视图内定索引
    iNodeId : Integer;//自定义全局标识
  end;
  PDragImage = ^TDragImage;
  
  TImageViewYM = class(TWinControl)
  private
    { Private declarations }
    //只有在类被定义的单元中的代码可访问
    ScrollBox1 : TScrollBox;//Forms
    FAutoScroll : Boolean;//是否显示滚动条
    FMoveAction : Boolean;//排序移动效果
    FHCTS : Boolean;      //加速(绘制界面效果时)
    FColCount :Integer;   //6 列数
    FCRDistance :Integer; //2 图标间距
    FCellWidth :Integer;  //60图宽
    FCellHeight :Integer; //60图高

    FFontHeight : Integer;//文本区高度
    FDragModel : Integer;//拖动模式,0=界面移动,1=图标拖动

    iBigWH : Integer;//图标扩大效果增量值
    FItemCout : Integer;//单元数量
    FItemIndex : Integer;//点击或选定的索引
    FItemCaption : string;//点击或选定的单元文本
    FShowCaption : Boolean;//是否显示文本
    FDoubleBuf : Boolean;//开启缓冲
    FMoveWithDesk : Boolean;//背景一同拖拽

    FTimer1 : TTimer;

    FItemClick : TNotifyEvent;//传递事件的指针
    
    //设置函数
    procedure SetColCount(const Value:Integer);
    procedure SetMoveAction(const Value:Boolean);
    procedure SetHCTS(const Value:Boolean);

    procedure SetCRDistance(const Value:Integer);
    procedure SetCellWidth(const Value:Integer);
    procedure SetCellHeight(const Value:Integer);
    procedure SetDragModel(const Value:Integer);

    procedure drawImgView( img : TImage; iflag : Integer=0 );
    procedure drawImgRect( img : TImage; sPicFile : string=''; sCap : string='' );
    procedure pnlModMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlModMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    function reArray( Sender: TObject ) : Integer;
    procedure pnlModMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    function movePanelTo( pImage : TImage; ix,iy : Integer ) : Integer;
    function addFullImage( Sender: TObject ) : Integer;
    
    procedure backMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  protected
    { Protected declarations }
    //在类和其子孙被定义的单元中的代码可访问
    pnlRec : array of TPnlRec;
    iDx,iDy,iDown : Integer;
    MyList : TList;
    bMoving : Boolean;
    pMouseDownPoint : TPoint;
    iDragFlag : Integer;

    procedure FTimer1Timer(Sender: TObject);

  public
    { Public declarations }//给应用程序调用用
    //所有代码可访问
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;

    procedure ClearComponents();
    procedure BuildComponents();
    function AddItem( sName : string=''; sPic : string='' ) : Integer;
    function DeleteItem( index : Integer ) : Boolean;
    procedure ClearItem();

//    procedure SubItemClick( Sender: TObject; var index : Integer; var CTest : string );
//    procedure WMLButtonUp(var msg:TWMLButtonUp);message WM_LButtonUp;

    procedure loadBackPic( sFilePaht : string='' );
    procedure subClick( Sender: TObject );
    procedure WMLButtonUp(var msg:TWMLButtonUp); message WM_LButtonUp;
    
  published
    { Published declarations }//属性列表用
    property Align;
    
    //所有代码可访问，并在对象查看器中可用。被保存在窗体文件中
    property ColCount :Integer read FColCount write SetColCount default 6;
    property CRDistance :Integer read FCRDistance write SetCRDistance default 2;
    property CellWidth :Integer read FCellWidth write SetCellWidth default 60;
    property CellHeight :Integer read FCellHeight write SetCellHeight default 60;
    property MoveAction: Boolean read FMoveAction write SetMoveAction default True;

//    property ColCount :Integer read FColCount write FColCount default 6;
//    property CRDistance :Integer read FCRDistance write FCRDistance default 2;
//    property CellWidth :Integer read FCellWidth write FCellWidth default 60;
//    property CellHeight :Integer read FCellHeight write FCellHeight default 60;
//    property FontHeight :Integer read FFontHeight write FFontHeight default 15;
//    property MoveAction: Boolean read FMoveAction write FMoveAction default True;

    property HCTS:Boolean read FHCTS write SetHCTS  default True;
    property DoubleBuf: Boolean read FDoubleBuf write FDoubleBuf default True;
    property ShowCaption: Boolean read FShowCaption write FShowCaption default True;
    property MoveWithDesk: Boolean read FMoveWithDesk write FMoveWithDesk default True;
    property DragModel : Integer read FDragModel write SetDragModel default 1;//0;
    property BigWH : Integer read iBigWH write iBigWH default 2;

    property ItemCout : Integer read FItemCout default 0;
    property ItemIndex : Integer read FItemIndex default -1;
    property ItemCaption : string read FItemCaption;

    { TWinControl publish events }
    //暂时无用，继承下去备用
    //property OnDockDrop;
		//property OnDockOver;
    //property OnUnDock;
		property OnEnter;
    property OnExit;
    property OnGetSiteInfo;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    //===========================

//    procedure Click(Sender: TObject); override;
//    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure SubItemClick( Sender: TObject; var index : Integer; var CTest : string );

    property OnItemClick: TNotifyEvent read FItemClick write FItemClick;
    
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TImageViewYM]);
end;

constructor TImageViewYM.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);

  {初始化属性值}
  Height:= 200;
  Width := 200;

  FTimer1:=TTimer.Create(Self);
  FTimer1.Enabled := False;
  FTimer1.Interval:= 1000;//一秒
  FTimer1.OnTimer := FTimer1Timer;
  FTimer1.Tag     := 0;

  {初始化变量值}
  
  ScrollBox1 := TScrollBox.Create(Self);
  ScrollBox1.Parent := Self;
  ScrollBox1.Align := alClient;
//  ScrollBox1.Width := 200;
//  ScrollBox1.Height:= 200;
  ScrollBox1.ParentCtl3D := False;
  ScrollBox1.Ctl3D  := False;
  ScrollBox1.Color  := clblue;
  ScrollBox1.Visible:= True;
  ScrollBox1.AutoScroll := False;
//  ScrollBox1.OnMouseDown:= backMouseDown;//pnlModMouseDown;
  //}

  FMoveAction := True;//
  FHCTS       := True;//加速
  FColCount   := 6;
  FCRDistance := 2;
  FCellWidth  := 60;
  FCellHeight := 60;
  FFontHeight := 15;
  FDragModel  := 1;//0;

  FItemCout   := 0;
  FItemIndex  := -1;
  FDoubleBuf  := True;
  FShowCaption:= True;

  iBigWH := 10;
  
  MyList := TList.Create;

//  loadBackPic();

end;

destructor TImageViewYM.Destroy;
begin
  try
    ScrollBox1.Free;
    MyList.Free;
    FTimer1.Interval:=0;
    FTimer1.Enabled := False;
    FTimer1.Free;
  except
  end;

  inherited Destroy;
end;

procedure TImageViewYM.loadBackPic( sFilePaht : string='' );
var
  tcmp : TComponent;
begin
  if Trim(sFilePaht)='' then sFilePaht := '.\back.bmp';

  if not FileExists( sFilePaht ) then
  begin
    Exit;
  end;

  tcmp := ScrollBox1.FindComponent('imgBack_');
  if tcmp<>nil then
  begin
    with (tcmp as TImage) do
    begin
      try
        Picture.LoadFromFile( sFilePaht );
        Repaint;
      except
      end;
    end;

  end
  else
  begin
    with TImage.Create(ScrollBox1) do
    begin
      Parent  := ScrollBox1;
      Name    := 'imgBack_';
      Hint    := '';
      Align   := alClient;
      Stretch := True;//图片拉伸
      Transparent := True;
      Tag     := -1;
      SendToBack;
      Picture.LoadFromFile( sFilePaht );
    end;
  end;

end;

procedure TImageViewYM.SetColCount(const Value:Integer);
begin
  FColCount:=Value;
end;

procedure TImageViewYM.SetMoveAction(const Value:Boolean);
begin
  FMoveAction:=Value;
end;

procedure TImageViewYM.SetHCTS(const Value:Boolean);
begin
  FHCTS:=Value; 
end;

procedure TImageViewYM.SetCRDistance(const Value:Integer);
begin
  FCRDistance:=Value;
end;

procedure TImageViewYM.SetCellWidth(const Value:Integer);
begin
  FCellWidth:=Value;
end;

procedure TImageViewYM.SetCellHeight(const Value:Integer);
begin
  FCellHeight:=Value;
end;

procedure TImageViewYM.SetDragModel(const Value:Integer);
begin
  FDragModel:=Value;
end;

procedure TImageViewYM.ClearComponents();
var
  i : Integer;
begin
  for i := ScrollBox1.ComponentCount-1 downto 0 do
  begin
    Application.ProcessMessages;
    ScrollBox1.Components[i].Free;
  end;
//  loadBackPic();     
end;

procedure TImageViewYM.ClearItem();
var
  i : Integer;
begin
  
  for i := (MyList.Count - 1) downto 0 do
  begin
    DeleteItem(i);
  end;
  FItemCout := MyList.Count;
  
end;

procedure TImageViewYM.drawImgView( img : TImage; iflag : Integer=0 );
begin
  //拖动前放大图标效果
  if iflag=0 then//放大
  begin
    if FileExists(img.Hint) then
    begin      
      img.Width := FCellWidth + iBigWH;//FFontHeight;
      img.Height:= FCellHeight+ iBigWH;//FFontHeight;
      img.Picture.LoadFromFile( img.Hint );
    end
    else
    begin
      img.Width := FCellWidth + iBigWH;
      img.Height:= FCellHeight+ FFontHeight+ iBigWH;
    end;

    img.Left  := img.Left - (iBigWH div 2);
    img.Top   := img.Top  - (iBigWH div 2);
//    img.Left  := img.Left - (FFontHeight div 2);
//    img.Top   := img.Top  - (FFontHeight div 2);

  end
  else//缩小
  begin
    img.Width := FCellWidth;
    if FShowCaption then//显示文本
    begin
      img.Height:= FCellHeight+ FFontHeight;
    end
    else
    begin
      img.Height:= FCellHeight;
    end;
    
    //先缩放再排序对位时有效(缩小后先对位)
    img.Left  := img.Left + (iBigWH div 2);
    img.Top   := img.Top  + (iBigWH div 2);
    //}

    if FileExists(img.Hint) then
    begin
      drawImgRect( img,img.Hint,FItemCaption );
    end
    else
    begin

    end;
  end;
//  img.Repaint;

end;

// 输出限制在0..255之间 
function IntToByte(Value: Integer): Byte; overload; 
asm 
  OR   EAX, EAX 
  JNS  @@Positive 
  XOR  EAX, EAX 
  RET 

  @@Positive:
    CMP  EAX, 255 
    JBE  @@OK 
    MOV  EAX, 255 
  @@OK:
  
end; 

//把bmp按tranparent的透明度混合到dstbmp上，混合时要求两图的大小相等
procedure AlphaBlend( bmp: TBitmap; var dstbmp: TBitmap; transparent: Integer );
var
  k1, k2: extended;
  p0, p1:pbytearray;
  n, m, i: Integer;
begin
  if (bmp.Width <> dstbmp.Width) or
     (bmp.Height <> dstbmp.Height) then
    Exit;
       
  if transparent > 100 then
    transparent := 100;

  if transparent < 0 then
    transparent := 0;

  k2 := transparent / 100;
  k1 := 1 - k2;

  for m := 0 to bmp.Height - 1 do
  begin
    p0 := bmp.scanline[m];
    p1 := dstbmp.scanline[m];
    for n := 0 to bmp.Width - 1 do
    begin
      i := n * 3;
      p1[i] := IntToByte(round(p1[i] * k1 + p0[i] * k2));
      p1[i + 1] := IntToByte(round(p1[i + 1] * k1 + p0[i + 1] * k2));
      p1[i + 2] := IntToByte(round(p1[i + 2] * k1 + p0[i + 2] * k2));
    end;
  end;
  
end;
  
procedure TImageViewYM.drawImgRect( img : TImage; sPicFile : string=''; sCap : string='' );
//const
//  n = 10;
var
  toRect: TRect;
//  iDw : Integer;
  timg : TImage;
  ifw,ifh,k,m : Integer;
  n : Integer;
  Rgn : HRGN;//LongWord
  x1,y1,x2,y2 : Integer;
  dstbmp : TBitmap;
begin
  //
//  iDw := 1;//边框宽度
  img.Hint  := '';

  try
    timg := TImage.Create(nil);
    timg.AutoSize := False;
    timg.Transparent := True;
    timg.Width := FCellWidth;
    timg.Height:= FCellHeight;
    timg.Stretch:= True;//图片拉伸

    if not FileExists( sPicFile ) then
    begin
      try
       // timg.Picture.LoadFromFile( sPicFile );

      uDataModule.MyDataModule.ImageList1.GetBitmap(strtoint(sPicFile),timg.Picture.Bitmap);

        img.Hint  := sPicFile;
      except
      end;
    end
    else//图片不存在
    begin

      //----------------------------------------------
      toRect.Left := 0;
      toRect.Top := 0;
      toRect.Bottom := timg.Height;
      toRect.Right := timg.Width;
//      timg.Canvas.Pen.Color := clYellow;
//      timg.Canvas.Brush.Color := clGreen;
//      timg.Canvas.Brush.Style := bsClear;
      timg.Canvas.Brush.Style := bsSolid;//bsSolid;//bsClear;
      timg.Canvas.FillRect( toRect );
      //----------------------------------------------
      n := 5;
      if FCellWidth<30 then
      begin
        n := 2;
      end;

      if FCellWidth<=10 then
      begin
        n := 0;
      end;
      {
      x1 := n;
      y1 := n div 2;
      x2 := ClientWidth - n;
      y2 := ClientHeight - n;
      //}
      x1 := 1;
      y1 := 1;
      x2 := timg.Width-1;
      y2 := timg.Height-1;

      {建立圆角矩形区域}
      Rgn := CreateRoundRectRgn(x1, y1, x2, y2, n, n);
      {
      //填充区域
      timg.Canvas.Brush.Color := clSilver;
      timg.Canvas.Brush.Style := bsCross;
      FillRgn( timg.Canvas.Handle, Rgn, timg.Canvas.Brush.Handle );
      //}
      {绘制区域边界}
      timg.Canvas.Brush.Color := clYellow;
      timg.Canvas.Brush.Style := bsSolid;
      FrameRgn( timg.Canvas.Handle, Rgn, timg.Canvas.Brush.Handle, 1, 1);
      DeleteObject(Rgn);

    end;
//    timg.Stretch:= True;//图片拉伸

    {
    dstbmp := TBitmap.Create;
    AlphaBlend( timg.Picture.Bitmap, dstbmp, 50 );
    dstbmp.Assign( timg.Picture.Bitmap );
    dstbmp.Free;
    //}

    {
    bsSolid, bsClear, bsHorizontal, bsVertical,
    bsFDiagonal, bsBDiagonal, bsCross, bsDiagCross
    }
  
    toRect.Left := 0;
    toRect.Top := 0;
    toRect.Bottom := img.Height;
    toRect.Right := img.Width;

    img.Picture.Graphic := nil;
    img.Picture := nil;
//    img.Picture.Bitmap.TransparentColor := clBlack;

    img.Canvas.Brush.Color := clBlack;
    img.Canvas.Brush.Style := bsSolid;//bsSolid;//bsClear;
//    img.Canvas.Rectangle( toRect );
    img.Canvas.FillRect( toRect );
//    img.Canvas.Draw( 0,0,timg.Picture.Graphic );
    img.Canvas.StretchDraw( timg.ClientRect,timg.Picture.Graphic );

    if Trim(sCap)<>'' then
    begin
      img.Canvas.Font.Color := clwhite;
      img.Canvas.Font.Size  := 9;
  
      ifh := img.Canvas.TextHeight('高');
      ifw := img.Canvas.TextWidth('宽');
      //k := Length(  sCap );
      k := Length( WideString	( sCap ));
      m := img.Width div ifw;//一行可以下m个字
      if k>m then
      begin
        sCap := Copy( WideString( sCap ),1,m-1 )+'.';
      end;
      img.Canvas.TextOut( 5,timg.Height-2, sCap );
      //}
    end;

    timg.Free;

  except
  end;
  
end;

procedure TImageViewYM.pnlModMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  timg : TImage;
  pdgi : PDragImage;
begin
  if bMoving then Exit;//移动中

  GetCursorPos( pMouseDownPoint );//得到鼠标落点坐标
  //ScPoint := ScrollBox1.ScreenToClient(MyPoint);

  //鼠标落下，整体移动

//  延时后拖动单个图标
//  FTimer1.Interval:= 800;//0.5秒
//  FTimer1.Enabled := True;
//  if FTimer1.Tag<=1 then Exit;
//  FTimer1.Enabled := False;
//  FTimer1.Tag := 0;

  //拖动模式
  if FDragModel=0 then//0=界面移动,1=图标拖动
  begin
//    ReleaseCapture;
    if addFullImage( Sender ) = 1 then
    begin

    end;
    {
    if Sender.ClassType = TImage then
    begin
      iDx := X;
      iDy := Y;
      iDown := 1;

      //放大图标效果
      timg := (Sender as TImage);
      //timg.Cursor := crHourGlass;
      drawImgView(timg);

      with timg.Parent do
      begin
        if ClassType = TPanel then
        begin
          with ( timg.Parent as TPanel) do
          begin
            BringToFront;
          end;
        end;
      end;
    end;
    //}
  end
  else//1=图标拖动
  begin
    if Sender.ClassType = TImage then
    begin

      iDx := X;
      iDy := Y;

      //放大图标效果
      timg := (Sender as TImage);
      FItemIndex := timg.Tag;
            
      //timg.Cursor := crHourGlass;
      if iDragFlag<>1 then
      begin
        drawImgView(timg);
      end;

      if FItemIndex in [0..MyList.Count-1] then
      begin
        pdgi := MyList.Items[ FItemIndex ];
        FItemCaption := pdgi^.sName;
      end;

      timg.BringToFront;

      iDown := 1;
    end;
  end;

end;

procedure TImageViewYM.backMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if bMoving then Exit;//移动中

  GetCursorPos( pMouseDownPoint );//得到鼠标落点坐标
  //ScPoint := ScrollBox1.ScreenToClient(MyPoint);

  //鼠标落下，整体移动
  if addFullImage( Sender ) = 1 then
  begin

  end;

end;

procedure TImageViewYM.pnlModMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
Var
  MyPoint: TPoint;
  ScPoint: TPoint;
  timg : TImage;
//  i : Integer;
begin
  if iDown=1 then
  begin
    if Sender.ClassType = TImage then
    begin
      timg := (Sender as TImage);

      if timg<>nil then
      begin
        GetCursorPos(MyPoint);//得到鼠标坐标

        if (Abs( MyPoint.X - pMouseDownPoint.X)>2 )
          or (Abs( MyPoint.Y - pMouseDownPoint.Y )>2 ) then
        begin
          ScPoint := ScrollBox1.ScreenToClient(MyPoint);

          if iDragFlag<>1 then//图标拖动
          begin                         //让出图标扩大的距离
            timg.Left := ScPoint.X - iDx - (iBigWH div 2);
            timg.Top  := ScPoint.Y - iDy - (iBigWH div 2);
            {
            //移动其他图标
            for i := Low(pnlRec) to High(pnlRec) do
            begin
              Application.ProcessMessages;
              if not SameText( pnlRec[i].sName,timg.Name ) then
              begin
                if pnlRec[i].iH = pnlRec[timg.Tag].iH then
                begin
                  pnlRec[i].pImg.Left := pnlRec[i].pRect.Left + (ScPoint.X - ScrollBox1.ScreenToClient(pMouseDownPoint).X);
                end;
              end;              
            end;
            //}
          end
          else//整体拖动
          begin
            timg.Left := ScPoint.X-iDx;
          end;  
        end;
      end;
    end;
    //}
  end;

end;

function TImageViewYM.movePanelTo( pImage : TImage; ix,iy : Integer ) : Integer;
var
  i,idx,idy : Integer;
begin
  //
  Result := 0;
  try
    idx := (ix - pImage.Left - ScrollBox1.HorzScrollBar.Position ) div 10;
    idy := (iy - pImage.Top  - ScrollBox1.VertScrollBar.Position ) div 10;
//    pImage.BringToFront;
    for i := 1 to 10 do
    begin
      Application.ProcessMessages;
      pImage.Left := pImage.Left+ idx;
      pImage.Top := pImage.Top  + idy;
//      pImage.Repaint;
      Sleep(10);
    end;

    //ScrollBox1.VertScrollBar.Position;
    //ScrollBox1.HorzScrollBar.Position;

    pImage.Left := ix - ScrollBox1.HorzScrollBar.Position;
    pImage.Top  := iy - ScrollBox1.VertScrollBar.Position;
//    pImage.Repaint;
    Result := 1;
  except
  end;
    
end;

function copyPnlRec( var toDest: TPnlRec; var fromSource: TPnlRec ) : Integer;
begin
  //
  toDest.iH   := fromSource.iH;
  toDest.iL   := fromSource.iL;
  toDest.iChg := fromSource.iChg;
  toDest.sName:= fromSource.sName;
  toDest.pImg := fromSource.pImg;
  toDest.pRect:= fromSource.pRect;
  Result := 1;
end;  

function TImageViewYM.reArray( Sender: TObject ) : Integer;
var
  i,k : Integer;
  //iH,iW : Integer;
  sName : string;
  temRec : array of TPnlRec;
  iL,iT,iH2,iL2 : Integer;
  P : TPoint;
  bDWok : Boolean;
  timg,timg2 : TImage;
begin
//  mo.Lines.Clear;
  Result := 0;
  sName := '';

  //定位被移动的控件
  if Sender.ClassType = TImage then
  begin
    timg := (Sender as TImage);
    if timg<>nil then
    begin
      sName := timg.Name;
//      iH := timg.Height;
//      iW := timg.Width;
    end
    else
    begin
      Exit;
    end;
  end;
  //----------------------------------------------------------------------------
  bMoving := True;
  k := High(pnlRec)-Low(pnlRec)+1;
  SetLength( temRec, k );
  k := 0;
  bDWok := False;//定位成功标志

  //遍历控件队列，排序
  for i := Low(pnlRec) to High(pnlRec) do
  begin
//    Application.ProcessMessages;
    //控件排序
    timg2 := pnlRec[i].pImg;
    //if SameText( timg2.Name,timg.Name ) then
    if SameText( timg2.Name,sName ) then
    begin
      //自己本身
      {
      p.X := timg.Left;
      p.Y := timg.Top;
      //}
      p.X := timg.Left + (iBigWH div 2);
      p.Y := timg.Top  + (iBigWH div 2);

      if PtInRect( pnlRec[i].pRect,p ) then
      begin
        //本身没有移出自己的区域
        bDWok := True;
        {
        temRec[k].iH := pnlRec[i].iH;
        temRec[k].iL := pnlRec[i].iL;          
        temRec[k].sName := pnlRec[i].sName;
        temRec[k].pImg  := pnlRec[i].pImg;
//        temRec[k].pRect := pnlRec[i].pRect;
        //}
        //CopyMemory( @toDest,@fromSource,sizeof(Tst) );
        //CopyMemory( @temRec[k],@pnlRec[i],sizeof(TPnlRec) );
        copyPnlRec(temRec[k],pnlRec[i]);

        inc(k);
      end;
    end
    else//其他控件
    begin
      {
      p.X := timg.Left;
      p.Y := timg.Top;
      //}
      p.X := timg.Left + (iBigWH div 2);
      p.Y := timg.Top  + (iBigWH div 2);

      if PtInRect( timg2.BoundsRect,p ) then
      begin
        bDWok := True;
        if timg.Left < ( timg2.Left + timg2.Width div 2) then
        begin
          temRec[k].iH := -1;
          temRec[k].iL := -1;
          temRec[k].sName := timg.Name;
          temRec[k].pImg := timg;
          temRec[k].pRect := timg.BoundsRect;
          inc(k);
          {
          temRec[k].iH := pnlRec[i].iH;
          temRec[k].iL := pnlRec[i].iL;
          temRec[k].sName := pnlRec[i].sName;
          temRec[k].pImg := pnlRec[i].pImg;
          temRec[k].pRect := pnlRec[i].pRect;
          //}
          copyPnlRec(temRec[k],pnlRec[i]);
          inc(k);
        end
        else//>= 一半宽度
        begin
          {
          temRec[k].iH := pnlRec[i].iH;
          temRec[k].iL := pnlRec[i].iL;
          temRec[k].sName := pnlRec[i].sName;
          temRec[k].pImg := pnlRec[i].pImg;
          temRec[k].pRect := pnlRec[i].pRect;
          //}
          copyPnlRec(temRec[k],pnlRec[i]);
          inc(k);

          temRec[k].iH := -1;
          temRec[k].iL := -1;
          temRec[k].sName := timg.Name;
          temRec[k].pImg := timg;
          temRec[k].pRect := timg.BoundsRect;
          inc(k);
        end;
        //addMo( IntToStr(i)+' | '+ Format( '[%d,%d]', [pnlRec[i].iH,pnlRec[i].iL])+' '+pnlRec[i].sName+','+pnlRec[i].pPnl.Caption  );
        //addMo( timg.Name +' | '+ Format( '[%d,%d]', [timg.Left,timg.Top]  ) );
      end
      else//没有进入区域
      begin
        //排除被拖动的控件自身
  //      if not SameText( pnlRec[i].sName,timg.Name ) then
  //      begin
          {
          temRec[k].iH := pnlRec[i].iH;
          temRec[k].iL := pnlRec[i].iL;
          temRec[k].sName := pnlRec[i].sName;
          temRec[k].pImg := pnlRec[i].pImg;
          temRec[k].pRect := pnlRec[i].pRect;
          //}
          copyPnlRec(temRec[k],pnlRec[i]);
          inc(k);
  //      end;
      end;
    end;

  end;
  
  if bDWok then
  begin
//    addMo( 'OK ---------------' );
  end
  else//定位不成功
  begin
//    addMo( 'XX ---------------' );
    //恢复
    for i := Low(pnlRec) to High(pnlRec) do
    begin
//      Application.ProcessMessages;
      {
      temRec[i].iH := pnlRec[i].iH;
      temRec[i].iL := pnlRec[i].iL;
      temRec[i].sName := pnlRec[i].sName;
      temRec[i].pImg := pnlRec[i].pImg;
      temRec[i].pRect := pnlRec[i].pRect;
      //}
      copyPnlRec(temRec[i],pnlRec[i]);
    end;
  end;
  //}

  //重新设定行列索引
  iL := (iBigWH div 2);
  iT := (iBigWH div 2);
  iH2 := 0;
  iL2 := 0;
  for i := Low(temRec) to High(temRec) do
  begin
//    Application.ProcessMessages;
    if ((i mod FColCount)=0)
      and (i>0) then
    begin
      iL := (iBigWH div 2);
      if FShowCaption then//显示文本
      begin
        iT := iT + FCellHeight + FCRDistance + FFontHeight;
      end
      else
      begin
        iT := iT + FCellHeight + FCRDistance;
      end;

      iL2 := 0;
      Inc(iH2);
    end;

    if (temRec[i].iH <> iH2)
      or ( temRec[i].iL <> iL2 ) then
    begin
      temRec[i].iChg := 1;
      pnlRec[i].iChg := 1;
    end;

    temRec[i].iH := iH2;
    temRec[i].iL := iL2;

    pnlRec[i].iH := iH2;
    pnlRec[i].iL := iL2;
    pnlRec[i].sName := temRec[i].sName;
    pnlRec[i].pImg := temRec[i].pImg;
    
    Inc(iL2);

    //重新校对位置
    if pnlRec[i].iChg = 1 then
    begin
      if pnlRec[i].pImg<>nil then
      begin
        if FMoveAction then
        begin
          movePanelTo( pnlRec[i].pImg,iL,iT );
        end
        else
        begin
          pnlRec[i].pImg.Left := iL;
          pnlRec[i].pImg.Top  := iT;
        end;
      end;
      pnlRec[i].iChg := 0;
    end
    else//
    begin
      //处理没有移出本身区域的问题
      if SameText( pnlRec[i].sName,sName ) then
      begin
        if pnlRec[i].pImg<>nil then
        begin
          if FMoveAction then
          begin
            movePanelTo( pnlRec[i].pImg,iL,iT );
          end
          else
          begin
            pnlRec[i].pImg.Left := iL;
            pnlRec[i].pImg.Top  := iT;
          end;
        end;
        pnlRec[i].iChg := 0;
      end;
    end;

    iL := iL + FCellWidth + FCRDistance;
  end;
  ScrollBox1.Repaint;
  bMoving := False;
  Result := 1;
  
end;

procedure TImageViewYM.pnlModMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  timg : TImage;
  tcmp : TComponent;
begin
  iDx := 0;
  iDy := 0;
  iDown := 0;
  iDragFlag := 0;
  pMouseDownPoint.X := 0;
  pMouseDownPoint.Y := 0;
    
  tcmp := ScrollBox1.FindComponent('pnlFull_');
  if tcmp=nil then
  begin
      
  end
  else
  begin
    tcmp.Free;
    FDragModel := 0;
  end;
    
  if FDragModel=0 then//0=界面移动,1=图标拖动
  begin
    {
    if Sender.ClassType = TImage then
    begin
      //放大图标效果
      timg := (Sender as TImage);
      timg.Visible := False;
      timg.Free;
    end;
    //}
  end
  else//1=图标拖动
  begin
    //重新排序
    //reArray( Sender );

    if Sender.ClassType = TImage then
    begin
      //放大图标效果
      timg := (Sender as TImage);
      if iDragFlag<>1 then
      begin
        drawImgView(timg,-1);
      end;
    end;

    //重新排序
    reArray( Sender );

    try
      //判断对象是否存在
      if Assigned(FItemClick) then
        FItemClick( Sender );
        
    except
    end;
    
  end;

  FItemIndex := -1;
  FItemCaption := '';

end;

function TImageViewYM.AddItem( sName : string=''; sPic : string='' ) : Integer;
var
  pdgi : PDragImage;
begin
  //
  Result := 0;
  try
    New(pdgi);
    {
    sName : string;
    sKeyStr : string;
    sPicPathName : string;
    index : Integer;
    iNodeId : Integer;
    }
    pdgi^.sName := sName;
    pdgi^.sPicPathName := sPic;
    pdgi^.index := MyList.Count;
    
    pdgi^.sKeyStr := '';
    pdgi^.iNodeId := 0;

    MyList.Add( pdgi );
    FItemCout := MyList.Count;
    Result := MyList.Count-1;
    
  except
  end;

end;

function TImageViewYM.DeleteItem( index : Integer ) : Boolean;
var
  pdgi : PDragImage;
begin
  Result := False;
  if ( index >= 0 )            
    and ( index < MyList.Count ) then
  begin
    try
      pdgi := MyList.Items[index];
      MyList.Delete(index);
      Dispose(pdgi);

      FItemCout := MyList.Count;
      Result := True;
    except
    end;  
  end;

end;  

procedure TImageViewYM.BuildComponents( );
var
  i,iL,iT : Integer;
  iH2,iL2 : Integer;
  img : TImage;
  pdgi : PDragImage;
begin
  //互换，前后移换，行列移换
  ScrollBox1.Visible := not FHCTS;             
  ClearComponents();

  SetLength( pnlRec, MyList.Count );
//  SetLength( pnlRec, 20 );
  iL := (iBigWH div 2);
  iT := (iBigWH div 2);
  iH2 := 0;
  iL2 := 0;
  for i := 0 to MyList.Count-1 do
//  for i := 0 to 20-1 do
  begin
    Application.ProcessMessages;
    if ((i mod FColCount)=0)
      and (i>0) then
    begin
      iL := (iBigWH div 2);

      if FShowCaption then//显示文本
      begin
        iT := iT + FCellHeight + FCRDistance + FFontHeight;
      end
      else
      begin
        iT := iT + FCellHeight + FCRDistance;
      end;

      iL2 := 0;
      Inc(iH2);
    end;

    img := TImage.Create(ScrollBox1);
    img.Parent  := ScrollBox1;
    img.Name    := 'img_'+ IntToStr( ScrollBox1.ComponentCount );
    img.Hint    := '';
    img.Stretch := True;//图片拉伸
    img.Transparent := True;              
    img.Parent.DoubleBuffered := FDoubleBuf;
//    img.IncrementalDisplay := True;
//    img.Align := alClient;
    img.Tag     := i;
    img.Left    := iL;
    img.Top     := iT;
    img.Width   := FCellWidth;

    if FShowCaption then//显示文本
    begin
      img.Height  := FCellHeight + FFontHeight;
    end
    else
    begin
      img.Height  := FCellHeight;
    end;
    img.Cursor  := crHandPoint;

    pdgi := MyList.Items[i];
    drawImgRect( img, pdgi^.sPicPathName,pdgi^.sName );

    img.OnMouseDown := pnlModMouseDown;
    img.OnMouseMove := pnlModMouseMove;
    img.OnMouseUp   := pnlModMouseUp;
//    img.OnClick     := pnlMod.OnClick;
//    img.OnDblClick  := pnlMod.OnDblClick;

    pnlRec[i].iH := iH2;
    pnlRec[i].iL := iL2;
    pnlRec[i].sName := img.Name;
    pnlRec[i].pImg := img;
    pnlRec[i].pRect:= img.BoundsRect;
                                        
    iL := iL + FCellWidth +FCRDistance;
    Inc(iL2);

  end;

  ScrollBox1.Repaint;
  ScrollBox1.Visible := True;
  
end;

procedure TImageViewYM.FTimer1Timer(Sender: TObject);
begin
  //
  FTimer1.Tag := FTimer1.Tag+1;
  
end;

procedure CaptureScreenRect( var Fullscreen : TBitmap; fromRec : Trect; parHD : HWND=0 );
var
  tmpCanvas : TCanvas;
  screenDC:HDC;
  rect1 : Trect;
  toRec : Trect;
begin

{
  rect1.Left:= Form1.Left;// 0;
  rect1.Top := Form1.Top;//0;
  rect1.Right := Form1.Left+Form1.Width;// Screen.Width;
  rect1.Bottom:= Form1.Top +Form1.Height;//Screen.Height;
  //}

  toRec.Left  := 0;
  toRec.Top   := 0;
  toRec.Right := fromRec.Right  - fromRec.Left;
  toRec.Bottom:= fromRec.Bottom - fromRec.Top;
  //}
                                       
  tmpCanvas  := TCanvas.Create;
  ScreenDC  := GetDC(parHD);//(0);
  //ScreenDC  := GetDC(0);
  tmpCanvas.Handle := ScreenDc;
  FullScreen.Canvas.CopyRect( toRec, tmpCanvas, fromRec );
  tmpCanvas.Free;
  
  ReleaseDC (0, screenDC);           //释放DC
  //}
  
end;

function TImageViewYM.addFullImage( Sender: TObject ) : Integer;
var
  tpnl: TPanel;
  img : TImage;
  BFullScreen : TBitmap;

  MyPoint: TPoint;
  ScPoint: TPoint;
  tcmp : TComponent;
  Button: TMouseButton;
  Shift: TShiftState;
  toRec : Trect;
begin
  Result := 0;
  ReleaseCapture;

  BFullScreen := TBitmap.Create;
  BFullScreen.Width := ScrollBox1.Width;
  BFullscreen.Height:= ScrollBox1.Height;

  if FMoveWithDesk then
  begin
    tcmp := ScrollBox1.FindComponent('imgBack_');
    if tcmp<>nil then
    begin
      if tcmp.ClassType = TImage then
      begin
        img := (tcmp as TImage);
        img.Visible := False;//暂时隐藏背景
        ScrollBox1.Repaint;
      end;
    end;
  end;
  //}

//  CaptureScreenRect( BFullscreen, ScrollBox1.BoundsRect, 0 );//捕获桌面
  CaptureScreenRect( BFullscreen, ScrollBox1.BoundsRect, ScrollBox1.Handle );

  if FMoveWithDesk then
    if img<>nil then
      img.Visible := True;//显示背景

  tcmp := ScrollBox1.FindComponent('pnlFull_');
  if tcmp=nil then
  begin
    tpnl := TPanel.Create( ScrollBox1 );
    tpnl.Parent := ScrollBox1;
    tpnl.Name   := 'pnlFull_';
    tpnl.Caption:= '';
  end
  else
  begin
    tpnl := tcmp as TPanel;
  end;

  tpnl.Left   := 0;
  tpnl.Top    := 0;
  tpnl.Width  := ScrollBox1.Width*2;
  tpnl.Height := ScrollBox1.Height;
  tpnl.Cursor := crHandPoint;
  tpnl.ParentColor := True;
  tpnl.BevelOuter := bvNone;
  tpnl.Tag  := -1;
  tpnl.Hint := '';
  //}

  tcmp := ScrollBox1.FindComponent('imgFull_');
  if tcmp=nil then
  begin
    img := TImage.Create(tpnl);
    img.Parent := tpnl;
  end
  else
  begin
    img := tcmp as TImage;
  end;
  
//img.Stretch:= True;//图片拉伸
  img.Transparent := True;
  img.Tag := -1;
  img.Left:= 0;
  img.Top := 0;
  img.Width := tpnl.Width;
  img.Height:= tpnl.Height;
//img.Align := alClient;

  //img.Parent.DoubleBuffered := FDoubleBuf;
  if img.Parent.DoubleBuffered <> FDoubleBuf then
  begin
    img.Parent.DoubleBuffered := FDoubleBuf;
  end;

  tpnl.BringToFront;
  //img.Picture.Bitmap := BFullScreen;
  
  toRec.Left  := 0;
  toRec.Top   := 0;
  toRec.Right := tpnl.Width;//img.Width;
  toRec.Bottom:= tpnl.Height;//img.Height;
  img.Canvas.CopyRect( toRec, BFullScreen.Canvas, img.BoundsRect );
  //}

  //绘制边界外图像
  img.Canvas.Draw( ScrollBox1.Width,0,BFullScreen );

  //img.Visible := True;
  //tpnl.Visible:= True;

  tpnl.OnMouseDown := pnlModMouseDown;
  tpnl.OnMouseMove := pnlModMouseMove;
  tpnl.OnMouseUp   := pnlModMouseUp;

  img.OnMouseDown := pnlModMouseDown;
  img.OnMouseMove := pnlModMouseMove;
  img.OnMouseUp   := pnlModMouseUp;

  bfullscreen.Free;
  
  GetCursorPos(MyPoint);//得到鼠标坐标
  ScPoint := img.ScreenToClient(MyPoint);
  {
  iDx := ScPoint.X;
  iDy := ScPoint.Y;
  iDown := 1;
  //}
  iDragFlag := 1;
  FDragModel := 1;
  pnlModMouseDown( img,Button,Shift,ScPoint.X,ScPoint.Y );

end;

procedure TImageViewYM.SubItemClick( Sender: TObject; var index : Integer; var CTest : string );
var
  pdgi : PDragImage;
  k : Integer;
begin
  //
  CTest := '';
  index := FItemIndex;
  k := MyList.Count-1;
  if index in [0..k] then
  begin
    pdgi := MyList.Items[ k ];
    CTest := pdgi^.sName;
  end;
  //}

end;

procedure TImageViewYM.WMLButtonUp(var msg:TWMLButtonUp);
begin
  inherited;
  //控件父类接收事件
  //ClearComponents();
end;

//procedure TImageViewYM.Click(Sender: TObject);
//begin
//  inherited Click;
//  //
//  ClearItem();
//end;

//procedure TImageViewYM.KeyDown(var Key: Word; Shift: TShiftState);
//begin
//  //
//  ClearComponents();
//end;

procedure TImageViewYM.subClick( Sender: TObject );
var
  pdgi : PDragImage;
  k,index : Integer;
begin
  //
  index := FItemIndex;
  k := MyList.Count-1;
  if index in [0..k] then
  begin
    pdgi := MyList.Items[ k ];
    FItemCaption := pdgi^.sName;
  end;
  //}

end;

end.
