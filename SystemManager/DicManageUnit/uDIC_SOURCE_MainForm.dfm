object DIC_SOURCE_MainForm: TDIC_SOURCE_MainForm
  Left = 0
  Top = 0
  Caption = #25968#25454#23383#20856#31649#29702
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
        Height = 84
        Align = alTop
        BevelEdges = []
        BevelOuter = bvNone
        BorderWidth = 1
        BorderStyle = bsSingle
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object edtAPPID: TMaskEdit
          Left = 124
          Top = 16
          Width = 121
          Height = 18
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
        end
        object lbl1: TStaticText
          Left = 24
          Top = 16
          Width = 101
          Height = 18
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #25152#23646#31995#32479
          TabOrder = 1
        end
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
          object cxGrid1DBTableView1APPID: TcxGridDBColumn
            DataBinding.FieldName = 'APPID'
            Width = 77
          end
          object cxGrid1DBTableView1DICID: TcxGridDBColumn
            DataBinding.FieldName = 'DICID'
            Width = 87
          end
          object cxGrid1DBTableView1DICNAME: TcxGridDBColumn
            DataBinding.FieldName = 'DICNAME'
            Width = 68
          end
          object cxGrid1DBTableView1DICCHINESENAME: TcxGridDBColumn
            DataBinding.FieldName = 'DICCHINESENAME'
            Width = 91
          end
          object cxGrid1DBTableView1DICSOURCETABLE: TcxGridDBColumn
            DataBinding.FieldName = 'DICSOURCETABLE'
            Width = 92
          end
          object cxGrid1DBTableView1DICFILTERSQL: TcxGridDBColumn
            DataBinding.FieldName = 'DICFILTERSQL'
            Width = 116
          end
          object cxGrid1DBTableView1DICKEYFIELD: TcxGridDBColumn
            DataBinding.FieldName = 'DICKEYFIELD'
            Width = 74
          end
          object cxGrid1DBTableView1DICVALFIELD: TcxGridDBColumn
            DataBinding.FieldName = 'DICVALFIELD'
            Width = 79
          end
          object cxGrid1DBTableView1DICFILENAME: TcxGridDBColumn
            DataBinding.FieldName = 'DICFILENAME'
            Width = 89
          end
          object cxGrid1DBTableView1DICLEVELMODE: TcxGridDBColumn
            DataBinding.FieldName = 'DICLEVELMODE'
            Width = 109
          end
          object cxGrid1DBTableView1DICPY: TcxGridDBColumn
            DataBinding.FieldName = 'DICPY'
            Width = 64
          end
          object cxGrid1DBTableView1STARTUP_LOAD: TcxGridDBColumn
            DataBinding.FieldName = 'STARTUP_LOAD'
            Width = 81
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
    FileName = 
      'D:\StructBase SDK\workspace\Delphi2010\SystemManager\bin\DevLoca' +
      'l.ini'
    Left = 480
    Top = 232
  end
  object CDS_TABLE: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 248
    object DIC_SOURCEAPPID: TStringField
      DisplayLabel = #25152#23646#31995#32479
      DisplayWidth = 20
      FieldName = 'APPID'
      Size = 30
    end
    object DIC_SOURCEDICCHINESENAME: TStringField
      DisplayLabel = #23383#20856#20013#25991#21517
      DisplayWidth = 20
      FieldName = 'DICCHINESENAME'
      Size = 30
    end
    object DIC_SOURCEDICFILENAME: TStringField
      DisplayLabel = #23383#20856#25991#20214#21517
      DisplayWidth = 20
      FieldName = 'DICFILENAME'
      Size = 30
    end
    object DIC_SOURCEDICFILTERSQL: TStringField
      DisplayLabel = #23383#20856#36807#28388'SQL'
      DisplayWidth = 20
      FieldName = 'DICFILTERSQL'
      Size = 100
    end
    object DIC_SOURCEDICID: TStringField
      DisplayLabel = #23383#20856#21807#19968#26631#35782
      DisplayWidth = 20
      FieldName = 'DICID'
    end
    object DIC_SOURCEDICKEYFIELD: TStringField
      DisplayLabel = 'KEY'#23383#27573#21517
      DisplayWidth = 20
      FieldName = 'DICKEYFIELD'
      Size = 30
    end
    object DIC_SOURCEDICLEVELMODE: TStringField
      DisplayLabel = #32423#21035#23383#20856#27169#24335#23450#20041
      DisplayWidth = 20
      FieldName = 'DICLEVELMODE'
      Size = 30
    end
    object DIC_SOURCEDICNAME: TStringField
      DisplayLabel = #23383#20856#21517#31216
      DisplayWidth = 20
      FieldName = 'DICNAME'
      Size = 30
    end
    object DIC_SOURCEDICPY: TStringField
      DisplayLabel = #25340#38899#36807#28388
      DisplayWidth = 20
      FieldName = 'DICPY'
      Size = 1
    end
    object DIC_SOURCEDICSOURCETABLE: TStringField
      DisplayLabel = #25968#25454#23383#20856#28304#34920
      DisplayWidth = 20
      FieldName = 'DICSOURCETABLE'
      Size = 30
    end
    object DIC_SOURCEDICVALFIELD: TStringField
      DisplayLabel = 'VALUE'#23383#27573#21517
      DisplayWidth = 20
      FieldName = 'DICVALFIELD'
      Size = 30
    end
    object DIC_SOURCESTARTUP_LOAD: TStringField
      DisplayLabel = #21551#21160#26102#21152#36733
      DisplayWidth = 20
      FieldName = 'STARTUP_LOAD'
      Size = 1
    end
  end
end
