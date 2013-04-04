object frmDJCheck: TfrmDJCheck
  Left = 498
  Top = 210
  Caption = 'frmDJCheck'
  ClientHeight = 671
  ClientWidth = 694
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 264
    Top = 24
    Width = 209
    Height = 36
    AutoSize = False
    Caption = #32593#26684#31649#25511#23457#25209
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RzPageControl1: TRzPageControl
    Left = 8
    Top = 74
    Width = 673
    Height = 513
    ActivePage = TabSheet1
    UseColoredTabs = True
    TabIndex = 0
    TabOrder = 0
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Color = clWindow
      Caption = #22522#26412#24773#20917
      object pnl1: TPanel
        Left = 16
        Top = 3
        Width = 617
        Height = 490
        BevelOuter = bvNone
        Color = clWindow
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
        object txt1: TStaticText
          Left = 16
          Top = 114
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #19978#20256#35686#21592
          TabOrder = 1
        end
        object txt2: TStaticText
          Left = 16
          Top = 66
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #19978#20256#32593#26684#21333#20301
          TabOrder = 2
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
          TabOrder = 3
        end
        object edtUPLOAD_TIME: TMaskEdit
          Left = 116
          Top = 90
          Width = 477
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 4
        end
        object txt6: TStaticText
          Left = 16
          Top = 138
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #23457#26680#29366#24577
          TabOrder = 5
        end
        object txt7: TStaticText
          Left = 262
          Top = 138
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #23457#26680#26102#38388
          TabOrder = 6
        end
        object edtSHSJ: TMaskEdit
          Left = 362
          Top = 138
          Width = 231
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 7
        end
        object txt8: TStaticText
          Left = 16
          Top = 162
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #23457#26680#20154#21592
          TabOrder = 8
        end
        object edtSH_RYBH: TMaskEdit
          Left = 116
          Top = 162
          Width = 147
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 9
        end
        object edtTitle: TMaskEdit
          Left = 116
          Top = 42
          Width = 477
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 10
        end
        object txt11: TStaticText
          Left = 16
          Top = 42
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #36164#28304#26631#39064
          TabOrder = 11
        end
        object txt12: TStaticText
          Left = 262
          Top = 114
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #32852#31995#30005#35805
          TabOrder = 12
        end
        object edtLxdh: TMaskEdit
          Left = 362
          Top = 114
          Width = 231
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 13
        end
        object txt10: TStaticText
          Left = 16
          Top = 185
          Width = 105
          Height = 233
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          TabOrder = 14
        end
        object txt4: TStaticText
          Left = 33
          Top = 291
          Width = 77
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = #37319#38598#20449#24687
          TabOrder = 15
        end
        object mmo1: TMemo
          Left = 116
          Top = 185
          Width = 477
          Height = 233
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Lines.Strings = (
            '')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 16
        end
        object edtDESCRIPTION: TMaskEdit
          Left = 388
          Top = 236
          Width = 53
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 17
        end
        object edtRESOURCE_ID: TMaskEdit
          Left = 116
          Top = 18
          Width = 477
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 18
        end
        object edtPOLICE_ID: TMaskEdit
          Left = 116
          Top = 114
          Width = 147
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 19
        end
        object edtSHZT: TMaskEdit
          Left = 116
          Top = 138
          Width = 147
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 20
        end
        object txt3: TStaticText
          Left = 262
          Top = 162
          Width = 101
          Height = 24
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #23457#26680#21333#20301
          TabOrder = 21
        end
        object edtSHDW: TMaskEdit
          Left = 362
          Top = 162
          Width = 231
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 22
        end
        object edtSSWG: TMaskEdit
          Left = 116
          Top = 66
          Width = 477
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 23
        end
        object tmpFJSPDW: TMaskEdit
          Left = 130
          Top = 447
          Width = 71
          Height = 22
          BevelEdges = [beBottom]
          BevelKind = bkSoft
          BorderStyle = bsNone
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 24
          Visible = False
        end
        object tmpSHSM: TMaskEdit
          Left = 239
          Top = 447
          Width = 71
          Height = 22
          BevelEdges = [beBottom]
          BevelKind = bkSoft
          BorderStyle = bsNone
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 25
          Visible = False
        end
        object tmpFJSPYJ: TMaskEdit
          Left = 343
          Top = 447
          Width = 71
          Height = 22
          BevelEdges = [beBottom]
          BevelKind = bkSoft
          BorderStyle = bsNone
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 26
          Visible = False
        end
        object tmpFJSPSJ: TMaskEdit
          Left = 447
          Top = 439
          Width = 71
          Height = 22
          BevelEdges = [beBottom]
          BevelKind = bkSoft
          BorderStyle = bsNone
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 27
          Text = #20998#23616#23457#25209#26102#38388
          Visible = False
        end
        object tmpFJSPRY: TMaskEdit
          Left = 524
          Top = 431
          Width = 71
          Height = 22
          BevelEdges = [beBottom]
          BevelKind = bkSoft
          BorderStyle = bsNone
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 28
          Text = #20998#23616#23457#25209#20154#21592
          Visible = False
        end
      end
    end
    object TabSheet2: TRzTabSheet
      Color = clWhite
      Caption = #27966#20986#25152#23457#25209#24847#35265
      DesignSize = (
        669
        490)
      object Panel1: TPanel
        Left = 36
        Top = 46
        Width = 581
        Height = 277
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Anchors = []
        BevelEdges = []
        BevelOuter = bvNone
        BorderWidth = 1
        Color = clWhite
        Ctl3D = False
        UseDockManager = False
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 0
        object Panel6: TPanel
          Left = 1
          Top = 1
          Width = 579
          Height = 41
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          BevelEdges = []
          BevelOuter = bvNone
          BorderWidth = 1
          BorderStyle = bsSingle
          Color = clWhite
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 0
          object Label3: TLabel
            Left = 22
            Top = 14
            Width = 105
            Height = 13
            AutoSize = False
            Caption = #27966#20986#25152#24847#35265
          end
          object Panel7: TPanel
            Left = 106
            Top = -1
            Width = 476
            Height = 41
            BevelEdges = []
            BevelOuter = bvNone
            BorderWidth = 1
            BorderStyle = bsSingle
            Color = clWhite
            Ctl3D = False
            ParentBackground = False
            ParentCtl3D = False
            TabOrder = 0
            object RadioButton1: TRadioButton
              Left = 8
              Top = 5
              Width = 51
              Height = 28
              Caption = #23457#25209
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = RadioButton1Click
            end
            object RadioButton2: TRadioButton
              Left = 65
              Top = 5
              Width = 51
              Height = 28
              Caption = #36864#22238
              TabOrder = 1
              OnClick = RadioButton2Click
            end
            object RadioButton3: TRadioButton
              Left = 122
              Top = 5
              Width = 82
              Height = 28
              Caption = #21576#25253#20998#23616
              TabOrder = 2
              OnClick = RadioButton3Click
            end
          end
        end
        object Panel2: TPanel
          Left = 1
          Top = 219
          Width = 579
          Height = 39
          Align = alTop
          BevelEdges = [beLeft, beRight, beBottom]
          BevelKind = bkSoft
          BevelOuter = bvNone
          BorderWidth = 1
          Color = clWhite
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 1
          object rzbtnPCSSP: TRzBitBtn
            Left = 461
            Top = 6
            Width = 98
            Height = 24
            Caption = #20445#23384
            TabOrder = 0
            OnClick = rzbtnPcsSHClick
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              08000000000000020000730E0000730E00000001000000000000000000003300
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
              4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
              6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
              E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809090909
              090909090909090909E8E8E881818181818181818181818181E8E809101009E3
              1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
              1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
              1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
              E3E3E3E3E309101009E8E881ACAC81E3E3E3E3E3E381ACAC81E8E80910101009
              090909090910101009E8E881ACACAC818181818181ACACAC81E8E80910101010
              101010101010101009E8E881ACACACACACACACACACACACAC81E8E80910100909
              090909090909101009E8E881ACAC8181818181818181ACAC81E8E8091009D7D7
              D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E8091009D709
              0909090909D7091009E8E881AC81D7818181818181D781AC81E8E8091009D7D7
              D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E809E309D709
              0909090909D7090909E8E881E381D7818181818181D7818181E8E8091009D7D7
              D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E80909090909
              090909090909090909E8E88181818181818181818181818181E8E8E8E8E8E8E8
              E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
            NumGlyphs = 2
          end
        end
        object panelCBSJDW: TPanel
          Left = 1
          Top = 178
          Width = 579
          Height = 41
          Align = alTop
          BevelEdges = []
          BevelOuter = bvNone
          BorderWidth = 1
          BorderStyle = bsSingle
          Color = clWhite
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 2
          object StaticText1: TStaticText
            Left = 16
            Top = 10
            Width = 99
            Height = 18
            Alignment = taCenter
            AutoSize = False
            BevelEdges = []
            BevelInner = bvNone
            Caption = #21576#25253#19978#32423#21333#20301#65306
            TabOrder = 0
          end
          object ed2FJSPDW: TMaskEdit
            Left = 121
            Top = 7
            Width = 280
            Height = 22
            BevelEdges = [beBottom]
            BevelKind = bkSoft
            BorderStyle = bsNone
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
          end
        end
        object Panel8: TPanel
          Left = 1
          Top = 42
          Width = 579
          Height = 136
          Align = alTop
          BevelEdges = [beLeft, beRight]
          BevelKind = bkSoft
          BevelOuter = bvNone
          BorderWidth = 1
          Color = clWhite
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 3
          object Label4: TLabel
            Left = 22
            Top = 54
            Width = 67
            Height = 19
            AutoSize = False
            Caption = #24847' '#35265' '#35828' '#26126
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object edtSHSM: TMaskEdit
            Left = 105
            Top = -1
            Width = 474
            Height = 138
            AutoSize = False
            BevelOuter = bvRaised
            Color = clWhite
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 0
            Text = #19978#25253#20449#24687#24050#25910#24713
          end
        end
      end
      object rzbtbtnBack: TRzBitBtn
        Left = 117
        Top = 324
        Width = 81
        Height = 33
        Caption = #36864#22238
        TabOrder = 1
        Visible = False
        OnClick = rzbtbtnBackClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000630B0000630B00000001000000000000000000003300
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
          4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
          6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E85E09
          095EE8E8E8E8E8E8E8E8E8E8E8E8E28181E2E8E8E8E8E8E8E8E8E8E8E8090910
          1009E8E8E8E8E8E8E8E8E8E8E88181ACAC81E8E8E8E8E8E8E8E8E8E809101009
          095EE8E8E8E8E8E8E8E8E8E881ACAC8181E2E8E8E8E8E8E8E8E8E85E0910095E
          E8E809090909090909E8E8E281AC81E2E8E881818181818181E8E80910095EE8
          E8E809101010101009E8E881AC81E2E8E8E881ACACACACAC81E8E8091009E8E8
          E8E8E8091010101009E8E881AC81E8E8E8E8E881ACACACAC81E8E80910095EE8
          E8E8E85E0910101009E8E881AC81E2E8E8E8E8E281ACACAC81E8E85E0910095E
          E85E09091009101009E8E8E281AC81E2E8E28181AC81ACAC81E8E8E809101009
          09091010095E091009E8E8E881ACAC818181ACAC81E281AC81E8E8E8E8090910
          10100909E8E8E80909E8E8E8E88181ACACAC8181E8E8E88181E8E8E8E8E85E09
          09095EE8E8E8E8E8E8E8E8E8E8E8E2818181E2E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
      object rzbtbtnCheck: TRzBitBtn
        Left = 216
        Top = 329
        Width = 65
        Height = 24
        Caption = #23457#25209
        TabOrder = 2
        Visible = False
        OnClick = rzbtbtnCheckClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000420B0000420B00000001000000000000000000003300
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
          4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
          6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8787878E8E8E8E8E8E8E8E8E8E8E8E8E8818181E8E8E8E8E8E8E8E8
          E8E8E8E878A3A3CE78E8E8E8E8E8E8E8E8E8E8E881ACACE881E8E8E8E8E8E8E8
          E8E8E878A378CCCE78E8E8E8E8E8E8E8E8E8E881AC81E8E881E8E8E8E8E8E8E8
          E8E878A378CCA3CE78E8E8E8E8E8E8E8E8E881AC81E8ACE881E8E8E8E8E8E8E8
          7878A378CCA3CE78E8E8E8E8E8E8E8E88181AC81E8ACE881E8E8E8E878787878
          A3A378CCA3CE78E8E8E8E8E881818181ACAC81E8ACE881E8E8E8E878CCCCCCCC
          7878CCA3CE78E8E8E8E8E881E8E8E8E88181E8ACE881E8E8E8E878CCCCA3CCCC
          CCCCA3CE78E8E8E8E8E881E8E8ACE8E8E8E8ACE881E8E8E8E8E878CCA3CCA3CC
          CCCCCE78E8E8E8E8E8E881E8ACE8ACE8E8E8E881E8E8E8E8E8E878CCCCA3CCA3
          CCCCCE78E8E8E8E8E8E881E8E8ACE8ACE8E8E881E8E8E8E8E8E878CCCCCCA3CC
          A3CCCE78E8E8E8E8E8E881E8E8E8ACE8ACE8E881E8E8E8E8E8E878CC7878CCA3
          CCA3CE78E8E8E8E8E8E881E88181E8ACE8ACE881E8E8E8E8E8E878D5A378CCCC
          A3CCD578E8E8E8E8E8E881E8AC81E8E8ACE8E881E8E8E8E8E8E8E878D5CECECE
          CED578E8E8E8E8E8E8E8E881E8E8E8E8E8E881E8E8E8E8E8E8E8E8E878787878
          7878E8E8E8E8E8E8E8E8E8E8818181818181E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
    end
    object TabSheet3: TRzTabSheet
      Color = clWindow
      Caption = #20998#23616#22788#32622#24773#20917
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel3: TPanel
        Left = 19
        Top = 49
        Width = 134
        Height = 136
        BevelEdges = []
        BevelOuter = bvNone
        BorderWidth = 1
        BorderStyle = bsSingle
        Color = clWhite
        Ctl3D = False
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 0
        object Label2: TLabel
          Left = 21
          Top = 56
          Width = 105
          Height = 13
          AutoSize = False
          Caption = #20998#23616#22788#32622#24773#20917
        end
      end
      object Panel4: TPanel
        Left = 151
        Top = 49
        Width = 442
        Height = 136
        BevelEdges = []
        BevelOuter = bvNone
        BorderWidth = 1
        BorderStyle = bsSingle
        Color = clWhite
        Ctl3D = False
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 1
        object edtFJSPYJ: TMaskEdit
          Left = 0
          Top = 0
          Width = 441
          Height = 137
          AutoSize = False
          BevelOuter = bvRaised
          Color = clWhite
          Ctl3D = True
          MaxLength = 100
          ParentCtl3D = False
          TabOrder = 0
        end
      end
      object rzbtnFJSH: TRzBitBtn
        Left = 471
        Top = 201
        Width = 98
        Height = 24
        Caption = #20445#23384
        TabOrder = 2
        OnClick = rzbtnFJSHClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000730E0000730E00000001000000000000000000003300
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
          4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
          6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809090909
          090909090909090909E8E8E881818181818181818181818181E8E809101009E3
          1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
          1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
          1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
          E3E3E3E3E309101009E8E881ACAC81E3E3E3E3E3E381ACAC81E8E80910101009
          090909090910101009E8E881ACACAC818181818181ACACAC81E8E80910101010
          101010101010101009E8E881ACACACACACACACACACACACAC81E8E80910100909
          090909090909101009E8E881ACAC8181818181818181ACAC81E8E8091009D7D7
          D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E8091009D709
          0909090909D7091009E8E881AC81D7818181818181D781AC81E8E8091009D7D7
          D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E809E309D709
          0909090909D7090909E8E881E381D7818181818181D7818181E8E8091009D7D7
          D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E80909090909
          090909090909090909E8E88181818181818181818181818181E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
      object StaticText2: TStaticText
        Left = 19
        Top = 25
        Width = 133
        Height = 25
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = #23457#26680#20154#21592
        TabOrder = 3
      end
      object edtFJSPRY: TMaskEdit
        Left = 150
        Top = 25
        Width = 147
        Height = 25
        AutoSize = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
      end
      object StaticText3: TStaticText
        Left = 296
        Top = 25
        Width = 101
        Height = 25
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = #23457#26680#26102#38388
        TabOrder = 5
      end
      object edtFJSPSJ: TMaskEdit
        Left = 396
        Top = 25
        Width = 197
        Height = 25
        AutoSize = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 6
      end
    end
  end
end
