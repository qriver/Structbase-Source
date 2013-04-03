object ResourceForm: TResourceForm
  Left = 476
  Top = 316
  Caption = #25968#25454#36164#28304
  ClientHeight = 521
  ClientWidth = 592
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
  object pgc1: TPageControl
    Left = 8
    Top = 8
    Width = 569
    Height = 441
    ActivePage = ts1
    TabOrder = 0
    object ts1: TTabSheet
      Caption = #25968#25454#36164#28304#32534#36753
      object pnl3: TPanel
        Left = 3
        Top = 16
        Width = 542
        Height = 385
        Caption = 'pnl1'
        TabOrder = 0
        object txt6: TStaticText
          Left = 8
          Top = 10
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #36164#28304#32534#21495
          TabOrder = 0
        end
        object txtlbl2: TStaticText
          Left = 8
          Top = 34
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #36164#28304#21517#31216
          TabOrder = 1
        end
        object edtResource_name: TMaskEdit
          Left = 108
          Top = 34
          Width = 425
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
        end
        object txtlbl3: TStaticText
          Left = 8
          Top = 106
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #19978#32423#36164#28304
          TabOrder = 3
        end
        object edtParent_id: TMaskEdit
          Left = 108
          Top = 106
          Width = 425
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 4
        end
        object edtResource_id: TMaskEdit
          Left = 108
          Top = 10
          Width = 425
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 5
        end
        object txt1: TStaticText
          Left = 8
          Top = 58
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #36164#28304#34920#21517
          TabOrder = 6
        end
        object edtRESOURCE_ENGNAME: TMaskEdit
          Left = 108
          Top = 58
          Width = 425
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 7
        end
        object edtGLDW: TMaskEdit
          Left = 108
          Top = 82
          Width = 425
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 8
        end
        object StaticText1: TStaticText
          Left = 8
          Top = 82
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #20027#31649#21333#20301
          TabOrder = 9
        end
        object StaticText2: TStaticText
          Left = 8
          Top = 130
          Width = 101
          Height = 210
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #24405#20837#27169#26495
          TabOrder = 10
        end
        object memo1: TMemo
          Left = 108
          Top = 130
          Width = 425
          Height = 210
          Lines.Strings = (
            'memo1')
          TabOrder = 11
        end
        object edtFORMATSTR: TMaskEdit
          Left = 84
          Top = 346
          Width = 425
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 12
          Visible = False
        end
      end
      object btnSave: TBitBtn
        Left = 461
        Top = 372
        Width = 75
        Height = 25
        Caption = #20445#23384
        DoubleBuffered = True
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000610B0000610B00000001000000000000000000003300
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
          EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
          EEEE09090909090909EEEEEEEEEEEEEEEEEE81818181818181EEEEEEEEEEEEEE
          EEEE095E5E5E5E5E09EEEEEEEEEEEEEEEEEE81ACACACACAC81EEEEEEEEEEEEEE
          EEEE095E5E5E5E5E09EEEEEEEEEEEEEEEEEE81ACACACACAC81EEEEEEEEA37878
          7878787878785E5E09EEEEEEEE818181818181818181ACAC81EEEEEEEEA3D5D5
          D5D5D5D5D5785E5E09EEEEEEEE81EEEEEEEEEEEEEE81ACAC81EEEEEEEEA3D5D5
          D5D5D5D5D5785E5E09EEEEEEEE81EEEEEEEEEEEEEE81ACAC81EEEEEEEEA3D5D5
          D5D5D5D5D578090909EEEEEEEE81EEEEEEEEEEEEEE81818181EE090909A3D5D5
          D5D5D5D5D578EEEEEEEE81818181EEEEEEEEEEEEEE81EEEEEEEE095E5EA3D5D5
          D5D5D5D5D578EEEEEEEE81ACAC81EEEEEEEEEEEEEE81EEEEEEEE095E5EA3D5D5
          D5D5D5D5D578EEEEEEEE81ACAC81EEEEEEEEEEEEEE81EEEEEEEE095E5EA3D5D5
          D5D5D5D5D578EEEEEEEE81ACAC81EEEEEEEEEEEEEE81EEEEEEEE095E5EA3A3A3
          A3A3A3A3A3A3EEEEEEEE81ACAC818181818181818181EEEEEEEE095E5E5E5E5E
          09EEEEEEEEEEEEEEEEEE81ACACACACAC81EEEEEEEEEEEEEEEEEE090909090909
          09EEEEEEEEEEEEEEEEEE81818181818181EEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
          EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
        ModalResult = 1
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = btnSaveClick
      end
    end
  end
end
