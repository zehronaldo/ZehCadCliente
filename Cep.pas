unit Cep;

interface

uses Generics.Collections, Rest.Json;

type

TCep = class
private
  FBairro: String;
  FCep: String;
  FComplemento: String;
  FGia: String;
  FIbge: String;
  FLocalidade: String;
  FLogradouro: String;
  FUf: String;
  FUnidade: String;
public
  property bairro: String read FBairro write FBairro;
  property cep: String read FCep write FCep;
  property complemento: String read FComplemento write FComplemento;
  property gia: String read FGia write FGia;
  property ibge: String read FIbge write FIbge;
  property localidade: String read FLocalidade write FLocalidade;
  property logradouro: String read FLogradouro write FLogradouro;
  property uf: String read FUf write FUf;
  property unidade: String read FUnidade write FUnidade;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TCep;
end;

implementation

{TCep}


function TCep.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TCep.FromJsonString(AJsonString: string): TCep;
begin
  result := TJson.JsonToObject<TCep>(AJsonString)
end;

end.
