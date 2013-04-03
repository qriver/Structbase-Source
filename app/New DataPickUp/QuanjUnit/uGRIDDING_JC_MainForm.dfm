object Gridding_JC_MainForm: TGridding_JC_MainForm
  Left = 0
  Top = 0
  Caption = #26816#26597#30417#30563
  ClientHeight = 458
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rzPageCondition: TRzPageControl
    Left = 0
    Top = 0
    Width = 668
    Height = 458
    ActivePage = TabSheet1
    Align = alClient
    Color = 16119543
    FlatColor = 10263441
    ParentColor = False
    ShowCloseButton = True
    TabColors.HighlightBar = 1350640
    TabIndex = 0
    TabOrder = 0
    TabOrientation = toLeft
    TabSequence = tsReverse
    TabStyle = tsCutCorner
    FixedDimension = 63
    object TabSheet1: TRzTabSheet
      Color = 16119543
      Caption = #25968#25454#25277#26597
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      object RzToolbar1: TRzToolbar
        Left = 5
        Top = 102
        Width = 593
        Height = 22
        AutoStyle = False
        Margin = 0
        TopMargin = 0
        RowHeight = 22
        ShowDivider = False
        TextOptions = ttoCustom
        WrapControls = False
        BorderInner = fsNone
        BorderOuter = fsPopup
        BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
        BorderWidth = 0
        Color = clWhite
        GradientColorStyle = gcsMSOffice
        TabOrder = 0
        VisualStyle = vsGradient
        ToolbarControls = (
          RzSpacer1
          RzBtnLookup
          RzSpacer2
          RzBtnCount
          RzSpacer3
          RzSpacer4
          btnDisplay)
        object RzBtnLookup: TRzToolButton
          Left = 8
          Top = -1
          Width = 49
          GradientColorStyle = gcsCustom
          ImageIndex = 251
          Images = MyDataModule.ImageListForBtns
          ShowCaption = True
          UseToolbarButtonLayout = False
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          UseToolbarVisualStyle = False
          VisualStyle = vsClassic
          Caption = #26597#35810
          OnClick = RzBtnLookupClick
        end
        object RzSpacer1: TRzSpacer
          Left = 0
          Top = -1
          Grooved = True
        end
        object RzBtnCount: TRzToolButton
          Left = 65
          Top = -1
          Width = 48
          GradientColorStyle = gcsCustom
          ImageIndex = 181
          Images = MyDataModule.ImageListForBtns
          ShowCaption = True
          UseToolbarButtonLayout = False
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          UseToolbarVisualStyle = False
          VisualStyle = vsClassic
          Caption = #35745#25968
        end
        object RzSpacer2: TRzSpacer
          Left = 57
          Top = -1
          Grooved = True
        end
        object RzSpacer3: TRzSpacer
          Left = 113
          Top = -1
          Grooved = True
        end
        object RzSpacer4: TRzSpacer
          Left = 121
          Top = -1
          Width = 48
        end
        object btnDisplay: TRzToolButton
          Left = 169
          Top = -1
          Width = 52
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
          Caption = #26174#31034
          OnClick = btnDisplayClick
        end
      end
      object cxGrid1: TcxGrid
        Left = 5
        Top = 124
        Width = 593
        Height = 304
        Align = alClient
        TabOrder = 1
        LookAndFeel.Kind = lfOffice11
        RootLevelOptions.DetailFrameColor = clHighlight
        ExplicitHeight = 295
        object cxGrid1DBTableView1: TcxGridDBTableView
          DragMode = dmAutomatic
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = DataSource1
          DataController.Filter.MaxValueListCount = 1000
          DataController.KeyFieldNames = 'colName'
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = #20849'##0'#20154
              Kind = skCount
              FieldName = 'PERSON_KEY'
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #24635#35745':'
              Kind = skCount
            end
            item
              Format = #20849'0'#20154
              Kind = skCount
              FieldName = 'DENG_JI_SHI_JIAN'
            end>
          DataController.Summary.SummaryGroups = <>
          Filtering.ColumnPopup.MaxDropDownItemCount = 12
          OptionsBehavior.CellHints = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsCustomize.ColumnHiding = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.InvertSelect = False
          OptionsSelection.MultiSelect = True
          OptionsView.GridLineColor = 11299354
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          OptionsView.Indicator = True
          Preview.AutoHeight = False
          Preview.MaxLineCount = 2
          Preview.Visible = True
          object cxGrid1DBTableView1TITLE: TcxGridDBColumn
            DataBinding.FieldName = 'TITLE'
            Width = 168
          end
          object cxGrid1DBTableView1DWBM: TcxGridDBColumn
            DataBinding.FieldName = 'DWBM'
            Width = 131
          end
          object cxGrid1DBTableView1DWMC: TcxGridDBColumn
            DataBinding.FieldName = 'DWMC'
            Width = 133
          end
          object cxGrid1DBTableView1GLDW: TcxGridDBColumn
            DataBinding.FieldName = 'GLDW'
            Width = 133
          end
          object cxGrid1DBTableView1DESCRIPTION: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRIPTION'
            Visible = False
            Width = 138
          end
          object cxGrid1DBTableView1LSH: TcxGridDBColumn
            DataBinding.FieldName = 'LSH'
            Width = 131
          end
          object cxGrid1DBTableView1LXDH: TcxGridDBColumn
            DataBinding.FieldName = 'LXDH'
            Width = 132
          end
          object cxGrid1DBTableView1POLICE_ID: TcxGridDBColumn
            DataBinding.FieldName = 'POLICE_ID'
          end
          object cxGrid1DBTableView1POLICE_NAME: TcxGridDBColumn
            DataBinding.FieldName = 'POLICE_NAME'
          end
          object cxGrid1DBTableView1RESOURCE_ID: TcxGridDBColumn
            DataBinding.FieldName = 'RESOURCE_ID'
          end
          object cxGrid1DBTableView1SHDW: TcxGridDBColumn
            DataBinding.FieldName = 'SHDW'
            Visible = False
            SortIndex = 0
            SortOrder = soDescending
          end
          object cxGrid1DBTableView1SHSJ: TcxGridDBColumn
            DataBinding.FieldName = 'SHSJ'
          end
          object cxGrid1DBTableView1SHSM: TcxGridDBColumn
            DataBinding.FieldName = 'SHSM'
            Width = 129
          end
          object cxGrid1DBTableView1SHZT: TcxGridDBColumn
            DataBinding.FieldName = 'SHZT'
          end
          object cxGrid1DBTableView1SH_RYBH: TcxGridDBColumn
            DataBinding.FieldName = 'SH_RYBH'
          end
          object cxGrid1DBTableView1SH_RYXM: TcxGridDBColumn
            DataBinding.FieldName = 'SH_RYXM'
          end
          object cxGrid1DBTableView1SSWG: TcxGridDBColumn
            DataBinding.FieldName = 'SSWG'
          end
          object cxGrid1DBTableView1UPLOAD_TIME: TcxGridDBColumn
            DataBinding.FieldName = 'UPLOAD_TIME'
          end
          object cxGrid1DBTableView1Column1: TcxGridDBColumn
            Visible = False
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
          Options.DetailFrameColor = clHighlight
          Options.DetailFrameWidth = 3
        end
      end
      object RzToolbar3: TRzToolbar
        Left = 5
        Top = 428
        Width = 593
        Height = 23
        Align = alBottom
        AutoResize = False
        AutoStyle = False
        Margin = 0
        TopMargin = 0
        RowHeight = 22
        ButtonWidth = 22
        ButtonHeight = 22
        ShowDivider = False
        TextOptions = ttoCustom
        WrapControls = False
        AutoSize = True
        BorderInner = fsNone
        BorderOuter = fsPopup
        BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
        BorderWidth = 0
        Color = clGradientInactiveCaption
        Ctl3D = False
        GradientColorStyle = gcsMSOffice
        ParentCtl3D = False
        TabOrder = 2
        VisualStyle = vsGradient
        ExplicitTop = 419
        ToolbarControls = (
          cxSpinPageNo
          cxSpinPageNum)
        object cxSpinPageNo: TcxSpinEdit
          Left = 0
          Top = 1
          Properties.DisplayFormat = #31532'0'#39029
          Properties.MaxValue = 100000000.000000000000000000
          Properties.MinValue = 1.000000000000000000
          Properties.SpinButtons.Position = sbpHorzLeftRight
          Properties.SpinButtons.ShowFastButtons = True
          TabOrder = 0
          Value = 1
          Width = 106
        end
        object cxSpinPageNum: TcxSpinEdit
          Left = 106
          Top = 1
          Properties.DisplayFormat = #27599#39029'0'#26465#35760#24405
          Properties.Increment = 100.000000000000000000
          Properties.LargeIncrement = 100.000000000000000000
          Properties.MaxValue = 100000000.000000000000000000
          Properties.MinValue = 1.000000000000000000
          Properties.ReadOnly = True
          Properties.SpinButtons.Position = sbpHorzLeftRight
          Properties.SpinButtons.ShowFastButtons = True
          TabOrder = 1
          Value = 100
          Width = 151
        end
      end
      object pnlCondition: TPanel
        Left = 5
        Top = 5
        Width = 593
        Height = 97
        Align = alTop
        BevelEdges = []
        BevelOuter = bvNone
        BorderWidth = 1
        BorderStyle = bsSingle
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        object txt1: TStaticText
          Left = 238
          Top = 38
          Width = 113
          Height = 21
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #27966#20986#25152#23457#25209#26102#38388
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtPolice_Id: TMaskEdit
          Left = 349
          Top = 16
          Width = 100
          Height = 24
          AutoSize = False
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object txt5: TStaticText
          Left = 5
          Top = 38
          Width = 107
          Height = 21
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #25152#23646#27966#20986#25152
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edtSHDW: TMaskEdit
          Left = 111
          Top = 38
          Width = 129
          Height = 21
          AutoSize = False
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
        object StaticText1: TStaticText
          Left = 446
          Top = 38
          Width = 104
          Height = 21
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #27966#20986#25152#23457#25209#29366#24577
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object txt2: TStaticText
          Left = 239
          Top = 16
          Width = 111
          Height = 23
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
          TabOrder = 5
        end
        object edtSHSJ: TMaskEdit
          Left = 349
          Top = 38
          Width = 99
          Height = 21
          AutoSize = False
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
        end
        object edtSHZT: TMaskEdit
          Left = 549
          Top = 38
          Width = 86
          Height = 21
          AutoSize = False
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 7
        end
        object StaticText2: TStaticText
          Left = 5
          Top = 58
          Width = 107
          Height = 21
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #25152#23646#20998#23616#31185#23460
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object edtFJSPDW: TMaskEdit
          Left = 111
          Top = 58
          Width = 130
          Height = 21
          AutoSize = False
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 9
        end
        object StaticText3: TStaticText
          Left = 239
          Top = 58
          Width = 113
          Height = 21
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #20998#23616#23457#25209#26102#38388
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object edtFJSPSJ: TMaskEdit
          Left = 349
          Top = 58
          Width = 99
          Height = 21
          AutoSize = False
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 11
        end
        object StaticText4: TStaticText
          Left = 5
          Top = 16
          Width = 107
          Height = 23
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #19994#21153#24402#21475#21333#20301
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object edtGLDW: TMaskEdit
          Left = 111
          Top = 16
          Width = 129
          Height = 23
          AutoSize = False
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 13
        end
        object StaticText5: TStaticText
          Left = 447
          Top = 58
          Width = 104
          Height = 21
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #20998#23616#23457#25209#29366#24577
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
        object edtFJSPZT: TMaskEdit
          Left = 549
          Top = 58
          Width = 86
          Height = 21
          AutoSize = False
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 15
        end
        object StaticText6: TStaticText
          Left = 447
          Top = 16
          Width = 103
          Height = 23
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #27665#35686#30331#35760#26102#38388
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
        end
        object edtUPLOAD_TIME: TMaskEdit
          Left = 549
          Top = 16
          Width = 86
          Height = 23
          AutoSize = False
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 17
        end
      end
    end
    object TabSheet2: TRzTabSheet
      Color = 16119543
      Caption = #25968#25454#32479#35745
    end
    object TabSheet3: TRzTabSheet
      Color = 16119543
      Caption = #36229#26399#23457#25209
    end
  end
  object DataSource1: TDataSource
    DataSet = CDS_TABLE
    Left = 176
    Top = 248
  end
  object cxLocalizer1: TcxLocalizer
    FileName = '.\bin\DevLocal.ini'
    Left = 480
    Top = 232
  end
  object CDS_TABLE: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 248
    object GRIDDING_DJDESCRIPTION: TStringField
      DisplayLabel = #20449#24687#25551#36848#20449#24687
      DisplayWidth = 20
      FieldName = 'DESCRIPTION'
      Size = 500
    end
    object GRIDDING_DJDWBM: TStringField
      DisplayLabel = #21333#20301#32534#30721
      DisplayWidth = 20
      FieldName = 'DWBM'
      Size = 12
    end
    object GRIDDING_DJDWMC: TStringField
      DisplayLabel = #21333#20301#21517#31216
      DisplayWidth = 20
      FieldName = 'DWMC'
      Size = 50
    end
    object GRIDDING_DJGLDW: TStringField
      DisplayLabel = #31649#29702#21333#20301
      DisplayWidth = 20
      FieldName = 'GLDW'
      Size = 12
    end
    object GRIDDING_DJLSH: TStringField
      DisplayLabel = #27969#27700#21495
      DisplayWidth = 20
      FieldName = 'LSH'
      Size = 32
    end
    object GRIDDING_DJLXDH: TStringField
      DisplayLabel = #32852#31995#30005#35805
      DisplayWidth = 20
      FieldName = 'LXDH'
      Size = 50
    end
    object GRIDDING_DJPOLICE_ID: TStringField
      DisplayLabel = #35686#21592#32534#21495
      DisplayWidth = 20
      FieldName = 'POLICE_ID'
      Size = 6
    end
    object GRIDDING_DJPOLICE_NAME: TStringField
      DisplayLabel = #35686#21592#22995#21517
      DisplayWidth = 20
      FieldName = 'POLICE_NAME'
    end
    object GRIDDING_DJRESOURCE_ID: TStringField
      DisplayLabel = #36164#28304#32534#21495
      DisplayWidth = 20
      FieldName = 'RESOURCE_ID'
      Size = 32
    end
    object GRIDDING_DJSHDW: TStringField
      DisplayLabel = #23457#26680#21333#20301
      DisplayWidth = 20
      FieldName = 'SHDW'
      Size = 12
    end
    object GRIDDING_DJSHSJ: TStringField
      DisplayLabel = #23457#26680#26102#38388
      DisplayWidth = 20
      FieldName = 'SHSJ'
    end
    object GRIDDING_DJSHSM: TStringField
      DisplayLabel = #23457#26680#35828#26126
      DisplayWidth = 20
      FieldName = 'SHSM'
      Size = 200
    end
    object GRIDDING_DJSHZT: TStringField
      DisplayLabel = #23457#26680#29366#24577
      DisplayWidth = 20
      FieldName = 'SHZT'
      Size = 1
    end
    object GRIDDING_DJSH_RYBH: TStringField
      DisplayLabel = #23457#26680#20154#21592#32534#21495
      DisplayWidth = 20
      FieldName = 'SH_RYBH'
    end
    object GRIDDING_DJSH_RYXM: TStringField
      DisplayLabel = #23457#26680#20154#21592#20449#24687
      DisplayWidth = 20
      FieldName = 'SH_RYXM'
    end
    object GRIDDING_DJSSWG: TStringField
      DisplayLabel = #25152#23646#32593#26684
      DisplayWidth = 20
      FieldName = 'SSWG'
      Size = 50
    end
    object GRIDDING_DJTITLE: TStringField
      DisplayLabel = #26631#39064
      DisplayWidth = 20
      FieldName = 'TITLE'
      Size = 500
    end
    object GRIDDING_DJUPLOAD_TIME: TStringField
      DisplayLabel = #19978#20256#26102#38388
      DisplayWidth = 20
      FieldName = 'UPLOAD_TIME'
    end
  end
end
