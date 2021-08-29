unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao, uCadCategoria, Enter;

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
  private
    { Private declarations }
    TeclaEnter : TMREnter;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.CATEGORIA1Click(Sender: TObject);
begin
    frmCadCategoria := TfrmCadCategoria.Create(Self);
    frmCadCategoria.ShowModal;
    frmCadCategoria.Release; // tira o objeto da mem�ria
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FreeAndNil(TeclaEnter);
    FreeAndNil(dtmPrincipal);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
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

    TeclaEnter := TMREnter.Create(Self);
    TeclaEnter.FocusEnabled := true;
    TeclaEnter.FocusColor := clInfoBk;
end;

procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
    //Close;
    Application.Terminate;
end;

end.