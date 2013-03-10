object APP_DATASOURCE_Form: TAPP_DATASOURCE_Form
  Left = 194
  Top = 115
  Caption = #25968#25454#24211#36830#25509#31649#29702
  ClientHeight = 412
  ClientWidth = 631
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
    TabOrder = 2
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
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 400
    Height = 385
    Caption = 'Panel1'
    TabOrder = 1
    object lbl1: TStaticText
      Left = 61
      Top = 24
      Width = 120
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #33258#21160#35013#36733
      TabOrder = 0
    end
    object edtAUTOLOAD: TMaskEdit
      Left = 180
      Top = 24
      Width = 121
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Text = 'edtAUTOLOAD'
    end
    object lbl2: TStaticText
      Left = 61
      Top = 48
      Width = 120
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #25968#25454#24211#36830#25509#20018
      TabOrder = 2
    end
    object edtCONNECTIONSTR: TMaskEdit
      Left = 180
      Top = 48
      Width = 121
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Text = 'edtCONNECTIONSTR'
    end
    object lbl3: TStaticText
      Left = 61
      Top = 72
      Width = 120
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #21807#19968#26631#35782
      TabOrder = 4
    end
    object edtID: TMaskEdit
      Left = 180
      Top = 72
      Width = 121
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
      Text = 'edtID'
    end
    object lbl4: TStaticText
      Left = 61
      Top = 96
      Width = 120
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #25968#25454#28304#20013#25991#21517#31216
      TabOrder = 6
    end
    object edtSOURCE_CHINESE: TMaskEdit
      Left = 180
      Top = 96
      Width = 121
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 7
      Text = 'edtSOURCE_CHINESE'
    end
    object lbl5: TStaticText
      Left = 61
      Top = 120
      Width = 120
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #25968#25454#28304#21517#31216
      TabOrder = 8
    end
    object edtSOURCE_NAME: TMaskEdit
      Left = 180
      Top = 120
      Width = 121
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 9
      Text = 'edtSOURCE_NAME'
    end
  end
end
