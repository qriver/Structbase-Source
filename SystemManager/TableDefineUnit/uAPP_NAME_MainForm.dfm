object APP_NAME_MainForm: TAPP_NAME_MainForm
  Left = 0
  Top = 0
  Caption = #24212#29992#31995#32479#32500#25252
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
    ActivePage = TabSheet1
    Align = alClient
    Color = 16119543
    FlatColor = 10263441
    ParentColor = False
    ShowCloseButton = True
    TabColors.HighlightBar = 1350640
    TabIndex = 0
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
        Height = 36
        Align = alTop
        BevelEdges = []
        BevelOuter = bvNone
        BorderWidth = 1
        BorderStyle = bsSingle
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object lbl1: TStaticText
          Left = 13
          Top = 8
          Width = 120
          Height = 21
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #31995#32479#32534#21495
          TabOrder = 0
        end
        object edtAPPID: TMaskEdit
          Left = 113
          Top = 8
          Width = 121
          Height = 21
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          Text = 'edtAPPID'
        end
      end
      object RzToolbar1: TRzToolbar
        Left = 5
        Top = 41
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
        ExplicitTop = 89
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
        Top = 68
        Width = 678
        Height = 396
        Align = alClient
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        RootLevelOptions.DetailFrameColor = clHighlight
        ExplicitTop = 116
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
          object cxGrid1DBTableView1APPID: TcxGridDBColumn
            DataBinding.FieldName = 'APPID'
            Width = 123
          end
          object cxGrid1DBTableView1APPNAME: TcxGridDBColumn
            DataBinding.FieldName = 'APPNAME'
            Width = 134
          end
          object cxGrid1DBTableView1DB_SCHEMA: TcxGridDBColumn
            DataBinding.FieldName = 'DB_SCHEMA'
          end
          object cxGrid1DBTableView1DATASOURCE: TcxGridDBColumn
            DataBinding.FieldName = 'DATASOURCE'
            Width = 122
          end
          object cxGrid1DBTableView1META_DATASOURCE: TcxGridDBColumn
            DataBinding.FieldName = 'META_DATASOURCE'
            Width = 125
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
    object APP_NAMEAPPID: TWideStringField
      DisplayLabel = #31995#32479#32534#21495
      DisplayWidth = 20
      FieldName = 'APPID'
      Size = 32
    end
    object APP_NAMEAPPNAME: TWideStringField
      DisplayLabel = #31995#32479#35828#26126
      DisplayWidth = 20
      FieldName = 'APPNAME'
      Size = 100
    end
    object APP_NAMEDATASOURCE: TWideStringField
      DisplayLabel = #25968#25454#28304#23450#20041
      DisplayWidth = 20
      FieldName = 'DATASOURCE'
      Size = 50
    end
    object APP_NAMEDB_SCHEMA: TWideStringField
      DisplayLabel = #34920#27169#24335#21517
      DisplayWidth = 20
      FieldName = 'DB_SCHEMA'
      Size = 50
    end
    object APP_NAMEMETA_DATASOURCE: TWideStringField
      DisplayLabel = #20803#25968#25454#25968#25454#28304
      DisplayWidth = 20
      FieldName = 'META_DATASOURCE'
      Size = 200
    end
  end
end
