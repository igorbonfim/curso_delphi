object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = False
  Height = 375
  Width = 463
  object ConexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    SQLHourGlass = True
    HostName = '.'
    Port = 1433
    Database = 'Vendas'
    User = 'sa'
    Password = 'epilef'
    Protocol = 'mssql'
    LibraryLocation = 'C:\ProjetoDelphi\ntwdblib.dll'
    Left = 48
    Top = 32
  end
end
