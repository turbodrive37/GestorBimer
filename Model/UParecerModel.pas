unit UParecerModel;

interface

uses
  System.SysUtils, system.uitypes, messages, dialogs;

type
  TParecer = class
  private
    Fdescricao: String;
    Fdataparacer: String;
    Fidfuncionario: integer;
    Ftipo: String;
    procedure Setdataparecer(const Value: String);
    procedure Setdescricao(const Value: String);
    procedure SetTipo(const Value: String);
  public
    property idfuncionario : integer read Fidfuncionario write Fidfuncionario;
    property tipo : String read Ftipo write SetTipo;
    property dataparecer : String read Fdataparacer write Setdataparecer;
    property descricao : String read Fdescricao write Setdescricao;
  end;

implementation

{ TParecer }

procedure TParecer.Setdataparecer(const Value: String);
begin
  try
    Strtodate(Value);
  except
    raise EArgumentException.Create('� NECESS�RIO INFORMAR UMA DATA V�LIDA');
  end;
  Fdataparacer := Value;
end;

procedure TParecer.Setdescricao(const Value: String);
begin
  if trim(value) = emptystr then
    raise EArgumentException.Create('� NECESS�RIO INFORMAR A DESCRI��O DO PARECER');
  Fdescricao := Value;
end;

procedure TParecer.SetTipo(const Value: String);
begin
  if trim(value) = emptystr then
    raise EArgumentException.Create('� NECESS�RIO INFORMAR O TIPO DO PARECER');
  Ftipo := Value;
end;

end.
