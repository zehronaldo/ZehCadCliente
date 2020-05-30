unit CadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, REST.Types,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Vcl.Mask,
  System.UITYpes;

type
  TfCadCliente = class(TForm)
    pnlDados: TPanel;
    pnlBotoes: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    lblNome: TLabel;
    edtNome: TEdit;
    edtIdentidade: TEdit;
    edtCPF: TEdit;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    lblIdentidade: TLabel;
    lblCPF: TLabel;
    lblTelefone: TLabel;
    lblEmail: TLabel;
    lblCEP: TLabel;
    lblLogradouro: TLabel;
    lblBairro: TLabel;
    lblMunicipio: TLabel;
    lblPais: TLabel;
    lblUF: TLabel;
    edtLogradouro: TEdit;
    edtBairro: TEdit;
    edtMunicipio: TEdit;
    edtUF: TEdit;
    edtPais: TEdit;
    edtNumero: TEdit;
    lblNumero: TLabel;
    lblComplemento: TLabel;
    edtComplemento: TEdit;
    btnCadastrar: TButton;
    Label1: TLabel;
    rstClient: TRESTClient;
    rstRequest: TRESTRequest;
    rstResponse: TRESTResponse;
    edtCep: TMaskEdit;
    procedure btnCadastrarClick(Sender: TObject);
    procedure edtCepExit(Sender: TObject);
  private
    procedure BuscarCEP;
    function GerarArquivoXML (var AAnexo: string): string;
    procedure CadastrarPorEmail;
    procedure EnviarEmail(const ACorpo, AAnexo: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadCliente: TfCadCliente;

implementation

{$R *.dfm}

uses Cep, IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile,
  IdExplicitTLSClientServerBase, XMLDoc, XMLIntf;


procedure TfCadCliente.btnCadastrarClick(Sender: TObject);
begin
  CadastrarPorEmail;
end;

procedure TfCadCliente.BuscarCEP;
var
  oCep: TCep;
begin
  rstRequest.Params.ParameterByName('cep').Value := edtCep.Text;
  rstRequest.Execute;

  oCep := TCep.FromJsonString(rstResponse.Content.Trim);

  try
    edtLogradouro.Text := oCep.logradouro;
    edtBairro.Text := oCep.bairro;
    edtMunicipio.Text := oCep.localidade;
    edtUF.Text := oCep.uf;
  finally
    oCep.Free;
  end;

end;

procedure TfCadCliente.EnviarEmail(const ACorpo, AAnexo : string);
var
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  IdText: TIdText;
begin
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
  IdSMTP := TIdSMTP.Create(Self);
  IdMessage := TIdMessage.Create(Self);

  try
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    IdSMTP.IOHandler := IdSSLIOHandlerSocket;
    IdSMTP.UseTLS := utUseImplicitTLS;
    IdSMTP.AuthType := satDefault;
    IdSMTP.Port := 465;
    IdSMTP.Host := 'smtp.gmail.com';
    IdSMTP.Username := 'seuemail@gmail.com';
    IdSMTP.Password := 'zenha';

    IdMessage.From.Address := 'seuemail@gmail.com';
    IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
    IdMessage.Recipients.Add.Text := 'destino@umemail.com';
    IdMessage.Subject := 'Arquivo XML de CEP';
    IdMessage.Encoding := meMIME;

    IdText := TIdText.Create(IdMessage.MessageParts);
    IdText.Body.Add(ACorpo);
    IdText.ContentType := 'text/plain; charset=iso-8859-1';

    if FileExists(AAnexo) then
    begin
      TIdAttachmentFile.Create(IdMessage.MessageParts, AAnexo);
    end;

    try
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
      begin
        MessageDlg('Erro na conexão ou autenticação: ' +
          E.Message, mtWarning, [mbOK], 0);
        Exit;
      end;
    end;

    try
      IdSMTP.Send(IdMessage);
      MessageDlg('Mensagem enviada com sucesso!', mtInformation, [mbOK], 0);
    except
      On E:Exception do
      begin
        MessageDlg('Erro ao enviar a mensagem: ' +
          E.Message, mtWarning, [mbOK], 0);
      end;
    end;
  finally
    IdSMTP.Disconnect;
    UnLoadOpenSSLLibrary;
    FreeAndNil(IdMessage);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(IdSMTP);
  end;
end;


procedure TfCadCliente.CadastrarPorEmail;
var
  CorpoEmail, AnexoEmail: string;
begin
  CorpoEmail:= GerarArquivoXML (AnexoEmail);
  EnviarEmail(CorpoEmail, AnexoEmail);
end;

procedure TfCadCliente.edtCepExit(Sender: TObject);
begin
  BuscarCep;
end;

function TfCadCliente.GerarArquivoXML (var AAnexo: string) : string;
var
  XMLDocument: TXMLDocument;
  NodeTabela, NodeRegistro, NodeEndereco: IXMLNode;

  begin
  XMLDocument := TXMLDocument.Create(Self);
  try
    XMLDocument.Active := True;
    NodeTabela := XMLDocument.AddChild('Cliente');
    NodeRegistro := NodeTabela.AddChild('Dados');
    NodeRegistro.ChildValues['Nome'] := edtNome.Text;
    NodeRegistro.ChildValues['Identidade'] := edtIdentidade.Text;
    NodeRegistro.ChildValues['CPF'] := edtCPF.Text;
    NodeRegistro.ChildValues['Telefone'] := edtNome.Text;
    NodeRegistro.ChildValues['Email'] := edtIdentidade.Text;
    NodeEndereco := NodeRegistro.AddChild('Endereco');
    NodeEndereco.ChildValues['CEP'] := edtCep.Text;
    NodeEndereco.ChildValues['Logradouro'] := edtLogradouro.Text;
    NodeEndereco.ChildValues['Numero'] := edtNumero.Text;
    NodeEndereco.ChildValues['Complemento'] := edtComplemento.Text;
    NodeEndereco.ChildValues['Bairro'] := edtBairro.Text;
    NodeEndereco.ChildValues['Cidade'] := edtMunicipio.Text;
    NodeEndereco.ChildValues['Estado'] := edtUF.Text;
    NodeEndereco.ChildValues['Pais'] := edtNumero.Text;

    AAnexo:= 'C:\Cliente_' + edtNome.Text + '.xml' ;
    XMLDocument.SaveToFile(AAnexo);

    Result:= XMLDocument.XML.Text;
  finally
    XMLDocument.Free;
  end;

end;

end.
