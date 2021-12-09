unit UParecerController;

interface

uses
  UParecerModel, UDados, system.SysUtils, variants, Vcl.StdCtrls;

type
  TParecerController = class
  private

  public
    function GravarRegistro(oParecer : TParecer; out sErro : String) : boolean;
    procedure VisualizaParecer(Lista : Tmemo; iFuncionario : integer);

  end;

implementation

{ TParecerController }

function TParecerController.GravarRegistro(oParecer: TParecer;
  out sErro: String): boolean;
begin
  try
    with oParecer do
      begin
        str_sql := 'insert into tbl_parecer (idfuncionario, tipo, dataparecer, descricao) values (';
        str_sql := str_sql + ' :idfuncionario, '+quotedstr(tipo)+', '+quotedstr(FormatDateTime('dd/mm/yyyy', StrToDate(dataparecer)))+', :descricao ) ';
        DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, varArrayof([ idfuncionario, descricao ]));
      end;

    result := true;
  except
    ON E : Exception do
      begin
        sErro := 'FALHA AO GRAVAR REGISTRO: '+e.message;
        Result := false;
      end;
  end;
end;

procedure TParecerController.VisualizaParecer(Lista: Tmemo;
  iFuncionario: integer);
begin
  str_sql := 'select * from tbl_parecer where idfuncionario =:idfuncionario order by dataparecer desc';
  DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, varArrayof([ ifuncionario ]));
  lista.Lines.Clear;
  DmDados.QExecutor.first;
  while not DmDados.QExecutor.eof do
    begin
      lista.Lines.add('Data: '+DmDados.QExecutor.fieldbyname('dataparecer').asstring+'   Tipo: '+DmDados.QExecutor.fieldbyname('tipo').asstring);
      lista.Lines.add(DmDados.QExecutor.fieldbyname('descricao').asstring);
      lista.Lines.add('------------------------------------------------------------------------------------------------------------------------');
      lista.Lines.add('');

      DmDados.QExecutor.next;
    end;
end;

end.
