object IPhoneMainForm: TIPhoneMainForm
  Left = 0
  Top = 0
  Caption = #31995#32479#31649#29702
  ClientHeight = 420
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rzpgcntrl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 651
    Height = 420
    ActivePage = TabSheet1
    Align = alClient
    Color = clGradientInactiveCaption
    ParentColor = False
    ShowCloseButtonOnActiveTab = True
    TabIndex = 0
    TabOrder = 0
    TabStyle = tsDoubleSlant
    OnClose = rzpgcntrl1Close
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Color = clGradientInactiveCaption
      Caption = #39318#39029
    end
  end
end
