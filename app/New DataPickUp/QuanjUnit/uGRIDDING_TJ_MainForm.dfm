object GRIDDING_TJ_MAINFORM: TGRIDDING_TJ_MAINFORM
  Left = 0
  Top = 0
  Caption = #32479#35745#27719#24635
  ClientHeight = 484
  ClientWidth = 726
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
    Width = 726
    Height = 484
    ActivePage = TabSheet1
    Align = alClient
    Color = 16119543
    FlatColor = 10263441
    ParentColor = False
    ShowCloseButton = True
    TabColors.HighlightBar = 1350640
    TabIndex = 0
    TabOrder = 0
    TabStyle = tsCutCorner
    TextAlignment = haRight
    TextAlignmentVertical = vaTop
    FixedDimension = 20
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
        Width = 712
        Height = 60
        Align = alTop
        BevelEdges = []
        BevelOuter = bvNone
        BorderWidth = 1
        BorderStyle = bsSingle
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object txt4: TStaticText
          Left = 15
          Top = 17
          Width = 92
          Height = 26
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #36215#22987#26102#38388
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtQSSJ: TMaskEdit
          Left = 106
          Top = 17
          Width = 111
          Height = 26
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
        object txt3: TStaticText
          Left = 216
          Top = 17
          Width = 100
          Height = 26
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSingle
          Caption = #32456#27490#26102#38388
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edtZZSJ: TMaskEdit
          Left = 313
          Top = 17
          Width = 136
          Height = 26
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
      end
      object RzToolbar1: TRzToolbar
        Left = 5
        Top = 65
        Width = 712
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
          RzToolButton1
          RzToolButton2)
        object RzBtnLookup: TRzToolButton
          Left = 8
          Top = 1
          Width = 99
          GradientColorStyle = gcsCustom
          ImageIndex = 251
          Images = MyDataModule.ImageListForBtns
          ShowCaption = True
          UseToolbarButtonLayout = False
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          UseToolbarVisualStyle = False
          VisualStyle = vsClassic
          Caption = #25353#32593#26684#32479#35745
          OnClick = RzBtnLookupClick
        end
        object RzSpacer1: TRzSpacer
          Left = 0
          Top = 1
          Grooved = True
        end
        object RzToolButton1: TRzToolButton
          Left = 107
          Top = 1
          Width = 150
          GradientColorStyle = gcsCustom
          ImageIndex = 251
          Images = MyDataModule.ImageListForBtns
          ShowCaption = True
          UseToolbarButtonLayout = False
          UseToolbarButtonSize = False
          UseToolbarShowCaption = False
          UseToolbarVisualStyle = False
          VisualStyle = vsClassic
          Caption = #25353#20449#24687#31867#21035#32479#35745
          OnClick = RzToolButton1Click
        end
        object RzToolButton2: TRzToolButton
          Left = 257
          Top = 1
          ImageIndex = 57
          Images = MyDataModule.ImageListForBtns
          OnClick = RzToolButton2Click
        end
      end
      object cxGrid1: TcxGrid
        Left = 5
        Top = 92
        Width = 712
        Height = 363
        Align = alClient
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        RootLevelOptions.DetailFrameColor = clHighlight
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
            end
            item
              Kind = skSum
              Column = cxGrid1DBTableView1SL
            end>
          DataController.Summary.FooterSummaryItems = <>
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
          OptionsView.HeaderAutoHeight = True
          OptionsView.Indicator = True
          Preview.AutoHeight = False
          Preview.MaxLineCount = 2
          Preview.Visible = True
          object cxGrid1DBTableView1FJSPDW: TcxGridDBColumn
            DataBinding.FieldName = 'FJSPDW'
            Width = 224
          end
          object cxGrid1DBTableView1SHDW: TcxGridDBColumn
            DataBinding.FieldName = 'SHDW'
            Width = 207
          end
          object cxGrid1DBTableView1SJ: TcxGridDBColumn
            DataBinding.FieldName = 'POLICE_ID'
            Width = 148
          end
          object cxGrid1DBTableView1SL: TcxGridDBColumn
            DataBinding.FieldName = 'SL'
            Width = 128
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
          Options.DetailFrameColor = clHighlight
          Options.DetailFrameWidth = 3
        end
      end
      object Memo1: TMemo
        Left = 48
        Top = 216
        Width = 214
        Height = 145
        Lines.Strings = (
          'select fjspdw,shdw,police_id ,count'
          '(police_id)  sl   from  '
          '('
          'select  substr(shdw,0,6) || '#39'000000'#39'  '
          'fjspdw,shdw  shdw,police_id    '
          'from   '
          'data_resource.gridding_dj   %s'
          ')   group by fjspdw,shdw,police_id    ')
        TabOrder = 3
        Visible = False
      end
      object Memo2: TMemo
        Left = 288
        Top = 152
        Width = 233
        Height = 137
        Lines.Strings = (
          'select fjspdw,shdw,resource_id ,count'
          '(resource_id)  sl   from  '
          '('
          'select  substr(shdw,0,6) || '#39'000000'#39'  '
          'fjspdw,shdw  shdw,resource_id  '
          'from   '
          'data_resource.gridding_dj   %s'
          ')   group by fjspdw,shdw,resource_id')
        TabOrder = 4
        Visible = False
      end
    end
  end
  object CDS_TABLE: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 560
    Top = 208
    object CDS_TABLEFJSPDW: TStringField
      DisplayLabel = #20844#23433#20998#23616
      FieldName = 'FJSPDW'
      Size = 200
    end
    object CDS_TABLESHDW: TStringField
      DisplayLabel = #27966#20986#25152
      FieldName = 'SHDW'
      Size = 200
    end
    object CDS_TABLESJ: TStringField
      DisplayLabel = #32593#26684#35686#21592
      FieldName = 'POLICE_ID'
      Size = 10
    end
    object CDS_TABLESL: TIntegerField
      FieldName = 'SL'
    end
  end
  object DataSource1: TDataSource
    DataSet = CDS_TABLE
    Left = 488
    Top = 176
  end
  object cxLocalizer1: TcxLocalizer
    FileName = '.\bin\DevLocal.ini'
    Left = 480
    Top = 232
  end
  object PrintDialog1: TPrintDialog
    Left = 352
    Top = 248
  end
  object SaveDialog1: TSaveDialog
    Left = 432
    Top = 344
  end
end
