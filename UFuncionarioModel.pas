unit UFuncionarioModel;

interface

uses
  System.SysUtils, system.uitypes, messages, dialogs;

type
  TFuncionario = class
  private
    Fidfuncionario: integer;
    Fsenha: String;
    FNome: String;
    Flogin: String;
    Ffuncao: String;
    Fsalario: real;
    Fdataadmissao: String;
    Fobservacao: String;
    Fdatadesligamento: String;
    Ffoto : string;

    procedure Setdataadmissao(const Value: String);
    procedure SetFuncao(const Value: String);
    procedure SetLogin(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetSenha(const Value: String);

  public
    property idfuncionario : integer read Fidfuncionario write Fidfuncionario;
    property nome : String read FNome write SetNome;
    property login : String read Flogin write SetLogin;
    property senha : String read Fsenha write SetSenha;
    property funcao : String read Ffuncao write SetFuncao;
    property salario : real read Fsalario write Fsalario;
    property dataadmissao : String read Fdataadmissao write Setdataadmissao;
    property datadesligamento : String read Fdatadesligamento write Fdatadesligamento;
    property observacao : String read Fobservacao write Fobservacao;
    property foto : String read Ffoto write Ffoto;
  end;


implementation

{ TFuncionario }

procedure TFuncionario.Setdataadmissao(const Value: String);
begin
  try
    Strtodate(Value);
  except
    raise EArgumentException.Create('É NECESSÁRIO INFORMAR UMA DATA DE ADMISSÃO VÁLIDA');
  end;
  Fdataadmissao := Value;
end;

procedure TFuncionario.SetFuncao(const Value: String);
begin
  if trim(value) = emptystr then
    raise EArgumentException.Create('É NECESSÁRIO INFORMAR A FUNÇÃO DO FUNCIONÁRIO');
  Ffuncao := Value;
end;

procedure TFuncionario.SetLogin(const Value: String);
begin
  if value = emptystr then
    raise EArgumentException.Create('É NECESSÁRIO INFORMAR O LOGIN DO FUNCIONÁRIO');
  Flogin := Value;
end;

procedure TFuncionario.SetNome(const Value: String);
begin
  if value = emptystr then
    raise EArgumentException.Create('É NECESSÁRIO INFORMAR O NOME DO FUNCIONÁRIO');
  FNome := Value;
end;

procedure TFuncionario.SetSenha(const Value: String);
begin
  if value = emptystr then
    raise EArgumentException.Create('É NECESSÁRIO INFORMAR A SENHA DO FUNCIONÁRIO');
  Fsenha := Value;
end;

end.
