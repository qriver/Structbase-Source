object frmUpLoadBrower: TfrmUpLoadBrower
  Left = 386
  Top = 349
  Caption = 'frmUpLoadBrower'
  ClientHeight = 362
  ClientWidth = 746
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 264
    Top = 21
    Width = 209
    Height = 36
    AutoSize = False
    Caption = #31038#20250#36164#28304#35814#32454#20449#24687
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #21326#25991#26032#39759
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnl1: TPanel
    Left = 36
    Top = 72
    Width = 661
    Height = 257
    TabOrder = 0
    object txtlbl2: TStaticText
      Left = 16
      Top = 47
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #36164#28304#31867#21035
      TabOrder = 0
    end
    object edtRESOURCE_ID: TMaskEdit
      Left = 116
      Top = 47
      Width = 212
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object edtPOLICE_ID: TMaskEdit
      Left = 116
      Top = 119
      Width = 212
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object txt1: TStaticText
      Left = 16
      Top = 119
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #19978#20256#35686#21592
      TabOrder = 3
    end
    object txt2: TStaticText
      Left = 327
      Top = 119
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #19978#20256#21333#20301
      TabOrder = 4
    end
    object edtDWBM: TMaskEdit
      Left = 427
      Top = 119
      Width = 212
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
    end
    object edtFROM_DW: TMaskEdit
      Left = 427
      Top = 143
      Width = 212
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
    end
    object txt4: TStaticText
      Left = 327
      Top = 143
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #25968#25454#26469#28304
      TabOrder = 7
    end
    object txt3: TStaticText
      Left = 16
      Top = 192
      Width = 101
      Height = 28
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #22791#27880#35828#26126
      TabOrder = 8
    end
    object edtDESCRIPTION: TMaskEdit
      Left = 116
      Top = 192
      Width = 523
      Height = 27
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 9
    end
    object txt5: TStaticText
      Left = 16
      Top = 143
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #19978#20256#26102#38388
      TabOrder = 10
    end
    object edtUPLOAD_TIME: TMaskEdit
      Left = 116
      Top = 143
      Width = 212
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 11
    end
    object txt6: TStaticText
      Left = 327
      Top = 23
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #23457#26680#29366#24577
      TabOrder = 12
    end
    object edtSHZT: TMaskEdit
      Left = 427
      Top = 23
      Width = 212
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 13
    end
    object txt7: TStaticText
      Left = 327
      Top = 47
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #23457#26680#26102#38388
      TabOrder = 14
    end
    object edtSHSJ: TMaskEdit
      Left = 427
      Top = 47
      Width = 212
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 15
    end
    object txt8: TStaticText
      Left = 327
      Top = 71
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #23457#26680#20154#21592
      TabOrder = 16
    end
    object edtSH_RYXM: TMaskEdit
      Left = 427
      Top = 71
      Width = 212
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 17
    end
    object txt9: TStaticText
      Left = 327
      Top = 95
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #23457#26680#35828#26126#20449#24687
      TabOrder = 18
    end
    object edtSHSM: TMaskEdit
      Left = 427
      Top = 95
      Width = 212
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 19
    end
    object edtTitle: TMaskEdit
      Left = 116
      Top = 71
      Width = 212
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 20
    end
    object StaticText14: TStaticText
      Left = 16
      Top = 71
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #36164#28304#26631#39064
      TabOrder = 21
    end
    object edtLXDH: TMaskEdit
      Left = 116
      Top = 167
      Width = 212
      Height = 26
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 22
    end
    object StaticText15: TStaticText
      Left = 16
      Top = 167
      Width = 101
      Height = 26
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #32852#31995#30005#35805
      TabOrder = 23
    end
    object StaticText16: TStaticText
      Left = 16
      Top = 23
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #35760#24405#32534#21495
      TabOrder = 24
    end
    object edtLSH: TMaskEdit
      Left = 116
      Top = 23
      Width = 212
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 25
    end
    object txt10: TStaticText
      Left = 16
      Top = 95
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #25968#25454#29366#24577
      TabOrder = 26
    end
    object edtSJZT: TMaskEdit
      Left = 116
      Top = 95
      Width = 212
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 27
    end
    object StaticText1: TStaticText
      Left = 327
      Top = 167
      Width = 101
      Height = 26
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #35760#24405#26465#25968
      TabOrder = 28
    end
    object edtJLTS: TMaskEdit
      Left = 427
      Top = 167
      Width = 212
      Height = 26
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 29
    end
  end
end
