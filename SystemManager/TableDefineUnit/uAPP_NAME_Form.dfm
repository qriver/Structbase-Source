object APP_NAME_Form: TAPP_NAME_Form
  Left = 194
  Top = 115
  Caption = #24212#29992#31995#32479#32500#25252
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
      Left = 80
      Top = 24
      Width = 120
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #31995#32479#32534#21495
      TabOrder = 0
    end
    object edtAPPID: TMaskEdit
      Left = 180
      Top = 24
      Width = 121
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Text = 'edtAPPID'
    end
    object lbl2: TStaticText
      Left = 80
      Top = 48
      Width = 120
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #31995#32479#35828#26126
      TabOrder = 2
    end
    object edtAPPNAME: TMaskEdit
      Left = 180
      Top = 48
      Width = 121
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Text = 'edtAPPNAME'
    end
    object lbl3: TStaticText
      Left = 80
      Top = 72
      Width = 120
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #25968#25454#28304#23450#20041
      TabOrder = 4
    end
    object edtDATASOURCE: TMaskEdit
      Left = 180
      Top = 72
      Width = 121
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
      Text = 'edtDATASOURCE'
    end
    object lbl4: TStaticText
      Left = 80
      Top = 96
      Width = 120
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #34920#27169#24335#21517
      TabOrder = 6
    end
    object edtDB_SCHEMA: TMaskEdit
      Left = 180
      Top = 96
      Width = 121
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 7
      Text = 'edtDB_SCHEMA'
    end
    object lbl5: TStaticText
      Left = 80
      Top = 120
      Width = 120
      Height = 25
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = #20803#25968#25454#25968#25454#28304
      TabOrder = 8
    end
    object edtMETA_DATASOURCE: TMaskEdit
      Left = 180
      Top = 120
      Width = 121
      Height = 25
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 9
      Text = 'edtMETA_DATASOURCE'
    end
  end
end
