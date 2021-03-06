object frmConsultaCNPJ: TfrmConsultaCNPJ
  Left = 0
  Top = 0
  Caption = 'Teste de Consulta CNPJ'
  ClientHeight = 411
  ClientWidth = 969
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
    Left = 46
    Top = 64
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 54
    Top = 91
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object Label3: TLabel
    Left = 40
    Top = 118
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label4: TLabel
    Left = 211
    Top = 118
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  object Label5: TLabel
    Left = 28
    Top = 145
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label6: TLabel
    Left = 8
    Top = 172
    Width = 65
    Height = 13
    Caption = 'Complemento'
  end
  object Label7: TLabel
    Left = 337
    Top = 145
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object Label8: TLabel
    Left = 42
    Top = 199
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object Label9: TLabel
    Left = 13
    Top = 226
    Width = 60
    Height = 13
    Caption = 'Raz'#227'o Social'
  end
  object Label10: TLabel
    Left = 46
    Top = 37
    Width = 25
    Height = 13
    Caption = 'CNPJ'
  end
  object edtNome: TEdit
    Left = 79
    Top = 61
    Width = 364
    Height = 21
    TabOrder = 0
  end
  object edtCEP: TEdit
    Left = 79
    Top = 88
    Width = 116
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object edtCidade: TEdit
    Left = 79
    Top = 115
    Width = 116
    Height = 21
    TabOrder = 2
  end
  object edtEstado: TEdit
    Left = 248
    Top = 115
    Width = 84
    Height = 21
    TabOrder = 3
  end
  object edtEndereco: TEdit
    Left = 79
    Top = 142
    Width = 252
    Height = 21
    TabOrder = 4
  end
  object edtComplemento: TEdit
    Left = 79
    Top = 169
    Width = 364
    Height = 21
    TabOrder = 5
  end
  object edtNumero: TEdit
    Left = 375
    Top = 142
    Width = 68
    Height = 21
    TabOrder = 6
  end
  object edtBairro: TEdit
    Left = 79
    Top = 196
    Width = 116
    Height = 21
    TabOrder = 7
  end
  object edtRazaoSocial: TEdit
    Left = 79
    Top = 223
    Width = 364
    Height = 21
    TabOrder = 8
  end
  object edtCNPJ: TMaskEdit
    Left = 79
    Top = 34
    Width = 118
    Height = 21
    EditMask = '00.000.000/0000-00;0;_'
    MaxLength = 18
    TabOrder = 9
    Text = ''
  end
  object btnConsultaCNPJ: TButton
    Left = 205
    Top = 30
    Width = 92
    Height = 25
    Caption = 'Consulta CNPJ'
    TabOrder = 10
    OnClick = btnConsultaCNPJClick
  end
  object Memo1: TMemo
    Left = 488
    Top = 32
    Width = 473
    Height = 371
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 11
  end
  object ACBrConsultaCNPJ: TACBrConsultaCNPJ
    ProxyPort = '8080'
    PesquisarIBGE = False
    Left = 264
    Top = 328
  end
  object RESTClient: TRESTClient
    BaseURL = 'https://www.receitaws.com.br/v1/cnpj'
    Params = <>
    Left = 64
    Top = 328
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 128
    Top = 328
  end
  object RESTResponse: TRESTResponse
    Left = 200
    Top = 328
  end
end
