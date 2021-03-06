unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao, Enter, uFrmAtualizaDB;

type
  TfrmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    CADA1: TMenuItem;
    MOVIMENTAO1: TMenuItem;
    RELATRIOS1: TMenuItem;
    CLIENTE1: TMenuItem;
    N1: TMenuItem;
    CATEGORIA1: TMenuItem;
    PRODUTO1: TMenuItem;
    N2: TMenuItem;
    mnuFechar: TMenuItem;
    VENDAS1: TMenuItem;
    CLIENTE2: TMenuItem;
    N3: TMenuItem;
    PRODUTO2: TMenuItem;
    N4: TMenuItem;
    VENDAPORDATA1: TMenuItem;
    procedure mnuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CATEGORIA1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CLIENTE1Click(Sender: TObject);
    procedure PRODUTO1Click(Sender: TObject);
    procedure VENDAS1Click(Sender: TObject);
  private
    { Private declarations }
    TeclaEnter : TMREnter;
    procedure AtualizacaoBancoDados(aForm: TfrmAtualizaDB);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategoria, uCadCliente, cCadProduto, uCadProduto, uProVenda;

procedure TfrmPrincipal.CATEGORIA1Click(Sender: TObject);
begin
    frmCadCategoria := TfrmCadCategoria.Create(Self);
    frmCadCategoria.ShowModal;
    frmCadCategoria.Release; // tira o objeto da mem?ria
end;

procedure TfrmPrincipal.CLIENTE1Click(Sender: TObject);
begin
  frmCadCliente := TfrmCadCliente.Create(Self);
  frmCadCliente.ShowModal;
  frmCadCliente.Release;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FreeAndNil(TeclaEnter);
    FreeAndNil(dtmPrincipal);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
    frmAtualizaDB := TfrmAtualizaDB.Create(Self);
    frmAtualizaDB.Show;
    frmAtualizaDB.Refresh;

    dtmPrincipal := TdtmPrincipal.Create(Self);
    with dtmPrincipal.ConexaoDB do begin
        SQLHourGlass := False;
        Protocol := 'mssql';
        LibraryLocation := 'C:\ProjetoDelphi\ntwdblib.dll';
        HostName := '.';
        Port := 1433;
        User := 'sa';
        Password := 'epilef';
        Database := 'Vendas';
        Connected := true;
    end;
    AtualizacaoBancoDados(frmAtualizaDB);
    frmAtualizaDB.Free;

    TeclaEnter := TMREnter.Create(Self);
    TeclaEnter.FocusEnabled := true;
    TeclaEnter.FocusColor := clInfoBk;
end;

procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
    //Close;
    Application.Terminate;
end;

procedure TfrmPrincipal.PRODUTO1Click(Sender: TObject);
begin
  frmCadProduto := TfrmCadProduto.Create(Self);
  frmCadProduto.ShowModal;
  frmCadProduto.Release;
end;

procedure TfrmPrincipal.VENDAS1Click(Sender: TObject);
begin
  frmProVenda := TfrmProVenda.Create(Self);
  frmProVenda.ShowModal;
  frmProVenda.Release;
end;

procedure TfrmPrincipal.AtualizacaoBancoDados(aForm: TfrmAtualizaDB);
begin
  aForm.chkConexao.Checked := true;
  aForm.Refresh;

  DtmPrincipal.QryScriptCategoria.ExecSQL;
  aForm.chkCategoria.Checked := true;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.QryScriptProdutos.ExecSQL;
  aForm.chkProduto.Checked := true;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.QryScriptClientes.ExecSQL;
  aForm.chkCliente.Checked := true;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.QryScriptVendas.ExecSQL;
  aForm.chkVendas.Checked := true;
  aForm.Refresh;
  Sleep(100);

  DtmPrincipal.QryScriptItensVendas.ExecSQL;
  aForm.chkItensVenda.Checked := true;
  aForm.Refresh;
  Sleep(100);
end;

end.
