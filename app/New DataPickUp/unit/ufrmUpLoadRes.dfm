object frmUpLoadRes: TfrmUpLoadRes
  Left = 307
  Top = 236
  Caption = #25968#25454#36164#28304#19978#20256
  ClientHeight = 523
  ClientWidth = 847
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
    Left = 24
    Top = 8
    Width = 785
    Height = 81
    TabOrder = 0
    object btnQuary: TBitBtn
      Left = 687
      Top = 8
      Width = 75
      Height = 25
      Caption = #26597#35810
      DoubleBuffered = True
      ModalResult = 4
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnQuaryClick
    end
    object txt3: TStaticText
      Left = 343
      Top = 9
      Width = 100
      Height = 26
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #23457#25209#29366#24577
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtSHZT: TMaskEdit
      Left = 442
      Top = 9
      Width = 231
      Height = 25
      AutoSize = False
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object txt1: TStaticText
      Left = 7
      Top = 9
      Width = 92
      Height = 26
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #25152#23646#21333#20301
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtDWBM: TMaskEdit
      Left = 98
      Top = 9
      Width = 247
      Height = 26
      AutoSize = False
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
    end
    object edtPolice_Id: TMaskEdit
      Left = 98
      Top = 33
      Width = 247
      Height = 26
      AutoSize = False
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
    end
    object StaticText1: TStaticText
      Left = 7
      Top = 33
      Width = 92
      Height = 26
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #19978#20256#27665#35686
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object StaticText2: TStaticText
      Left = 344
      Top = 33
      Width = 99
      Height = 26
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object txt2: TStaticText
      Left = 442
      Top = 33
      Width = 231
      Height = 26
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
  end
  object pnl2: TPanel
    Left = 24
    Top = 96
    Width = 785
    Height = 409
    TabOrder = 1
    object dbgrd1: TDBGrid
      Left = 13
      Top = 8
      Width = 761
      Height = 361
      DataSource = DateSourceUpQuary
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgrd1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Title'
          Title.Caption = #26631#39064
          Width = 146
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RESOURCE_ID'
          Title.Caption = #36164#28304#31867#21035
          Width = 121
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JLTS'
          Title.Caption = #25968#25454#25968#37327
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SJZT'
          Title.Caption = #25968#25454#29366#24577
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DWBM'
          Title.Caption = #30331#35760#21333#20301
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UPLOAD_TIME'
          Title.Caption = #19978#20256#26102#38388
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'POLICE_ID'
          Title.Caption = #19978#20256#35686#21592
          Width = 87
          Visible = True
        end>
    end
    object rzbtbtn1: TRzBitBtn
      Left = 11
      Top = 375
      Width = 81
      Height = 26
      Caption = #36164#28304#30331#35760
      TabOrder = 1
      OnClick = rzbtbtn1Click
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
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8895E5E5E5EAC
        E8E8E8E8E8E8E8E8E8E88181818181ACE8E8E8E8E8E8E8E8E8E889E6E6D0E35E
        5EACE8E8E8E8E8E8E8E881ACACACE38181ACE8E8E8E8E8E8E8E889D7D7D0D7D7
        E35EE8E8E8E8E8E8E8E881D7D7ACD7D7E381E8E8E8E8E8E8E8E889E6E6D0E6E6
        E65EACE8E8E8E8E8E8E881ACACACACACAC81ACE8E8E8E8E8E8E889D7ACD0D7D7
        D7E35EACE8E8E8E8E8E881D7ACACD7D7D7E381ACE8E8E8E8E8E889E6E6D0E6E6
        E6E6E35E5E5EACE8E8E881ACACACACACACACE3818181ACE8E8E889D7D7D0D7D7
        D7D7D7D7D7E35E5E5EAC81D7D7ACD7D7D7D7D7D7D7E3818181AC89E6E6D0E6E6
        E6E6E6E6E6E6E6E6E35E81ACACACACACACACACACACACACACE38189D7D7D0D7D7
        D7D7D7D7D7D7D7D7D75E81D7D7ACD7D7D7D7D7D7D7D7D7D7D78189E6E6D0E6E6
        E6E6E6E6E6E6E6E6E65E81ACACACACACACACACACACACACACAC8189D7ACD0D7D7
        D7D7D7D7D7D7D7D7D75E81D7ACACD7D7D7D7D7D7D7D7D7D7D78189D7D7D0D7D7
        D7D7D7D7D7D7D7D7D75E81D7D7ACD7D7D7D7D7D7D7D7D7D7D78189D7D7D0D7D7
        D7D7D7D7D7D7D7D7D75E81D7D7ACD7D7D7D7D7D7D7D7D7D7D781898989898989
        8989898989898989898981818181818181818181818181818181E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object rzbtbtn2: TRzBitBtn
      Left = 98
      Top = 375
      Width = 81
      Height = 26
      Caption = #36164#28304#20462#25913
      TabOrder = 2
      OnClick = rzbtbtn2Click
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000620B0000620B00000001000000000000000000003300
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
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E82B2B81E8E8E8
        E8E8E8E8E8E8E8E8E8E8565681E8E8E8E8E8E8E8E8E8E8E8E8E8AC562B2BE8E8
        E8E8E8E8E8E8E8E8E8E881DF5656E8E8E8E8E8E8E8E8E8E8E8E8E85656562B81
        E8E8E8E8E8E8E8E8E8E8E8DFDFDF5681E8E8E8E8E8E8E8E8E8E8E8AC5656562B
        7EE8E8E8E8E8E8E8E8E8E881DFDFDF5681E8E8E8E8E8E8E8E8E8E8E85656D5AB
        AB7EE8E8E8E8E8E8E8E8E8E8DFDFE3ACAC81E8E8E8E8E8E8E8E8E8E8ACDFD6D5
        ABAB7EABE8E8E8E8E8E8E8E881DFE3E3ACAC81ACE8E8E8E8E8E8E8E8E8AAD7D6
        D5D5ABAA7EE8E8E8E8E8E8E8E8ACD7E3E3E3ACAC81E8E8E8E8E8E8E8E8AAD7D6
        D6D5D5ABAB7EAAE8E8E8E8E8E8ACD7E3E3E3E3ACAC81ACE8E8E8E8E8E8E8ABD7
        D6D6D5D5ABAD0909E8E8E8E8E8E8ACD7E3E3E3E3ACAC5656E8E8E8E8E8E8AAD7
        D6D6AD101009090909E8E8E8E8E8ACD7E3E3ACDFDF56565656E8E8E8E8E8E8AB
        D7D61010101009090909E8E8E8E8E8ACD7E3DFDFDFDF56565656E8E8E8E8E8AA
        D7AD1010101010090909E8E8E8E8E8ACD7ACDFDFDFDFDF565656E8E8E8E8E8E8
        17171010101010100909E8E8E8E8E8E88181DFDFDFDFDFDF5656E8E8E8E8E8E8
        10171710101010101009E8E8E8E8E8E8568181DFDFDFDFDFDF56E8E8E8E8E8E8
        E8101717101010101010E8E8E8E8E8E8E8568181DFDFDFDFDFDF}
      NumGlyphs = 2
    end
  end
  object datasetUpQuery: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 512
    Top = 488
  end
  object DateSourceUpQuary: TDataSource
    DataSet = datasetUpQuery
    Left = 616
    Top = 488
  end
end
