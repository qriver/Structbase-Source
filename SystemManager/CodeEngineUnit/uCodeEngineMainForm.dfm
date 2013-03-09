object codeEngineMainForm: TcodeEngineMainForm
  Left = 0
  Top = 0
  Caption = #20195#30721#29983#25104
  ClientHeight = 266
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object rgDbChoose: TRadioGroup
    Left = 27
    Top = 8
    Width = 350
    Height = 51
    Caption = #25968#25454#24211#36830#25509#35774#32622
    TabOrder = 0
  end
  object btnLinkDB: TButton
    Left = 115
    Top = 23
    Width = 120
    Height = 21
    Caption = #36830#25509#25968#25454#24211'(&L)'
    TabOrder = 1
  end
  object btnDBLinkSet: TButton
    Left = 257
    Top = 23
    Width = 120
    Height = 21
    Caption = #25968#25454#24211#36830#25509#35774#32622'(&K)'
    TabOrder = 2
    OnClick = btnDBLinkSetClick
  end
  object con1: TADOConnection
    Left = 63
    Top = 105
  end
  object qry1: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 99
    Top = 105
  end
end
