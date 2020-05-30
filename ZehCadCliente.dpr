program ZehCadCliente;

uses
  Vcl.Forms,
  CadCliente in 'CadCliente.pas' {fCadCliente},
  Cep in 'Cep.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfCadCliente, fCadCliente);
  Application.Run;
end.
