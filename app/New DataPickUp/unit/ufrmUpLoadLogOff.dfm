object frmUpLoadLogOff: TfrmUpLoadLogOff
  Left = 440
  Top = 347
  Width = 509
  Height = 385
  Caption = 'frmUpLoadLogOff'
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
  object pnl1: TPanel
    Left = 16
    Top = 8
    Width = 465
    Height = 321
    TabOrder = 0
    object txtlbl2: TStaticText
      Left = 16
      Top = 18
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
      Top = 18
      Width = 325
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object edtPOLICE_ID: TMaskEdit
      Left = 116
      Top = 42
      Width = 325
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object txt1: TStaticText
      Left = 16
      Top = 42
      Width = 101
      Height = 31
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #19978#20256#35686#21592
      TabOrder = 3
    end
    object txt2: TStaticText
      Left = 16
      Top = 66
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #19978#20256#21333#20301
      TabOrder = 4
    end
    object edtDWBM: TMaskEdit
      Left = 116
      Top = 66
      Width = 325
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
    end
    object edtFROM_DW: TMaskEdit
      Left = 116
      Top = 114
      Width = 325
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
    end
    object txt4: TStaticText
      Left = 16
      Top = 114
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #25968#25454#26469#28304#21333#20301
      TabOrder = 7
    end
    object txt3: TStaticText
      Left = 16
      Top = 138
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #22791#27880#35828#26126
      TabOrder = 8
    end
    object edtDESCRIPTION: TMaskEdit
      Left = 116
      Top = 138
      Width = 325
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 9
    end
    object txt5: TStaticText
      Left = 16
      Top = 90
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
      Top = 90
      Width = 325
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 11
    end
    object txt6: TStaticText
      Left = 16
      Top = 162
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #23457#26680#29366#24577
      TabOrder = 12
    end
    object edtSHZT: TMaskEdit
      Left = 116
      Top = 162
      Width = 325
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 13
    end
    object txt7: TStaticText
      Left = 16
      Top = 186
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #23457#26680#26102#38388
      TabOrder = 14
    end
    object edtSHSJ: TMaskEdit
      Left = 116
      Top = 186
      Width = 325
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 15
    end
    object txt8: TStaticText
      Left = 16
      Top = 210
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #23457#26680#20154#21592
      TabOrder = 16
    end
    object edtSH_RYXM: TMaskEdit
      Left = 116
      Top = 210
      Width = 325
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 17
    end
    object txt9: TStaticText
      Left = 16
      Top = 234
      Width = 101
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #23457#26680#35828#26126#20449#24687
      TabOrder = 18
    end
    object edtSHSM: TMaskEdit
      Left = 116
      Top = 234
      Width = 325
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 19
    end
    object btnLogOff: TBitBtn
      Left = 191
      Top = 280
      Width = 75
      Height = 25
      Caption = #27880#38144
      ModalResult = 4
      TabOrder = 20
      OnClick = btnLogOffClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000A40E0000A40E00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E5005A1E1E00783C3C0096646400C8969600FFC8C800465F
        82005591B9006EB9D7008CD2E600B4E6F000D8E9EC0099A8AC00646F7100E2EF
        F100C56A31000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000EEEEEEEEEEEE
        EEEEEEEEEEEEEE820982EEEEEEEEEEEEEEEEEEEEEEEEEEAC81ACEE5E5E5E5E5E
        5E5E5E5E5E5E82090909EE8181818181818181818181AC818181EE5ED7D7D7D7
        D7D7D7D7D7DF09090982EE81D7D7D7D7D7D7D7D7D7DF818181ACEE5ED7E3E3E3
        E3E35E5E5E09090982EEEE81D7E3E3E3E3E3DFDFDF818181ACEEEE5ED7D7D7D7
        E35EB3B3D7880982EEEEEE81D7D7D7D7E381E3E3D7E381ACEEEEEE5ED7E3E3E3
        89B3B3B3B3D75EEEEEEEEE81D7E3E3E381E3E3E3E3D756EEEEEEEE5ED7D7D7D7
        89B3D7B3B3B35EEEEEEEEE81D7D7D7D781E3D7E3E3E356EEEEEEEE5ED7E3E3E3
        89B3D7D7B3B35EEEEEEEEE81D7E3E3E381E3D7D7E3E356EEEEEEEE5ED7D7D7D7
        D789B3B3B35E5EEEEEEEEE81D7D7D7D7D781E3E3E381DFEEEEEEEE5ED7E3E3E3
        E3E3898989E35EEEEEEEEE81D7E3E3E3E3E3818181E381EEEEEEEE5ED7D7D7D7
        D7D7D7D7D7D75EEEEEEEEE81D7D7D7D7D7D7D7D7D7D781EEEEEEEE5ED7E3E3E3
        E3E3D75E5E5E5EEEEEEEEE81D7E3E3E3E3E3D781818181EEEEEEEE5ED7D7D7D7
        D7D7D75EE35EEEEEEEEEEE81D7D7D7D7D7D7D781E381EEEEEEEEEE5ED7D7D7D7
        D7D7D75E5EEEEEEEEEEEEE81D7D7D7D7D7D7D78181EEEEEEEEEEEE5E5E5E5E5E
        5E5E5E5EEEEEEEEEEEEEEE818181818181818181EEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
      NumGlyphs = 2
    end
  end
end
