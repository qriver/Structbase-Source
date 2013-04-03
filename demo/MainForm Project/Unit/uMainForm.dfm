object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 457
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 668
    Height = 457
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    ExplicitLeft = 152
    ExplicitTop = 48
    ExplicitWidth = 153
    ExplicitHeight = 137
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = #24212#29992#36229#24066
      ExplicitLeft = -15
      ExplicitWidth = 149
      ExplicitHeight = 114
      object RzPageControl2: TRzPageControl
        Left = 0
        Top = 0
        Width = 664
        Height = 434
        ActivePage = TabSheet4
        Align = alClient
        BoldCurrentTab = True
        TabIndex = 3
        TabOrder = 0
        TabOrientation = toLeft
        TabSequence = tsReverse
        TabStyle = tsRoundCorners
        ExplicitLeft = 152
        ExplicitTop = 48
        ExplicitWidth = 153
        ExplicitHeight = 137
        FixedDimension = 69
        object RzTabSheet1: TRzTabSheet
          Caption = #31038#21306#35686#21153
          ExplicitLeft = 1
          ExplicitTop = 20
          ExplicitWidth = 660
          ExplicitHeight = 411
        end
        object TabSheet2: TRzTabSheet
          Caption = #35686#29992#22320#29702
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object TabSheet3: TRzTabSheet
          Caption = 'TabSheet3'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object TabSheet4: TRzTabSheet
          Caption = 'TabSheet4'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
      end
    end
  end
end
