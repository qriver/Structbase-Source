object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #24212#29992#36229#24066
  ClientHeight = 475
  ClientWidth = 955
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 955
    Height = 475
    ActivePage = TabSheet1
    Align = alClient
    ShowCloseButtonOnActiveTab = True
    TabIndex = 0
    TabOrder = 0
    TabStyle = tsCutCorner
    OnClose = RzPageControl1Close
    FixedDimension = 20
    object TabSheet1: TRzTabSheet
      Caption = #20027#30028#38754
      object RzPageControl2: TRzPageControl
        Left = 0
        Top = 0
        Width = 951
        Height = 451
        ActivePage = TabSheet2
        ActivePageDefault = TabSheet2
        Align = alClient
        BackgroundColor = clWhite
        BoldCurrentTab = True
        Color = 16119543
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        FlatColor = 10263441
        ParentBackgroundColor = False
        ParentColor = False
        ParentFont = False
        TabOverlap = 1
        TabColors.HighlightBar = 1350640
        TabIndex = 0
        TabOrder = 0
        TabOrientation = toRight
        TabStyle = tsCutCorner
        Transparent = True
        OnChange = RzPageControl2Change
        FixedDimension = 79
        object TabSheet2: TRzTabSheet
          Color = 16119543
          Caption = #31038#21306#32593#26684
        end
        object TabSheet3: TRzTabSheet
          Color = 16119543
          Caption = 'PGIS'
        end
        object TabSheet4: TRzTabSheet
          Color = 16119543
          Caption = #31995#32479#31649#29702
        end
        object TabSheet5: TRzTabSheet
          Color = 16119543
          Caption = #20854#23427#24212#29992
        end
      end
    end
  end
end
