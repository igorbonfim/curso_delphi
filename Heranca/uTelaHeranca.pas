unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uEnum, uDTMConexao,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, RxToolEdit, RxCurrEdit;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tabListagem: TTabSheet;
    tabManutencao: TTabSheet;
    pnlListagemTopo: TPanel;
    mskPesquisar: TMaskEdit;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    btnNavigator: TDBNavigator;
    QryListagem: TZQuery;
    dtsListagem: TDataSource;
    lblIndice: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskPesquisarChange(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
  private
    { Private declarations }


    procedure ControlarBotoes(btnNovo, btnAlterar, btnCancelar,
              btnGravar, btnApagar : TBitBtn; Navegador : TDBNavigator;
              pgcPrincipal : TPageControl; Flag : Boolean);
    procedure ControlarIndiceTab(pgcPrincipal: TPageControl; Indice: Integer);
    function RetornarCampoTraduzido(Campo: String): String;
    procedure ExibirLabelIndice(Campo: String; aLabel: TLabel);
    function ExisteCampoObrigatorio: Boolean;
    procedure DesabilitarEditPK;
    procedure LimparEdits;
  public
    { Public declarations }
    IndiceAtual: String;
    EstadoDoCadastro : TEstadoDoCadastro;
    function Apagar: Boolean; virtual;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean; virtual;
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

{$region 'OBSERVACOES'}
//TAG: 1 - Chave Prim�ria - PK
//TAG: 2 - Campos Obrigat�rios
{$endRegion}

{$Region  'FUN��ES E PROCEDIMENTOS'}
procedure TfrmTelaHeranca.ControlarBotoes(btnNovo, btnAlterar, btnCancelar,
          btnGravar, btnApagar : TBitBtn; Navegador : TDBNavigator;
          pgcPrincipal : TPageControl; Flag : Boolean);
begin
    btnNovo.Enabled     := Flag;
    btnApagar.Enabled   := Flag;
    btnAlterar.Enabled  := Flag;
    Navegador.Enabled   := Flag;
    pgcPrincipal.Pages[0].TabVisible := Flag;
    btnCancelar.Enabled := not(Flag);
    btnGravar.Enabled   := not(Flag);
end;

procedure TfrmTelaHeranca.ControlarIndiceTab(pgcPrincipal : TPageControl; Indice : Integer);
begin
  if (pgcPrincipal.Pages[Indice].TabVisible) then
      pgcPrincipal.TabIndex := Indice;
end;

Function TfrmTelaHeranca.RetornarCampoTraduzido(Campo: String) : String;
var
  I : Integer;
begin
    for I := 0 to QryListagem.Fields.Count - 1 do
    begin
      if LowerCase(QryListagem.Fields[i].FieldName) = LowerCase(Campo) then
      begin
          Result := QryListagem.Fields[i].DisplayLabel;
          Break;
      end;
    end;
end;

procedure TfrmTelaHeranca.ExibirLabelIndice(Campo: String; aLabel: TLabel);
begin
  aLabel.Caption := RetornarCampoTraduzido(Campo);
end;

function TfrmTelaHeranca.ExisteCampoObrigatorio : Boolean;
var
  i : Integer;
begin
  Result := False;
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TLabeledEdit) then
    begin
        if (TLabeledEdit(Components[i]).Tag = 2) and
           (TLabeledEdit(Components[i]).Text = EmptyStr) then
        begin
          MessageDlg(TLabeledEdit(Components[i]).EditLabel.Caption +
          ' � um campo obrigat�rio', mtInformation, [mbOK], 0);
          TLabeledEdit(Components[i]).SetFocus;
          Result := True;
          Break;
        end;
    end;
  end;

end;

procedure TfrmTelaHeranca.DesabilitarEditPK;
var
  i : Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TLabeledEdit) then
    begin
        if (TLabeledEdit(Components[i]).Tag = 1) then
        begin
          TLabeledEdit(Components[i]).Enabled := false;
          Break;
        end;
    end;
  end;
