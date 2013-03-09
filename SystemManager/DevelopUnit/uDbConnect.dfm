object DbConnectForm: TDbConnectForm
  Left = 0
  Top = 0
  Caption = #25968#25454#24211#36830#25509
  ClientHeight = 266
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rgDbChoose: TRadioGroup
    Left = 35
    Top = 32
    Width = 350
    Height = 113
    Caption = #25968#25454#24211#36830#25509#35774#32622
    TabOrder = 0
  end
  object btnLinkDB: TButton
    Left = 67
    Top = 87
    Width = 120
    Height = 21
    Caption = #36830#25509#25968#25454#24211'(&L)'
    TabOrder = 1
    OnClick = btnLinkDBClick
  end
  object btnDBLinkSet: TButton
    Left = 217
    Top = 87
    Width = 120
    Height = 21
    Caption = #25968#25454#24211#36830#25509#35774#32622'(&K)'
    TabOrder = 2
    OnClick = btnDBLinkSetClick
  end
end
