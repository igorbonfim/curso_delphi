unit TesteConsultaCNPJ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ACBrBase, ACBrSocket, ACBrConsultaCNPJ,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON, Web.HTTPApp, System.NetEncoding;

type
  TfrmConsultaCNPJ = class(TForm)
    Label1: TLabel;
    edtNome: TEdit;
    edtCEP: TEdit;
    Label2: TLabel;
    edtCidade: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtEstado: TEdit;
    Label5: TLabel;
    edtEndereco: TEdit;
    Label6: TLabel;
    edtComplemento: TEdit;
    Label7: TLabel;
    edtNumero: TEdit;
    Label8: TLabel;
    edtBairro: TEdit;
    Label9: TLabel;
    edtRazaoSocial: TEdit;
    Label10: TLabel;
    edtCNPJ: TMaskEdit;
    btnConsultaCNPJ: TButton;
    ACBrConsultaCNPJ: TACBrConsultaCNPJ;
    Memo1: TMemo;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    procedure btnConsultaCNPJClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaCNPJ: TfrmConsultaCNPJ;

implementation

{$R *.dfm}

procedure TfrmConsultaCNPJ.btnConsultaCNPJClick(Sender: TObject);
var
  jsonObj : TJSONObject;
  json : string;
begin
  Memo1.Clear;

  RESTClient.BaseURL := 'https://www.receitaws.com.br/v1/cnpj/' + edtCNPJ.Text;
  //SoNumeros(edtCNPJ.ToString);
  RESTRequest.Execute;
  Memo1.Lines.Add(RESTRequest.Response.JSONText);

  if Assigned(RESTRequest.Response.JSONValue) then
      json := RESTRequest.Response.JSONValue.ToString;

  jsonObj             := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(json), 0) as TJSONObject;
  edtNome.Text        := StringReplace(TNetEncoding.HTML.Decode(TJSONObject(jsonObj).Get('nome').JsonValue.ToString), '"', '', [rfReplaceAll]);
  edtCEP.Text         := StringReplace(TNetEncoding.HTML.Decode(TJSONObject(jsonObj).Get('cep').JsonValue.ToString), '"', '', [rfReplaceAll]);
  edtCidade.Text      := StringReplace(TNetEncoding.HTML.Decode(TJSONObject(jsonObj).Get('municipio').JsonValue.ToString), '"', '', [rfReplaceAll]);
  edtEstado.Text      := StringReplace(TNetEncoding.HTML.Decode(TJSONObject(jsonObj).Get('uf').JsonValue.ToString), '"', '', [rfReplaceAll]);
  edtEndereco.Text    := StringReplace(TNetEncoding.HTML.Decode(TJSONObject(jsonObj).Get('logradouro').JsonValue.ToString), '"', '', [rfReplaceAll]);
  edtComplemento.Text := StringReplace(TNetEncoding.HTML.Decode(TJSONObject(jsonObj).Get('complemento').JsonValue.ToString), '"', '', [rfReplaceAll]);
  edtBairro.Text      := StringReplace(TNetEncoding.HTML.Decode(TJSONObject(jsonObj).Get('bairro').JsonValue.ToString), '"', '', [rfReplaceAll]);
  edtNumero.Text      := StringReplace(TNetEncoding.HTML.Decode(TJSONObject(jsonObj).Get('numero').JsonValue.ToString), '"', '', [rfReplaceAll]);
end;

end.
