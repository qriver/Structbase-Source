object frmDicManager: TfrmDicManager
  Left = 260
  Top = 183
  AutoSize = True
  Caption = #25968#25454#23383#20856#31649#29702
  ClientHeight = 505
  ClientWidth = 761
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 761
    Height = 505
    Caption = 'pnl1'
    TabOrder = 0
    object lbl1: TLabel
      Left = 120
      Top = 472
      Width = 625
      Height = 20
      AutoSize = False
      Caption = 'lbl1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgrd1: TDBGrid
      Left = 8
      Top = 8
      Width = 737
      Height = 457
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DicId'
          Title.Caption = #23383#20856#20195#30721
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dicChineseName'
          Title.Caption = #23383#20856#35828#26126
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DicFileName'
          Title.Caption = #23383#20856#25991#20214
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dicSourceTable'
          Title.Caption = #28304#34920
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AppId'
          Title.Caption = #24212#29992#31243#24207'ID'
          Visible = True
        end>
    end
    object btn1: TBitBtn
      Left = 8
      Top = 471
      Width = 89
      Height = 25
      Caption = #29983#25104#23383#20856#25991#20214
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btn1Click
    end
  end
  object ds1: TDataSource
    Left = 24
    Top = 80
  end
end
