object frmCep: TfrmCep
  Left = 0
  Top = 0
  Caption = 'Testando CEP'
  ClientHeight = 195
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 23
    Width = 69
    Height = 13
    Caption = 'Informe o CEP'
  end
  object Label2: TLabel
    Left = 46
    Top = 50
    Width = 55
    Height = 13
    Caption = 'Logradouro'
  end
  object Label3: TLabel
    Left = 8
    Top = 77
    Width = 93
    Height = 13
    Caption = 'Tipo de Logradouro'
  end
  object Label4: TLabel
    Left = 73
    Top = 104
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object Label5: TLabel
    Left = 281
    Top = 104
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object Label6: TLabel
    Left = 36
    Top = 131
    Width = 65
    Height = 13
    Caption = 'Complemento'
  end
  object Label7: TLabel
    Left = 68
    Top = 158
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label8: TLabel
    Left = 283
    Top = 158
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  object edtConsulta: TEdit
    Left = 113
    Top = 20
    Width = 88
    Height = 21
    TabOrder = 0
  end
  object edtLogradouro: TEdit
    Left = 113
    Top = 47
    Width = 162
    Height = 21
    TabOrder = 1
  end
  object edtTipoLogradouro: TEdit
    Left = 113
    Top = 74
    Width = 162
    Height = 21
    TabOrder = 2
  end
  object edtBairro: TEdit
    Left = 113
    Top = 101
    Width = 162
    Height = 21
    TabOrder = 3
  end
  object edtCEP: TEdit
    Left = 306
    Top = 101
    Width = 63
    Height = 21
    TabOrder = 4
  end
  object edtComplemento: TEdit
    Left = 113
    Top = 128
    Width = 256
    Height = 21
    TabOrder = 5
  end
  object edtCidade: TEdit
    Left = 113
    Top = 155
    Width = 162
    Height = 21
    TabOrder = 6
  end
  object edtEstado: TEdit
    Left = 324
    Top = 155
    Width = 45
    Height = 21
    TabOrder = 7
  end
  object btnPesquisarCep: TButton
    Left = 207
    Top = 16
    Width = 68
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 8
    OnClick = btnPesquisarCepClick
  end
  object ACBrCEP: TACBrCEP
    ProxyPort = '8080'
    WebService = wsCorreios
    PesquisarIBGE = True
    OnBuscaEfetuada = ACBrCEPBuscaEfetuada
    Left = 304
    Top = 40
  end
end
