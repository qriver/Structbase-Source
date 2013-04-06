object UPLOAD_LIST_MainForm: TUPLOAD_LIST_MainForm
  Left = 0
  Top = 0
  Caption = #31038#20250#25968#25454#37319#38598
  ClientHeight = 515
  ClientWidth = 731
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
    Width = 731
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
        Width = 717
        Height = 68
        Align = alTop
        BevelEdges = []
        BevelOuter = bvNone
        BorderWidth = 1
        BorderStyle = bsSingle
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object StaticText1: TStaticText
          Left = 7
          Top = 33
          Width = 92
          Height = 25
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
          TabOrder = 0
        end
        object edtPolice_Id: TMaskEdit
          Left = 98
          Top = 33
          Width = 246
          Height = 25
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
        object txt1: TStaticText
          Left = 7
          Top = 9
          Width = 92
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #25152#23646#21333#20301
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edtDWBM: TMaskEdit
          Left = 98
          Top = 9
          Width = 247
          Height = 25
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
        object txt3: TStaticText
          Left = 343
          Top = 9
          Width = 100
          Height = 25
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #23457#25209#29366#24577
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object edtSHZT: TMaskEdit
          Left = 442
          Top = 9
          Width = 231
          Height = 25
          AutoSize = False
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
      end
      object RzToolbar1: TRzToolbar
        Left = 5
        Top = 73
        Width = 717
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
        Top = 100
        Width = 717
        Height = 364
        Align = alClient
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        RootLevelOptions.DetailFrameColor = clHighlight
        ExplicitHeight = 355
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
          object cxGrid1DBTableView1Title: TcxGridDBColumn
            DataBinding.FieldName = 'Title'
            Width = 197
          end
          object cxGrid1DBTableView1DESCRIPTION: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRIPTION'
            Width = 121
          end
          object cxGrid1DBTableView1DWBM: TcxGridDBColumn
            DataBinding.FieldName = 'DWBM'
          end
          object cxGrid1DBTableView1DWMC: TcxGridDBColumn
            DataBinding.FieldName = 'DWMC'
            Width = 130
          end
          object cxGrid1DBTableView1FROM_DW: TcxGridDBColumn
            DataBinding.FieldName = 'FROM_DW'
            Width = 130
          end
          object cxGrid1DBTableView1JLTS: TcxGridDBColumn
            DataBinding.FieldName = 'JLTS'
            Width = 117
          end
          object cxGrid1DBTableView1LSH: TcxGridDBColumn
            DataBinding.FieldName = 'LSH'
            Width = 122
          end
          object cxGrid1DBTableView1LXDH: TcxGridDBColumn
            DataBinding.FieldName = 'LXDH'
            Width = 122
          end
          object cxGrid1DBTableView1POLICE_ID: TcxGridDBColumn
            DataBinding.FieldName = 'POLICE_ID'
            Width = 123
          end
          object cxGrid1DBTableView1POLICE_NAME: TcxGridDBColumn
            DataBinding.FieldName = 'POLICE_NAME'
            Width = 123
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
        Width = 717
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
      Caption = #25968#25454#32534#36753
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
    object UPLOAD_LISTTitle: TWideStringField
      DisplayLabel = #26631#39064
      DisplayWidth = 20
      FieldName = 'Title'
      Size = 100
    end
    object UPLOAD_LISTDESCRIPTION: TWideStringField
      DisplayLabel = #25968#25454#26469#28304#35828#26126
      DisplayWidth = 20
      FieldName = 'DESCRIPTION'
      Size = 2000
    end
    object UPLOAD_LISTDWBM: TWideStringField
      DisplayLabel = #35686#21592#25152#23646#21333#20301
      DisplayWidth = 20
      FieldName = 'DWBM'
      Size = 18
    end
    object UPLOAD_LISTDWMC: TWideStringField
      DisplayLabel = #35686#21592#25152#23646#21333#20301#21517#31216
      DisplayWidth = 20
      FieldName = 'DWMC'
      Size = 50
    end
    object UPLOAD_LISTFROM_DW: TWideStringField
      DisplayLabel = #25968#25454#26469#33258#21333#20301
      DisplayWidth = 20
      FieldName = 'FROM_DW'
      Size = 200
    end
    object UPLOAD_LISTJLTS: TWideStringField
      DisplayLabel = #35760#24405#26465#25968
      DisplayWidth = 20
      FieldName = 'JLTS'
    end
    object UPLOAD_LISTLSH: TWideStringField
      DisplayLabel = #27969#27700#21495
      DisplayWidth = 20
      FieldName = 'LSH'
      Size = 32
    end
    object UPLOAD_LISTLXDH: TWideStringField
      DisplayLabel = #32852#31995#30005#35805
      DisplayWidth = 20
      FieldName = 'LXDH'
      Size = 30
    end
    object UPLOAD_LISTPOLICE_ID: TWideStringField
      DisplayLabel = #35686#21592#32534#21495
      DisplayWidth = 20
      FieldName = 'POLICE_ID'
      Size = 6
    end
    object UPLOAD_LISTPOLICE_NAME: TWideStringField
      DisplayLabel = #35686#21592#22995#21517
      DisplayWidth = 20
      FieldName = 'POLICE_NAME'
    end
    object UPLOAD_LISTRESOURCE_ID: TWideStringField
      DisplayLabel = #36164#28304#31867#21035
      DisplayWidth = 20
      FieldName = 'RESOURCE_ID'
      Size = 32
    end
    object UPLOAD_LISTRK_COUNT: TWideStringField
      DisplayLabel = #20837#24211#25968#25454#25968#37327
      DisplayWidth = 20
      FieldName = 'RK_COUNT'
      Size = 50
    end
    object UPLOAD_LISTSFRK: TWideStringField
      DisplayLabel = #26159#21542#20837#24211
      DisplayWidth = 20
      FieldName = 'SFRK'
      Size = 1
    end
    object UPLOAD_LISTSH_RYBH: TWideStringField
      DisplayLabel = #23457#26680#20154#21592#32534#21495
      DisplayWidth = 20
      FieldName = 'SH_RYBH'
    end
    object UPLOAD_LISTSH_RYXM: TWideStringField
      DisplayLabel = #23457#26680#20154#21592#22995#21517
      DisplayWidth = 20
      FieldName = 'SH_RYXM'
    end
    object UPLOAD_LISTSHSJ: TWideStringField
      DisplayLabel = #23457#26680#26102#38388
      DisplayWidth = 20
      FieldName = 'SHSJ'
    end
    object UPLOAD_LISTSHSM: TWideStringField
      DisplayLabel = #23457#26680#35828#26126#20449#24687
      DisplayWidth = 20
      FieldName = 'SHSM'
      Size = 2000
    end
    object UPLOAD_LISTSHZT: TWideStringField
      DisplayLabel = #23457#26680#29366#24577
      DisplayWidth = 20
      FieldName = 'SHZT'
      Size = 1
    end
    object UPLOAD_LISTSJZT: TWideStringField
      DisplayLabel = #25968#25454#29366#24577
      DisplayWidth = 20
      FieldName = 'SJZT'
      Size = 1
    end
    object UPLOAD_LISTUPLOAD_TIME: TWideStringField
      DisplayLabel = #19978#20256#26102#38388
      DisplayWidth = 20
      FieldName = 'UPLOAD_TIME'
    end
    object UPLOAD_LISTWJLJ: TWideStringField
      DisplayLabel = #25991#20214#36335#24452
      DisplayWidth = 20
      FieldName = 'WJLJ'
      Size = 500
    end
  end
end
