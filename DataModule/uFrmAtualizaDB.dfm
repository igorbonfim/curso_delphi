object frmAtualizaDB: TfrmAtualizaDB
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmAtualizaDB'
  ClientHeight = 276
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 276
    Align = alClient
    BevelOuter = bvLowered
    BevelWidth = 3
    BorderWidth = 3
    Caption = 'Panel1'
    Color = -1
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 6
      Top = 6
      Width = 545
      Height = 264
      Align = alClient
      BevelOuter = bvNone
      Enabled = False
      ParentBackground = False
      TabOrder = 0
      object Image1: TImage
        Left = -26
        Top = 3
        Width = 256
        Height = 256
        AutoSize = True
      end
      object Label1: TLabel
        Left = 261
        Top = 14
        Width = 262
        Height = 23
        Caption = 'Atualiza'#231#227'o de Banco de Dados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object chkConexao: TCheckBox
        Left = 261
        Top = 64
        Width = 169
        Height = 17
        Caption = 'Conex'#227'o com Banco de Dados'
        TabOrder = 0
      end
      object chkCategoria: TCheckBox
        Left = 261
        Top = 87
        Width = 169
        Height = 17
        Caption = 'Categoria'
        TabOrder = 1
      end
      object chkProduto: TCheckBox
        Left = 261
        Top = 110
        Width = 169
        Height = 17
        Caption = 'Produto'
        TabOrder = 2
      end
      object chkCliente: TCheckBox
        Left = 261
        Top = 133
        Width = 169
        Height = 17
        Caption = 'Cliente'
        TabOrder = 3
      end
      object chkVendas: TCheckBox
        Left = 261
        Top = 156
        Width = 169
        Height = 17
        Caption = 'Vendas'
        TabOrder = 4
      end
      object chkItensVenda: TCheckBox
        Left = 261
        Top = 179
        Width = 169
        Height = 17
        Caption = 'Itens Venda'
        TabOrder = 5
      end
    end
  end
end
