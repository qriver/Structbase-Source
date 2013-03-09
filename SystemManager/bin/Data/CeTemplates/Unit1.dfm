object <#FormName>: <#TFormName>
  Left = 194
  Top = 115
  Width = 639
  Height = 446
  Caption = <#FormCaption>
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
  <#AddControlDfm>
  <#AddCdsControl> 
  end

end
