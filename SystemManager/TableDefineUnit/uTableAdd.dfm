object frmTableAdd: TfrmTableAdd
  Left = 409
  Top = 266
  Caption = #25968#25454#34920#32500#25252
  ClientHeight = 246
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl3: TPanel
    Left = 31
    Top = 16
    Width = 450
    Height = 201
    TabOrder = 0
    object lbl1: TLabel
      Left = 97
      Top = 39
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #31995#32479#21517#31216':'
    end
    object lbl2: TLabel
      Left = 97
      Top = 111
      Width = 97
      Height = 13
      AutoSize = False
      Caption = #25968#25454#34920#20013#25991#21517':'
    end
    object lbl3: TLabel
      Left = 97
      Top = 79
      Width = 73
      Height = 13
      AutoSize = False
      Caption = #25968#25454#34920#21517':'
    end
    object CbbAppName: TDBLookupComboBox
      Left = 190
      Top = 33
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
      TabOrder = 0
    end
    object edtTableName: TEdit
      Left = 192
      Top = 71
      Width = 153
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'edtTableName'
    end
    object edtChineseName: TEdit
      Left = 192
      Top = 111
      Width = 153
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'edt1'
    end
    object btn1: TButton
      Left = 152
      Top = 152
      Width = 97
      Height = 33
      Caption = #30830#23450
      TabOrder = 3
      OnClick = btn1Click
    end
  end
  object ds1: TDataSource
    AutoEdit = False
    Left = 64
    Top = 48
  end
  object ds2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 71
    Top = 120
  end
end
