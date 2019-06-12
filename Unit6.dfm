object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Form6'
  ClientHeight = 242
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 288
    Top = 40
    Width = 105
    Height = 105
  end
  object Button1: TButton
    Left = 88
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'C:\SOFT-ROM\banco\SR_BD.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    Left = 16
    Top = 16
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 64
    Top = 16
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Left = 24
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 56
    Top = 56
  end
  object IBDatabase2: TIBDatabase
    DatabaseName = 'C:\SOFT-ROM\banco\SR_BD2.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    Left = 176
    Top = 16
  end
  object IBTransaction2: TIBTransaction
    DefaultDatabase = IBDatabase2
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 224
    Top = 16
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase2
    Transaction = IBTransaction2
    Left = 176
    Top = 64
  end
  object DataSource2: TDataSource
    DataSet = IBQuery2
    Left = 208
    Top = 64
  end
end
