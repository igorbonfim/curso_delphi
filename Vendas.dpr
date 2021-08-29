program Vendas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDTMConexao in 'DataModule\uDTMConexao.pas' {dtmPrincipal: TDataModule},
  uCadCategoria in 'Cadastro\uCadCategoria.pas' {frmCadCategoria},
  Enter in 'terceiros\Enter.pas',
  uEnum in 'Heranca\uEnum.pas',
  TesteCep in 'TesteCep.pas' {frmCep},
  TesteConsultaCNPJ in 'TesteConsultaCNPJ.pas' {frmConsultaCNPJ},
  uTelaHeranca in 'Heranca\uTelaHeranca.pas' {frmTelaHeranca},
  cCadCategoria in 'Classes\cCadCategoria.pas',
  uCadCliente in 'Cadastro\uCadCliente.pas' {frmCadCliente},
  cCadCliente in 'Classes\cCadCliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmConsultaCNPJ, frmConsultaCNPJ);
  Application.CreateForm(TfrmCep, frmCep);
  Application.CreateForm(TfrmTelaHeranca, frmTelaHeranca);
  Application.CreateForm(TfrmCadCliente, frmCadCliente);
  Application.Run;
end.
