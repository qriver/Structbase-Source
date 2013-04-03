object ZJB_SQSP_MainForm: TZJB_SQSP_MainForm
  Left = 0
  Top = 0
  Caption = #31034#33539'Form'
  ClientHeight = 515
  ClientWidth = 692
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rzPageCondition: TRzPageControl
    Left = 0
    Top = 0
    Width = 692
    Height = 515
    ActivePage = TabSheetDataModify
    Align = alClient
    Color = 16119543
    FlatColor = 10263441
    ParentColor = False
    ShowCloseButton = True
    TabColors.HighlightBar = 1350640
    TabIndex = 1
    TabOrder = 0
    TabStyle = tsBackSlant
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Color = 16119543
      Caption = #26597#35810#26465#20214
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      object pnlCondition: TPanel
        Left = 5
        Top = 5
        Width = 678
        Height = 84
        Align = alTop
        BevelEdges = []
        BevelOuter = bvNone
        BorderWidth = 1
        BorderStyle = bsSingle
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object RzToolbar1: TRzToolbar
        Left = 5
        Top = 89
        Width = 678
        Height = 27
        AutoResize = False
        AutoStyle = False
        Margin = 0
        TopMargin = 0
        RowHeight = 22
        ShowDivider = False
        TextOptions = ttoCustom
        WrapControls = False
        AutoSize = True
        BorderInner = fsNone
        BorderOuter = fsPopup
        BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
        BorderWidth = 0
        Color = clGradientInactiveCaption
        GradientColorStyle = gcsMSOffice
        TabOrder = 1
        VisualStyle = vsGradient
        ToolbarControls = (
          RzSpacer1
          RzBtnLookup
          RzSpacer2
          RzBtnCount
          RzSpacer3
          RzSpacer4
          btnAddnew
          btnDelete
          btnModify
          btnDisplay)
        object RzBtnLookup: TRzToolButton
          Left = 8
          Top = 1
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
          Top = 1
          Grooved = True
        end
        object RzBtnCount: TRzToolButton
          Left = 65
          Top = 1
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
          Top = 1
          Grooved = True
        end
        object RzSpacer3: TRzSpacer
          Left = 113
          Top = 1
          Grooved = True
        end
        object RzSpacer4: TRzSpacer
          Left = 121
          Top = 1
          Width = 48
        end
        object btnAddnew: TRzToolButton
          Left = 169
          Top = 1
          Width = 52
          Alignment = taLeftJustify
          GradientColorStyle = gcsMSOffice
          ImageIndex = 58
          Images = MyDataModule.ImageListForBtns
          ShowCaption = True
          UseToolbarButtonLayout = False
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          UseToolbarVisualStyle = False
          VisualStyle = vsGradient
          Caption = #26032#22686
          OnClick = btnAddnewClick
        end
        object btnDelete: TRzToolButton
          Left = 221
          Top = 1
          Width = 52
          Alignment = taLeftJustify
          GradientColorStyle = gcsMSOffice
          ImageIndex = 133
          Images = MyDataModule.ImageListForBtns
          ShowCaption = True
          UseToolbarButtonLayout = False
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          UseToolbarVisualStyle = False
          VisualStyle = vsGradient
          Caption = #21024#38500
        end
        object btnModify: TRzToolButton
          Left = 273
          Top = 1
          Width = 52
          Alignment = taLeftJustify
          GradientColorStyle = gcsMSOffice
          ImageIndex = 137
          Images = MyDataModule.ImageListForBtns
          ShowCaption = True
          UseToolbarButtonLayout = False
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          UseToolbarVisualStyle = False
          VisualStyle = vsGradient
          Caption = #20462#25913
          OnClick = btnModifyClick
        end
        object btnDisplay: TRzToolButton
          Left = 325
          Top = 1
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
        Top = 116
        Width = 678
        Height = 348
        Align = alClient
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        RootLevelOptions.DetailFrameColor = clHighlight
        ExplicitHeight = 339
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
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
          Options.DetailFrameColor = clHighlight
          Options.DetailFrameWidth = 3
        end
      end
      object RzToolbar3: TRzToolbar
        Left = 5
        Top = 464
        Width = 678
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
        TabOrder = 3
        VisualStyle = vsGradient
        ExplicitTop = 455
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
          OnClick = cxSpinPageNoClick
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
    end
    object TabSheetDataModify: TRzTabSheet
      Color = 16119543
      Caption = 'TabSheetDataModify'
    end
  end
  object DataSource1: TDataSource
    DataSet = CDS_TABLE
    Left = 176
    Top = 248
  end
  object cxLocalizer1: TcxLocalizer
    Left = 480
    Top = 232
  end
  object CDS_TABLE: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 248
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
  end
end
