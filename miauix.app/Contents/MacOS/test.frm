object Features: TfrmDesign
  Left = 211
  Height = 420
  Top = 107
  Width = 612
  HelpType = htKeyword
  HelpKeyword = 'passingvariables'
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '$TITLE$ Setup'
  ClientHeight = 420
  ClientWidth = 612
  Color = clWhite
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  LCLVersion = '3.4.0.0'
  object AeroPngImage1: TImage
    Left = 35
    Height = 16
    Top = 6
    Width = 16
  end
  object GlowLabel1: TStaticText
    Left = 51
    Height = 27
    Top = 0
    Width = 200
    Caption = '$TITLE$ Setup - InstallAware Wizard'
    Font.CharSet = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    ParentFont = False
    TabOrder = 8
  end
  object Shape2: TShape
    Left = 0
    Height = 1
    Top = 379
    Width = 612
    Align = alBottom
    Brush.Color = 14671839
    Pen.Color = 14671839
  end
  object Label1: TLabel
    Left = 40
    Height = 18
    Top = 56
    Width = 102
    Caption = 'Choose folder'
    Font.Color = 10040064
    Font.Height = -16
    Font.Name = 'Segoe UI'
    ParentFont = False
  end
  object Shape1: TShape
    Left = 40
    Height = 39
    Top = 320
    Width = 553
    Pen.Color = 16764057
  end
  object Panel: TPanel
    Left = 0
    Height = 40
    Top = 380
    Width = 612
    Align = alBottom
    BevelOuter = bvNone
    ClientHeight = 40
    ClientWidth = 612
    ParentBackground = False
    TabOrder = 1
    object Next: TButton
      Tag = 1
      Left = 459
      Height = 23
      Top = 8
      Width = 68
      Caption = '&Next'
      Default = True
      TabOrder = 0
    end
    object Cancel: TButton
      Tag = 3
      Left = 534
      Height = 23
      Top = 8
      Width = 68
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 1
    end
  end
  object Folder: TShellTreeView
    Tag = 1
    Left = 40
    Height = 161
    Hint = 'TARGETDIR'
    Top = 96
    Width = 553
    FileSortType = fstNone
    Indent = 19
    TabOrder = 3
    ObjectTypes = [otFolders]
  end
  object StaticText4: TStaticText
    Tag = 5
    Left = 168
    Height = 19
    Top = 288
    Width = 87
    Caption = 'Space available:'
    TabOrder = 4
  end
  object StaticText3: TStaticText
    Tag = 4
    Left = 168
    Height = 19
    Top = 272
    Width = 114
    Caption = 'Total space required:'
    TabOrder = 5
  end
  object StaticText2: TStaticText
    Left = 40
    Height = 19
    Top = 288
    Width = 87
    Caption = 'Space available:'
    TabOrder = 6
  end
  object StaticText1: TStaticText
    Left = 40
    Height = 19
    Top = 272
    Width = 114
    Caption = 'Total space required:'
    TabOrder = 7
  end
  object TargetDir: TEdit
    Tag = 2
    Left = 48
    Height = 20
    Hint = 'TARGETDIR'
    Top = 328
    Width = 537
    TabOrder = 0
  end
  object Back: TButton
    Tag = 2
    Left = -3
    Height = 34
    Top = -3
    Width = 34
    TabOrder = 2
  end
  object VistaGlass1: TPanel
    Left = 0
    Height = 0
    Top = 0
    Width = 0
    ParentBackground = False
    TabOrder = 9
  end
end