end;

procedure TfrmTelaHeranca.LimparEdits;
var
  i : Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TLabeledEdit) then
      TLabeledEdit(Components[i]).Text := EmptyStr
    else if (Components[i] is TEdit) then
      TEdit(Components[i]).Text := ''
    else if (Components[i] is TMemo) then
      TMemo(Components[i]).Text := ''
    else if (Components[i] is TDBLookupComboBox) then
      TDBLookupComboBox(Components[i]).KeyValue := Null
    else if (Components[i] is TCurrencyEdit) then
      TCurrencyEdit(Components[i]).Value := 0
    else if (Components[i] is TDateEdit) then
    TDateEdit(Components[i]).Date := 0
    else if (Components[i] is TMaskEdit) then
    TMaskEdit(Components[i]).Text := '';
  end;
end;

{$endregion}

{$Region 'M�TODOS VIRTUAIS}
function TfrmTelaHeranca.Apagar: Boolean;
begin
    ShowMessage('DELETADO');
    Result := True;
end;

function TfrmTelaHeranca.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
    if (EstadoDoCadastro = ecInserir) then
        ShowMessage('Inserir')
    else if (EstadoDoCadastro = ecAlterar) then
        ShowMessage('Alterado');
    Result := True;
end;
{$endregion}

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
    ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                    btnApagar, btnNavigator, pgcPrincipal, false);
    EstadoDoCadastro := ecInserir;
    LimparEdits;
end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                    btnApagar, btnNavigator, pgcPrincipal, false);
  EstadoDoCadastro := ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
  Try
    if (Apagar) then
    begin
      ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                      btnApagar, btnNavigator, pgcPrincipal, true);
      ControlarIndiceTab(pgcPrincipal, 0);
      LimparEdits;
      QryListagem.Refresh;
    end
    else begin
      MessageDlg('Erro na exclus�o', mtError, [mbok], 0);
    end;
  Finally
    EstadoDoCadastro := ecNenhum;
  End;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
   ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                   btnApagar, btnNavigator, pgcPrincipal, true);
   ControlarIndiceTab(pgcPrincipal, 0);
   EstadoDoCadastro := ecNenhum;
   LimparEdits;
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
    if (ExisteCampoObrigatorio)=true then
        abort;

    Try
      if Gravar(EstadoDoCadastro) then
      begin
        ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                        btnApagar, btnNavigator, pgcPrincipal, true);
        ControlarIndiceTab(pgcPrincipal, 0);
        EstadoDoCadastro := ecNenhum;
        LimparEdits;
        QryListagem.Refresh;
      end
      else begin
        MessageDlg('Erro na grava��o', mtError, [mbok], 0);
      end;
    Finally
    End;
end;

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QryListagem.Close;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
    QryListagem.Connection := dtmPrincipal.ConexaoDB;
    dtsListagem.DataSet := QryListagem;
    grdListagem.DataSource := dtsListagem;
    grdListagem.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,
                             dgRowLines,dgTabs,dgRowSelect,
                             dgAlwaysShowSelection,dgCancelOnExit,dgTitleClick,
                             dgTitleHotTrack];
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
    if (QryListagem.SQL.Text <> EmptyStr) then
    begin
      QryListagem.IndexFieldNames := IndiceAtual;
      ExibirLabelIndice(IndiceAtual, lblIndice);
      QryListagem.Open;
    end;

    ControlarIndiceTab(pgcPrincipal, 0);
    DesabilitarEditPK;
    ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar,
                      btnApagar, btnNavigator, pgcPrincipal, true);
end;

procedure TfrmTelaHeranca.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
    IndiceAtual := Column.FieldName;
    QryListagem.IndexFieldNames := IndiceAtual;
    ExibirLabelIndice(IndiceAtual, lblIndice);
end;

procedure TfrmTelaHeranca.mskPesquisarChange(Sender: TObject);
begin
    QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loPartialKey, loCaseInsensitive]);
end;

end.
