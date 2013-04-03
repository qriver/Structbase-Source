object ChildMainForm: TChildMainForm
  Left = 0
  Top = 0
  Caption = #23376#24212#29992
  ClientHeight = 468
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RzGroupBar1: TRzGroupBar
    Left = 0
    Top = 0
    Width = 241
    Height = 468
    GradientColorStyle = gcsCustom
    GradientColorStart = clHighlight
    GradientColorStop = clGradientInactiveCaption
    FlatColor = clBlue
    GroupBorderSize = 8
    Color = clGradientActiveCaption
    ParentColor = False
    TabOrder = 0
    object grpVisualStyles: TRzGroup
      CaptionColorStop = 11855600
      Color = clInactiveCaptionText
      ColorDefault = False
      Items = <
        item
          Caption = 'Classic'
          ImageIndex = 0
          Tag = 1
        end
        item
          Caption = 'Win XP'
          ImageIndex = 1
          Tag = 2
        end
        item
          Caption = 'Gradient'
          ImageIndex = 2
        end
        item
          Caption = 'System'
          ImageIndex = 3
          IndentLevel = 1
          Tag = 3
        end
        item
          Caption = 'MSOffice'
          ImageIndex = 4
          IndentLevel = 1
          Tag = 4
        end
        item
          Caption = 'Custom'
          ImageIndex = 5
          IndentLevel = 1
          Tag = 5
        end>
      Opened = True
      OpenedHeight = 147
      DividerColor = clGradientInactiveCaption
      DividerVisible = False
      ShowItemSelection = True
      IgnoreSelectedItemClick = False
      Caption = 'Visual Styles'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      OnMouseMove = ove
    end
    object RzGroup1: TRzGroup
      Color = clInactiveCaptionText
      ColorDefault = False
      Items = <>
      Opened = True
      DividerVisible = False
      Caption = 'RzGroup1'
      ParentColor = False
    end
  end
  object Panel1: TPanel
    Left = 241
    Top = 0
    Width = 525
    Height = 468
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 1
    ExplicitLeft = 185
    ExplicitWidth = 581
  end
end
