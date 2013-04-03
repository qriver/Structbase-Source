object ZJB_SQSP_Form: TZJB_SQSP_Form
  Left = 194
  Top = 115
  Width = 639
  Height = 446
  Caption = #20225#19994#26723#26696#32500#25252
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
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #21464#26356#21407#22240 
  end 
  object edtBGYY: TMaskEdit
    Left = 180 
    Top = 24 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtBGYY' 
  end 
  object lbl2: TStaticText
    Left = 80 
    Top = 48 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #21464#26356#29366#24577 
  end 
  object edtBGZT: TMaskEdit
    Left = 180 
    Top = 48 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtBGZT' 
  end 
  object lbl3: TStaticText
    Left = 80 
    Top = 72 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #26631#20934#27004#26635#32534#21495 
  end 
  object edtBZLDBH: TMaskEdit
    Left = 180 
    Top = 72 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtBZLDBH' 
  end 
  object lbl4: TStaticText
    Left = 80 
    Top = 96 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #21103#21495 
  end 
  object edtFH: TMaskEdit
    Left = 180 
    Top = 96 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtFH' 
  end 
  object lbl5: TStaticText
    Left = 80 
    Top = 120 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #21103#21495#21518#32512 
  end 
  object edtFHHZ: TMaskEdit
    Left = 180 
    Top = 120 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtFHHZ' 
  end 
  object lbl6: TStaticText
    Left = 80 
    Top = 144 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #21807#19968#32534#21495 
  end 
  object edtID: TMaskEdit
    Left = 180 
    Top = 144 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtID' 
  end 
  object lbl7: TStaticText
    Left = 80 
    Top = 168 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #35760#24405#26465#25968 
  end 
  object edtJLTS: TMaskEdit
    Left = 180 
    Top = 168 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtJLTS' 
  end 
  object lbl8: TStaticText
    Left = 80 
    Top = 192 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #34903#36335#24055 
  end 
  object edtJLX: TMaskEdit
    Left = 180 
    Top = 192 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtJLX' 
  end 
  object lbl9: TStaticText
    Left = 80 
    Top = 216 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #27004#26635#21495 
  end 
  object edtLDH: TMaskEdit
    Left = 180 
    Top = 216 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtLDH' 
  end 
  object lbl10: TStaticText
    Left = 80 
    Top = 240 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = 'X'#22352#26631 
  end 
  object edtMAP_X: TMaskEdit
    Left = 180 
    Top = 240 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtMAP_X' 
  end 
  object lbl11: TStaticText
    Left = 80 
    Top = 264 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = 'Y'#22352#26631 
  end 
  object edtMAP_Y: TMaskEdit
    Left = 180 
    Top = 264 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtMAP_Y' 
  end 
  object lbl12: TStaticText
    Left = 80 
    Top = 288 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #38376#29260#21495 
  end 
  object edtMPH: TMaskEdit
    Left = 180 
    Top = 288 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtMPH' 
  end 
  object lbl13: TStaticText
    Left = 80 
    Top = 312 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #38376#29260#21518#32512 
  end 
  object edtMPHZ: TMaskEdit
    Left = 180 
    Top = 312 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtMPHZ' 
  end 
  object lbl14: TStaticText
    Left = 80 
    Top = 336 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #38376#29260#21069#32512 
  end 
  object edtMPQZ: TMaskEdit
    Left = 180 
    Top = 336 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtMPQZ' 
  end 
  object lbl15: TStaticText
    Left = 80 
    Top = 360 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #23457#25209#21333#20301 
  end 
  object edtSPDW: TMaskEdit
    Left = 180 
    Top = 360 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtSPDW' 
  end 
  object lbl16: TStaticText
    Left = 80 
    Top = 384 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #23457#25209#20154 
  end 
  object edtSPR: TMaskEdit
    Left = 180 
    Top = 384 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtSPR' 
  end 
  object lbl17: TStaticText
    Left = 80 
    Top = 408 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #23457#25209#26102#38388 
  end 
  object edtSPSJ: TMaskEdit
    Left = 180 
    Top = 408 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtSPSJ' 
  end 
  object lbl18: TStaticText
    Left = 80 
    Top = 432 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #23457#25209#36864#22238#21407#22240 
  end 
  object edtSPTHYY: TMaskEdit
    Left = 180 
    Top = 432 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtSPTHYY' 
  end 
  object lbl19: TStaticText
    Left = 80 
    Top = 456 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #23457#25209#29366#24577 
  end 
  object edtSPZT: TMaskEdit
    Left = 180 
    Top = 456 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtSPZT' 
  end 
  object lbl20: TStaticText
    Left = 80 
    Top = 480 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #30003#35831#21333#20301 
  end 
  object edtSQDW: TMaskEdit
    Left = 180 
    Top = 480 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtSQDW' 
  end 
  object lbl21: TStaticText
    Left = 80 
    Top = 504 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #30003#35831#31867#21035 
  end 
  object edtSQLB: TMaskEdit
    Left = 180 
    Top = 504 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtSQLB' 
  end 
  object lbl22: TStaticText
    Left = 80 
    Top = 528 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #30003#35831#20154 
  end 
  object edtSQR: TMaskEdit
    Left = 180 
    Top = 528 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtSQR' 
  end 
  object lbl23: TStaticText
    Left = 80 
    Top = 552 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #30003#35831#26102#38388 
  end 
  object edtSQSJ: TMaskEdit
    Left = 180 
    Top = 552 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtSQSJ' 
  end 
  object lbl24: TStaticText
    Left = 80 
    Top = 576 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #35686#21153#36131#20219#21306 
  end 
  object edtSSJWQ: TMaskEdit
    Left = 180 
    Top = 576 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtSSJWQ' 
  end 
  object lbl25: TStaticText
    Left = 80 
    Top = 600 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #34892#25919#21306#21010 
  end 
  object edtSSXQ: TMaskEdit
    Left = 180 
    Top = 600 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtSSXQ' 
  end 
  object lbl26: TStaticText
    Left = 80 
    Top = 624 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #27004#26635#21518#32512 
  end 
  object edtZLHZ: TMaskEdit
    Left = 180 
    Top = 624 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtZLHZ' 
  end 
  object lbl27: TStaticText
    Left = 80 
    Top = 648 
    Width = 120 
    AutoSize = False 
    BorderStyle = sbsSingle 
    Color = clBtnFace 
    Alignment = taCenter 
    Height = 25 
    Caption = #27004#26635#21069#32512 
  end 
  object edtZLQZ: TMaskEdit
    Left = 180 
    Top = 648 
    AutoSize = False 
    Width = 121 
    Height = 25 
    Ctl3D = false 
    BorderStyle = bsSingle 
    Text = 'edtZLQZ' 
  end 
  
   object ZJB_SQSPBGYY: TWideStringField
       DisplayLabel = #21464#26356#21407#22240 
       DisplayWidth = 20 
       FieldName = 'BGYY' 
       Size = 100 
   end 
   object ZJB_SQSPBGZT: TWideStringField
       DisplayLabel = #21464#26356#29366#24577 
       DisplayWidth = 20 
       FieldName = 'BGZT' 
       Size = 1 
   end 
   object ZJB_SQSPBZLDBH: TWideStringField
       DisplayLabel = #26631#20934#27004#26635#32534#21495 
       DisplayWidth = 20 
       FieldName = 'BZLDBH' 
       Size = 1 
   end 
   object ZJB_SQSPFH: TWideStringField
       DisplayLabel = #21103#21495 
       DisplayWidth = 20 
       FieldName = 'FH' 
       Size = 4 
   end 
   object ZJB_SQSPFHHZ: TWideStringField
       DisplayLabel = #21103#21495#21518#32512 
       DisplayWidth = 20 
       FieldName = 'FHHZ' 
       Size = 1 
   end 
   object ZJB_SQSPID: TWideStringField
       DisplayLabel = #21807#19968#32534#21495 
       DisplayWidth = 20 
       FieldName = 'ID' 
       Size = 32 
   end 
   object ZJB_SQSPJLTS: TWideStringField
       DisplayLabel = #35760#24405#26465#25968 
       DisplayWidth = 20 
       FieldName = 'JLTS' 
       Size = 20 
   end 
   object ZJB_SQSPJLX: TWideStringField
       DisplayLabel = #34903#36335#24055 
       DisplayWidth = 20 
       FieldName = 'JLX' 
       Size = 12 
   end 
   object ZJB_SQSPLDH: TWideStringField
       DisplayLabel = #27004#26635#21495 
       DisplayWidth = 20 
       FieldName = 'LDH' 
       Size = 5 
   end 
   object ZJB_SQSPMAP_X: TWideStringField
       DisplayLabel = 'X'#22352#26631 
       DisplayWidth = 20 
       FieldName = 'MAP_X' 
       Size = 30 
   end 
   object ZJB_SQSPMAP_Y: TWideStringField
       DisplayLabel = 'Y'#22352#26631 
       DisplayWidth = 20 
       FieldName = 'MAP_Y' 
       Size = 30 
   end 
   object ZJB_SQSPMPH: TWideStringField
       DisplayLabel = #38376#29260#21495 
       DisplayWidth = 20 
       FieldName = 'MPH' 
       Size = 4 
   end 
   object ZJB_SQSPMPHZ: TWideStringField
       DisplayLabel = #38376#29260#21518#32512 
       DisplayWidth = 20 
       FieldName = 'MPHZ' 
       Size = 1 
   end 
   object ZJB_SQSPMPQZ: TWideStringField
       DisplayLabel = #38376#29260#21069#32512 
       DisplayWidth = 20 
       FieldName = 'MPQZ' 
       Size = 1 
   end 
   object ZJB_SQSPSPDW: TWideStringField
       DisplayLabel = #23457#25209#21333#20301 
       DisplayWidth = 20 
       FieldName = 'SPDW' 
       Size = 12 
   end 
   object ZJB_SQSPSPR: TWideStringField
       DisplayLabel = #23457#25209#20154 
       DisplayWidth = 20 
       FieldName = 'SPR' 
       Size = 10 
   end 
   object ZJB_SQSPSPSJ: TWideStringField
       DisplayLabel = #23457#25209#26102#38388 
       DisplayWidth = 20 
       FieldName = 'SPSJ' 
       Size = 14 
   end 
   object ZJB_SQSPSPTHYY: TWideStringField
       DisplayLabel = #23457#25209#36864#22238#21407#22240 
       DisplayWidth = 20 
       FieldName = 'SPTHYY' 
       Size = 100 
   end 
   object ZJB_SQSPSPZT: TWideStringField
       DisplayLabel = #23457#25209#29366#24577 
       DisplayWidth = 20 
       FieldName = 'SPZT' 
       Size = 1 
   end 
   object ZJB_SQSPSQDW: TWideStringField
       DisplayLabel = #30003#35831#21333#20301 
       DisplayWidth = 20 
       FieldName = 'SQDW' 
       Size = 12 
   end 
   object ZJB_SQSPSQLB: TWideStringField
       DisplayLabel = #30003#35831#31867#21035 
       DisplayWidth = 20 
       FieldName = 'SQLB' 
       Size = 1 
   end 
   object ZJB_SQSPSQR: TWideStringField
       DisplayLabel = #30003#35831#20154 
       DisplayWidth = 20 
       FieldName = 'SQR' 
       Size = 10 
   end 
   object ZJB_SQSPSQSJ: TWideStringField
       DisplayLabel = #30003#35831#26102#38388 
       DisplayWidth = 20 
       FieldName = 'SQSJ' 
       Size = 14 
   end 
   object ZJB_SQSPSSJWQ: TWideStringField
       DisplayLabel = #35686#21153#36131#20219#21306 
       DisplayWidth = 20 
       FieldName = 'SSJWQ' 
       Size = 12 
   end 
   object ZJB_SQSPSSXQ: TWideStringField
       DisplayLabel = #34892#25919#21306#21010 
       DisplayWidth = 20 
       FieldName = 'SSXQ' 
       Size = 6 
   end 
   object ZJB_SQSPZLHZ: TWideStringField
       DisplayLabel = #27004#26635#21518#32512 
       DisplayWidth = 20 
       FieldName = 'ZLHZ' 
       Size = 1 
   end 
   object ZJB_SQSPZLQZ: TWideStringField
       DisplayLabel = #27004#26635#21069#32512 
       DisplayWidth = 20 
       FieldName = 'ZLQZ' 
       Size = 2 
   end 
END 
  end

end
