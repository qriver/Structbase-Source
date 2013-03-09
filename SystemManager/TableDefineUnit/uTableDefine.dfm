object frmTableDefine: TfrmTableDefine
  Left = 280
  Top = 222
  Caption = #25968#25454#34920#23450#20041
  ClientHeight = 605
  ClientWidth = 864
  Color = clBtnFace
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
  object pnl1: TPanel
    Left = 8
    Top = 8
    Width = 249
    Height = 569
    Caption = 'pnl1'
    TabOrder = 0
    object lbl1: TLabel
      Left = 12
      Top = 16
      Width = 63
      Height = 13
      AutoSize = False
      Caption = #31995#32479#21517#31216':'
    end
    object dgTable: TDBGrid
      Left = 8
      Top = 72
      Width = 233
      Height = 433
      DataSource = ds2
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dgTableDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Table_Name'
          Title.Alignment = taCenter
          Title.Caption = #25968#25454#34920#21517
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TABLE_CHINESENAME'
          Title.Caption = #20013#25991#21517
          Width = 112
          Visible = True
        end>
    end
    object btnAppFInd: TButton
      Left = 8
      Top = 40
      Width = 65
      Height = 25
      Caption = #26597#35810
      TabOrder = 1
      OnClick = btnAppFIndClick
    end
    object CbbAppName: TDBLookupComboBox
      Left = 78
      Top = 10
      Width = 154
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'appid'
      ListField = 'appName'
      ListSource = ds1
      ParentFont = False
      TabOrder = 2
    end
    object btnTableAdd: TButton
      Left = 32
      Top = 520
      Width = 57
      Height = 33
      Caption = #26032#22686
      TabOrder = 3
      OnClick = btnTableAddClick
    end
    object btnEdit: TButton
      Left = 128
      Top = 520
      Width = 65
      Height = 33
      Caption = #20462#25913
      TabOrder = 4
      OnClick = btnEditClick
    end
  end
  object pnl3: TPanel
    Left = 272
    Top = 8
    Width = 561
    Height = 289
    Caption = 'pnl2'
    TabOrder = 1
    object dgColumn: TDBGrid
      Left = 16
      Top = 16
      Width = 537
      Height = 233
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dgColumnDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'colXh'
          Title.Alignment = taCenter
          Title.Caption = #24207#21495
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'colName'
          Title.Alignment = taCenter
          Title.Caption = #21015#21517
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'colChineseName'
          Title.Alignment = taCenter
          Title.Caption = #21015#20013#25991#21517
          Width = 115
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dicid'
          Title.Alignment = taCenter
          Title.Caption = #23383#20856#20195#30721
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'coltype'
          Title.Alignment = taCenter
          Title.Caption = #21015#31867#22411
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PKFLAG'
          Title.Caption = #20027#38190
          Width = 67
          Visible = True
        end>
    end
    object btnFieldModify: TButton
      Left = 216
      Top = 256
      Width = 75
      Height = 25
      Caption = #20462#25913
      TabOrder = 1
      OnClick = btnFieldModifyClick
    end
    object btnAddNew: TButton
      Left = 120
      Top = 256
      Width = 75
      Height = 25
      Caption = #26032#22686
      TabOrder = 2
      OnClick = btnAddNewClick
    end
  end
  object Panel1: TPanel
    Left = 272
    Top = 312
    Width = 561
    Height = 265
    Caption = 'pnl1'
    TabOrder = 2
    object txt6: TStaticText
      Left = 32
      Top = 50
      Width = 116
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #24207#21495
      TabOrder = 0
    end
    object txtlbl2: TStaticText
      Left = 32
      Top = 74
      Width = 116
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #20013#25991#21517
      TabOrder = 1
    end
    object edtColChineseName: TMaskEdit
      Left = 148
      Top = 74
      Width = 144
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object txtlbl3: TStaticText
      Left = 32
      Top = 98
      Width = 116
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #38271#24230
      TabOrder = 3
    end
    object edtColLength: TMaskEdit
      Left = 148
      Top = 98
      Width = 144
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
    end
    object txtlbl4: TStaticText
      Left = 32
      Top = 122
      Width = 116
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #26159#21542#20027#38190
      TabOrder = 5
    end
    object edtPkFlag: TMaskEdit
      Left = 148
      Top = 122
      Width = 144
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
    end
    object txtlbl15: TStaticText
      Left = 291
      Top = 98
      Width = 72
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #25968#25454#23383#20856
      TabOrder = 7
    end
    object edtDicId: TMaskEdit
      Left = 362
      Top = 98
      Width = 165
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 8
    end
    object txtPkBuild: TStaticText
      Left = 291
      Top = 122
      Width = 72
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #20027#38190#35268#21017
      TabOrder = 9
    end
    object edtPKBuild: TMaskEdit
      Left = 362
      Top = 122
      Width = 165
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 10
    end
    object txt7: TStaticText
      Left = 32
      Top = 146
      Width = 116
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #25968#25454#34920#21517
      TabOrder = 11
    end
    object edtTableName: TMaskEdit
      Left = 148
      Top = 146
      Width = 144
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 12
    end
    object txt8: TStaticText
      Left = 291
      Top = 146
      Width = 72
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #25152#23646#31995#32479
      TabOrder = 13
    end
    object edtAppId: TMaskEdit
      Left = 362
      Top = 146
      Width = 165
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 14
    end
    object edtColName: TMaskEdit
      Left = 362
      Top = 50
      Width = 165
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 15
    end
    object edtColXH: TMaskEdit
      Left = 148
      Top = 50
      Width = 144
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 16
    end
    object txt1: TStaticText
      Left = 291
      Top = 50
      Width = 72
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #21015#21517
      TabOrder = 17
    end
    object edtColType: TMaskEdit
      Left = 362
      Top = 73
      Width = 165
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 18
    end
    object StaticText2: TStaticText
      Left = 291
      Top = 74
      Width = 72
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #21015#31867#22411
      TabOrder = 19
    end
    object btnFieldSave: TButton
      Left = 408
      Top = 200
      Width = 105
      Height = 33
      Caption = #20445#23384
      TabOrder = 20
      OnClick = btnFieldSaveClick
    end
    object StaticText1: TStaticText
      Left = 32
      Top = 25
      Width = 116
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #21807#19968#32534#21495
      TabOrder = 21
    end
    object edtColId: TMaskEdit
      Left = 148
      Top = 25
      Width = 379
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 22
    end
  end
  object ds1: TDataSource
    AutoEdit = False
    Left = 104
    Top = 48
  end
  object ds2: TDataSource
    AutoEdit = False
    Left = 152
    Top = 48
  end
  object cdsColumn: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 256
  end
  object dsColumn: TDataSource
    AutoEdit = False
    Left = 280
    Top = 264
  end
end
