object ChildMainForm: TChildMainForm
  Left = 0
  Top = 0
  Caption = #32593#26684#24212#29992
  ClientHeight = 468
  ClientWidth = 766
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
  object RzGroupBar1: TRzGroupBar
    Left = 0
    Top = 0
    Width = 185
    Height = 468
    GradientColorStyle = gcsCustom
    GradientColorStart = clHighlight
    GradientColorStop = clGradientInactiveCaption
    FlatColor = clBlue
    GroupBorderSize = 8
    Color = clGradientActiveCaption
    ParentColor = False
    TabOrder = 0
    object RzGroup1: TRzGroup
      Color = clInactiveCaptionText
      ColorDefault = False
      Items = <
        item
          Caption = #32593#26684#25968#25454#24405#20837
          OnClick = RzGroup1Items0Click
        end
        item
          Caption = #32593#26684#27665#35686#30331#35760
        end>
      Opened = True
      OpenedHeight = 67
      DividerVisible = False
      Caption = #32593#26684#27665#35686
      ParentColor = False
      OnMouseMove = over
    end
    object RzGroup2: TRzGroup
      Color = clInactiveCaptionText
      ColorDefault = False
      Items = <
        item
          Caption = #27966#20986#25152#30003#25209
        end>
      Opened = True
      OpenedHeight = 47
      DividerVisible = False
      Caption = #27966#20986#25152#23457#25209
      ParentColor = False
      OnMouseMove = over
    end
    object RzGroup3: TRzGroup
      Color = clInactiveCaptionText
      ColorDefault = False
      Items = <
        item
          Caption = #20998#23616#30003#25209
        end>
      Opened = True
      OpenedHeight = 47
      DividerVisible = False
      Caption = #20998#23616#23457#25209
      ParentColor = False
      OnMouseMove = over
    end
    object RzGroup4: TRzGroup
      Color = clInactiveCaptionText
      ColorDefault = False
      Items = <
        item
          Caption = #24066#23616#26816#26597#30417#30563
        end>
      Opened = True
      OpenedHeight = 47
      DividerVisible = False
      Caption = #24066#23616#26816#26597#30417#30563
      ParentColor = False
      OnMouseMove = over
    end
    object RzGroup5: TRzGroup
      Color = clInactiveCaptionText
      ColorDefault = False
      Items = <
        item
          Caption = #25968#25454#36164#28304#31867#21035#32500#25252
          OnClick = RzGroup5Items0Click
        end>
      Opened = True
      OpenedHeight = 47
      DividerVisible = False
      Caption = #25968#25454#32500#25252
      ParentColor = False
    end
  end
  object Panel1: TPanel
    Left = 185
    Top = 0
    Width = 581
    Height = 468
    Align = alClient
    TabOrder = 1
    object rzpgcntrl1: TRzPageControl
      Left = 1
      Top = 1
      Width = 579
      Height = 466
      Align = alClient
      Color = clGradientInactiveCaption
      ParentColor = False
      ShowCloseButtonOnActiveTab = True
      TabOrder = 0
      TabStyle = tsDoubleSlant
      OnClose = rzpgcntrl1Close
      FixedDimension = 0
    end
  end
end
