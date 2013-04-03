object frmDataRes: TfrmDataRes
  Left = 278
  Top = 334
  Caption = #25968#25454#36164#28304#31649#29702
  ClientHeight = 607
  ClientWidth = 875
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inline TreeViewFrame1: TTreeViewFrame
    Left = 8
    Top = 8
    Width = 321
    Height = 561
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 321
    ExplicitHeight = 561
    inherited tvResource: TTreeView
      Width = 233
      PopupMenu = pm1
      ExplicitWidth = 233
    end
    inherited ilMain: TImageList
      Left = 148
      Top = 340
    end
  end
  object pnl2: TPanel
    Left = 263
    Top = 16
    Width = 593
    Height = 545
    TabOrder = 1
  end
  object pm1: TPopupMenu
    Left = 144
    Top = 232
    object menuDraw: TMenuItem
      Caption = #21047#26032
      OnClick = menuDrawClick
    end
    object N1: TMenuItem
      Caption = '-------'
    end
    object addNew: TMenuItem
      Caption = #26032#22686
      OnClick = addNewClick
    end
    object mnuEdit: TMenuItem
      Caption = #32534#36753
      OnClick = mnuEditClick
    end
    object N2: TMenuItem
      Caption = '-------'
    end
    object clear: TMenuItem
      Caption = #25968#25454#26631#20934
    end
    object defineResource: TMenuItem
      Caption = #23383#27573#23450#20041
      OnClick = defineResourceClick
    end
  end
end
