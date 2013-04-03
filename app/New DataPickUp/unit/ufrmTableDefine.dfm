object frmTableDefine: TfrmTableDefine
  Left = 618
  Top = 388
  Caption = 'frmTableDefine'
  ClientHeight = 489
  ClientWidth = 567
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
  object pnl2: TPanel
    Left = 0
    Top = 312
    Width = 561
    Height = 161
    TabOrder = 0
    object txt6: TStaticText
      Left = 19
      Top = 16
      Width = 116
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #24207#21495
      TabOrder = 0
    end
    object txtlbl2: TStaticText
      Left = 19
      Top = 40
      Width = 116
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #20013#25991#21517
      TabOrder = 1
    end
    object edtFIELD_CHNNAME: TMaskEdit
      Left = 135
      Top = 40
      Width = 144
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object txt8: TStaticText
      Left = 278
      Top = 39
      Width = 72
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #25152#23646#36164#28304
      TabOrder = 3
    end
    object edtRESOURCE_NAME: TMaskEdit
      Left = 349
      Top = 39
      Width = 165
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
    end
    object edtFIELD_ENGNAME: TMaskEdit
      Left = 349
      Top = 16
      Width = 165
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
    end
    object edtXH: TMaskEdit
      Left = 135
      Top = 16
      Width = 144
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
    end
    object txt1: TStaticText
      Left = 278
      Top = 16
      Width = 72
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #21015#21517
      TabOrder = 7
    end
    object btnSave: TButton
      Left = 227
      Top = 96
      Width = 78
      Height = 25
      Caption = #20445#23384
      TabOrder = 8
      OnClick = btnSaveClick
    end
    object edtResource_id: TMaskEdit
      Left = 421
      Top = 79
      Width = 84
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 9
    end
    object edtLSH: TMaskEdit
      Left = 421
      Top = 111
      Width = 84
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 10
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 8
    Width = 561
    Height = 289
    Caption = 'pnl2'
    TabOrder = 1
    object dbgrdColumn: TDBGrid
      Left = 8
      Top = 16
      Width = 513
      Height = 233
      DataSource = DateSourceRes_TableDefine
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgrdColumnDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'XH'
          Title.Alignment = taCenter
          Title.Caption = #24207#21495
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FIELD_CHNNAME'
          Title.Alignment = taCenter
          Title.Caption = #36164#28304#21015#20013#25991#21517
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FIELD_ENGNAME'
          Title.Alignment = taCenter
          Title.Caption = #36164#28304#21015#21517
          Width = 115
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RESOURCE_ID'
          Title.Alignment = taCenter
          Title.Caption = #36164#28304#31867#21035
          Width = 99
          Visible = True
        end>
    end
    object btnFieldModify: TButton
      Left = 328
      Top = 256
      Width = 75
      Height = 25
      Caption = #20462#25913
      TabOrder = 1
      OnClick = btnFieldModifyClick
    end
    object btnAddNew: TButton
      Left = 224
      Top = 256
      Width = 75
      Height = 25
      Caption = #26032#22686
      TabOrder = 2
      OnClick = btnAddNewClick
    end
    object btnQuary: TButton
      Left = 112
      Top = 256
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 3
      OnClick = btnQuaryClick
    end
  end
  object datasetRes_List: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 96
  end
  object DateSourceRes_TableDefine: TDataSource
    DataSet = dataset_TableDefine
    Left = 280
    Top = 128
  end
  object dataset_TableDefine: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 120
  end
end
