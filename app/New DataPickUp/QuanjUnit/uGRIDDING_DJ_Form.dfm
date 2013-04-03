object GRIDDING_DJ_Form: TGRIDDING_DJ_Form
  Left = 194
  Top = 115
  Caption = #20225#19994#26723#26696#32500#25252
  ClientHeight = 628
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnClose: TButton
    Left = 495
    Top = 184
    Width = 75
    Height = 25
    Caption = 'btnClose'
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object btnSave: TButton
    Left = 495
    Top = 90
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 0
    OnClick = btnSaveClick
  end
  object pnl2: TPanel
    Left = 16
    Top = 8
    Width = 751
    Height = 600
    BevelOuter = bvNone
    Color = clWindow
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    object panel1: TPanel
      Left = 0
      Top = 0
      Width = 616
      Height = 521
      BevelOuter = bvNone
      Color = clWindow
      DoubleBuffered = True
      ParentBackground = False
      ParentDoubleBuffered = False
      TabOrder = 0
      object lbl1: TLabel
        Left = 216
        Top = 10
        Width = 220
        Height = 25
        AutoSize = False
        Caption = #32593#26684#31649#25511#20449#24687#30331#35760
        Font.Charset = GB2312_CHARSET
        Font.Color = clNavy
        Font.Height = -24
        Font.Name = #20223#23435'_GB2312'
        Font.Style = []
        ParentFont = False
      end
      object txt7: TStaticText
        Left = 320
        Top = 172
        Width = 125
        Height = 25
        Align = alCustom
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = #31649#29702#21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 1
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 24
      end
      object edtGLDW: TMaskEdit
        Left = 443
        Top = 172
        Width = 164
        Height = 25
        AutoSize = False
        Color = clMoneyGreen
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 25
      end
      object txtlbl2: TStaticText
        Left = 16
        Top = 100
        Width = 125
        Height = 25
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = #36164#28304#31867#21035
        TabOrder = 3
      end
      object txt1: TStaticText
        Left = 16
        Top = 124
        Width = 125
        Height = 25
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = #19978#20256#35686#21592
        TabOrder = 4
      end
      object edtPOLICE_ID: TMaskEdit
        Left = 140
        Top = 124
        Width = 181
        Height = 25
        AutoSize = False
        Color = clMoneyGreen
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
      end
      object txt2: TStaticText
        Left = 16
        Top = 148
        Width = 125
        Height = 24
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = #27665#35686#25152#23646#32593#26684
        TabOrder = 6
      end
      object edtSSWG: TMaskEdit
        Left = 140
        Top = 148
        Width = 467
        Height = 25
        AutoSize = False
        Color = clMoneyGreen
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 7
      end
      object txt5: TStaticText
        Left = 319
        Top = 100
        Width = 125
        Height = 25
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = #19978#20256#26102#38388
        TabOrder = 8
      end
      object edtUPLOAD_TIME: TMaskEdit
        Left = 443
        Top = 100
        Width = 164
        Height = 25
        AutoSize = False
        Color = clMoneyGreen
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 9
      end
      object edtDESCRIPTION: TMaskEdit
        Left = 130
        Top = 434
        Width = 325
        Height = 29
        AutoSize = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 10
        Visible = False
      end
      object txt8: TStaticText
        Left = 16
        Top = 52
        Width = 125
        Height = 25
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = #35760#24405#32534#21495
        TabOrder = 0
      end
      object edtLSH: TMaskEdit
        Left = 140
        Top = 52
        Width = 467
        Height = 25
        AutoSize = False
        Color = clMoneyGreen
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
      end
      object txtTitle1: TStaticText
        Left = 16
        Top = 76
        Width = 125
        Height = 25
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = #26631#39064
        TabOrder = 11
      end
      object edtTitle: TMaskEdit
        Left = 140
        Top = 76
        Width = 467
        Height = 25
        AutoSize = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
      end
      object txt9: TStaticText
        Left = 320
        Top = 124
        Width = 125
        Height = 25
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = #32852#31995#30005#35805
        TabOrder = 12
      end
      object edtSHZT: TMaskEdit
        Left = 16
        Top = 433
        Width = 89
        Height = 25
        AutoSize = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 13
        Text = '0'
        Visible = False
      end
      object edtLXDH: TMaskEdit
        Left = 443
        Top = 124
        Width = 164
        Height = 25
        AutoSize = False
        Color = clMoneyGreen
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 14
      end
      object txt3: TStaticText
        Left = 15
        Top = 195
        Width = 126
        Height = 209
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        TabOrder = 15
      end
      object txt4: TStaticText
        Left = 41
        Top = 268
        Width = 77
        Height = 25
        Alignment = taCenter
        AutoSize = False
        Caption = #37319#38598#20449#24687
        TabOrder = 16
      end
      object mmo1: TMemo
        Left = 140
        Top = 195
        Width = 467
        Height = 209
        Ctl3D = False
        Lines.Strings = (
          ''
          ''
          ''
          ''
          '')
        ParentCtl3D = False
        ScrollBars = ssVertical
        TabOrder = 17
      end
      object txt6: TStaticText
        Left = 16
        Top = 171
        Width = 125
        Height = 25
        Align = alCustom
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        Caption = #23457#25209#21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 1
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 18
      end
      object edtSHDW: TMaskEdit
        Left = 140
        Top = 172
        Width = 181
        Height = 24
        AutoSize = False
        Color = clMoneyGreen
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 19
      end
      object Button1: TButton
        Left = 504
        Top = 437
        Width = 73
        Height = 33
        Caption = 'Button1'
        TabOrder = 20
        Visible = False
      end
      object edtResource_id: TMaskEdit
        Left = 140
        Top = 100
        Width = 181
        Height = 25
        AutoSize = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 21
      end
      object rzbBtnSelectRes: TRzBitBtn
        Left = 293
        Top = 102
        Width = 25
        Height = 21
        Caption = '...'
        TabOrder = 22
        OnClick = rzbBtnSelectResClick
        DisabledIndex = 55
        ImageIndex = 54
        NumGlyphs = 2
      end
      inline trvwfrm1: TTreeViewFrame
        Left = 140
        Top = 125
        Width = 334
        Height = 160
        TabOrder = 23
        ExplicitLeft = 140
        ExplicitTop = 125
        ExplicitWidth = 334
        ExplicitHeight = 160
        inherited tvResource: TTreeView
          Left = 0
          Top = 0
          Width = 334
          Height = 160
          Cursor = crArrow
          Align = alClient
          AutoExpand = True
          OnDblClick = trvwfrm1tvResourceDblClick
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 334
          ExplicitHeight = 160
        end
      end
      object rzbtbtnSave: TRzBitBtn
        Left = 464
        Top = 11
        Width = 73
        Caption = #20445#23384
        Color = clWindow
        TabOrder = 26
        OnClick = rzbtbtnSaveClick
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
        DisabledIndex = 55
        ImageIndex = 54
        NumGlyphs = 2
      end
    end
  end
end
