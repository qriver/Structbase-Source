object UPLOAD_LIST_Form: TUPLOAD_LIST_Form
  Left = 194
  Top = 115
  Caption = #20225#19994#26723#26696#32500#25252
  ClientHeight = 412
  ClientWidth = 658
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
  object RzPageControl1: TRzPageControl
    Left = 8
    Top = 8
    Width = 642
    Height = 396
    ActivePage = TabSheet1
    TabIndex = 0
    TabOrder = 0
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = #25968#25454#32500#25252
      object panel1: TPanel
        Left = 16
        Top = 16
        Width = 601
        Height = 337
        Caption = 'panel1'
        TabOrder = 0
        object txtlbl2: TStaticText
          Left = 16
          Top = 59
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #36164#28304#31867#21035
          TabOrder = 3
        end
        object edtResource_id: TMaskEdit
          Left = 108
          Top = 59
          Width = 325
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 4
        end
        object txt1: TStaticText
          Left = 16
          Top = 131
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #19978#20256#35686#21592
          TabOrder = 5
        end
        object edtPOLICE_ID: TMaskEdit
          Left = 108
          Top = 131
          Width = 325
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 6
        end
        object txt2: TStaticText
          Left = 16
          Top = 155
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #19978#20256#21333#20301
          TabOrder = 7
        end
        object edtDWBM: TMaskEdit
          Left = 108
          Top = 155
          Width = 325
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 8
        end
        object txt5: TStaticText
          Left = 16
          Top = 178
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #19978#20256#26102#38388
          TabOrder = 9
        end
        object edtUPLOAD_TIME: TMaskEdit
          Left = 108
          Top = 178
          Width = 325
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 10
        end
        object txt4: TStaticText
          Left = 16
          Top = 201
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #25968#25454#26469#28304#21333#20301
          TabOrder = 11
        end
        object edtFROM_DW: TMaskEdit
          Left = 108
          Top = 201
          Width = 325
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 12
        end
        object edtDESCRIPTION: TMaskEdit
          Left = 108
          Top = 225
          Width = 325
          Height = 29
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 13
        end
        object txt3: TStaticText
          Left = 16
          Top = 225
          Width = 93
          Height = 29
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #22791#27880#35828#26126
          TabOrder = 15
        end
        object StaticText1: TStaticText
          Left = 16
          Top = 11
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #35760#24405#32534#21495
          TabOrder = 0
        end
        object edtLSH: TMaskEdit
          Left = 108
          Top = 11
          Width = 325
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
        end
        object btnSave: TRzBitBtn
          Left = 151
          Top = 292
          Width = 81
          Height = 31
          Caption = #20445#23384#25968#25454
          TabOrder = 16
          OnClick = btnSaveClick
          DisabledIndex = 55
          ImageIndex = 54
        end
        object edtTitle1: TStaticText
          Left = 16
          Top = 35
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #26631#39064
          TabOrder = 17
        end
        object edtTitle: TMaskEdit
          Left = 108
          Top = 35
          Width = 325
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
        end
        object StaticText2: TStaticText
          Left = 16
          Top = 251
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #32852#31995#30005#35805
          TabOrder = 18
        end
        object edtLXDH: TMaskEdit
          Left = 108
          Top = 251
          Width = 325
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 14
        end
        object txt6: TStaticText
          Left = 16
          Top = 83
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #35760#24405#26465#25968
          TabOrder = 19
        end
        object edtJLTS: TMaskEdit
          Left = 108
          Top = 83
          Width = 325
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 20
        end
        object txt7: TStaticText
          Left = 16
          Top = 107
          Width = 101
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #25968#25454#29366#24577
          TabOrder = 21
        end
        object edtSJZT: TMaskEdit
          Left = 108
          Top = 107
          Width = 325
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 22
        end
        object edtSHZT: TMaskEdit
          Left = 16
          Top = 299
          Width = 89
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 23
          Text = '0'
          Visible = False
        end
        object btnClose: TButton
          Left = 254
          Top = 293
          Width = 75
          Height = 29
          Caption = #20851#38381
          TabOrder = 24
          OnClick = btnCloseClick
        end
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = #19978#20256'Excel'#25991#20214
      object Panel2: TPanel
        Left = 18
        Top = 11
        Width = 392
        Height = 164
        TabOrder = 0
        object btnDisplay: TRzToolButton
          Left = 160
          Top = 116
          Width = 54
          Height = 22
          Alignment = taLeftJustify
          GradientColorStyle = gcsMSOffice
          ImageIndex = 184
          Images = MyDataModule.ImageListForBtns
          ShowCaption = True
          UseToolbarButtonLayout = False
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          UseToolbarVisualStyle = False
          VisualStyle = vsGradient
          Caption = #25171#24320
        end
        object Label1: TLabel
          Left = 27
          Top = 78
          Width = 60
          Height = 13
          Caption = #34920#26684#21517#31216#65306
        end
        object btnFileSelect: TRzBitBtn
          Left = 27
          Top = 18
          Width = 111
          Height = 26
          Caption = #36873#25321'Excel'#25991#20214
          TabOrder = 0
          DisabledIndex = 51
          ImageIndex = 50
        end
        object edtWJLJ: TMaskEdit
          Left = 144
          Top = 19
          Width = 225
          Height = 25
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object ComboBox1: TComboBox
          Left = 144
          Top = 73
          Width = 225
          Height = 21
          TabOrder = 2
          Text = 'ComboBox1'
        end
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = #27983#35272#19978#20256#25968#25454
      object StringGrid1: TStringGrid
        Left = 16
        Top = 16
        Width = 537
        Height = 297
        ColCount = 3
        RowCount = 3
        TabOrder = 0
        ColWidths = (
          80
          146
          143)
        RowHeights = (
          24
          22
          19)
      end
    end
  end
end
