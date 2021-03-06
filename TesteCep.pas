unit TesteCep;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ACBrBase, ACBrSocket, ACBrCEP,
  Vcl.StdCtrls, ACBrIBGE;

type
  TfrmCep = class(TForm)
    edtConsulta: TEdit;
    Label1: TLabel;
    edtLogradouro: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtTipoLogradouro: TEdit;
    edtBairro: TEdit;
    Label4: TLabel;
    edtCEP: TEdit;
    Label5: TLabel;
    edtComplemento: TEdit;
    Label6: TLabel;
    edtCidade: TEdit;
    Label7: TLabel;
    edtEstado: TEdit;
    Label8: TLabel;
    btnPesquisarCep: TButton;
    ACBrCEP: TACBrCEP;
    procedure btnPesquisarCepClick(Sender: TObject);
    procedure ACBrCEPBuscaEfetuada(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCep: TfrmCep;

implementation

{$R *.dfm}

procedure TfrmCep.ACBrCEPBuscaEfetuada(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to ACBrCEP.Enderecos.Count - 1 do
  begin
    edtCEP.Text             := ACBrCEP.Enderecos[i].CEP;
    edtLogradouro.Text      := ACBrCEP.Enderecos[i].Logradouro;
    edtComplemento.Text     := ACBrCEP.Enderecos[i].Complemento;
    edtBairro.Text          := ACBrCEP.Enderecos[i].Bairro;
    edtCidade.Text          := ACBrCEP.Enderecos[i].Municipio;
    edtEstado.Text          := ACBrCEP.Enderecos[i].UF;
    edtTipoLogradouro.Text  := ACBrCEP.Enderecos[i].Tipo_Logradouro;
  end;
end;

procedure TfrmCep.btnPesquisarCepClick(Sender: TObject);
begin
  ACBrCEP.BuscarPorCEP(edtConsulta.Text);
end;

end.
