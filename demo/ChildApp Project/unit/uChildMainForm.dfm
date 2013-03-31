object ChildMainForm: TChildMainForm
  Left = 0
  Top = 0
  Caption = #23376#24212#29992
  ClientHeight = 423
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
    Width = 185
    Height = 423
    GradientColorStyle = gcsMSOffice
    GradientColorStart = 9229030
    GradientColorStop = 5607865
    GroupBorderSize = 8
    Color = clBtnShadow
    ParentColor = False
    TabOrder = 0
    object grpVisualStyles: TRzGroup
      CaptionColorStop = 11855600
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
      Items = <>
      Opened = True
      DividerVisible = False
      Caption = 'RzGroup1'
      ParentColor = False
    end
  end
  object Panel1: TPanel
    Left = 185
    Top = 0
    Width = 581
    Height = 423
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 1
    ExplicitLeft = 248
    ExplicitTop = 152
    ExplicitWidth = 129
    ExplicitHeight = 97
  end
end
