unit UFuncionarioController;

interface

uses
  UFuncionarioModel, UDados, system.SysUtils, variants, system.uitypes,
  messages, dialogs;

type
  TFuncionarioController = class
  private

  public
    function GravarRegistro(oFuncionario : TFuncionario; out sErro : String) : boolean;

  end;

implementation

{ TFuncionarioController }

function TFuncionarioController.GravarRegistro(oFuncionario: TFuncionario;
  out sErro: String): boolean;
var
  cmpdesliga, valordesliga : string;
  idlocal : integer;
begin
  cmpdesliga := '';
  valordesliga := '';
  try
    with oFuncionario do
      begin
        if idfuncionario = 0 then
          begin
            if datadesligamento <> '' then
              begin
                cmpdesliga := ', datadesligamento';
                valordesliga := ', '+quotedstr(FormatDateTime('dd/mm/yyyy', StrToDate(datadesligamento)));
              end;

            str_sql := 'insert into tbl_funcionarios (nome, login, senha, funcao, salario, dataadmissao, observacao '+cmpdesliga+') values (';
            str_sql := str_sql + ' '+quotedstr(nome)+', '+quotedstr(login)+', '+quotedstr(senha)+', '+quotedstr(funcao)+', :salario, '+quotedstr(FormatDateTime('dd/mm/yyyy', StrToDate(dataadmissao)))+', :observacao '+valordesliga+' ) ';
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, varArrayof([ salario, observacao ]));

            str_sql := 'select max(idfuncionario) from tbl_funcionarios';
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);
            idlocal := DmDados.QExecutor.Fields[0].AsInteger;
          end
        else
          begin
            idlocal := idfuncionario;
            if datadesligamento <> '' then
              cmpdesliga := ', datadesligamento = '+quotedstr(FormatDateTime('dd/mm/yyyy', StrToDate(datadesligamento)))
            else
              cmpdesliga := ', datadesligamento = NULL';

            str_sql := 'update tbl_funcionarios set nome = '+quotedstr(nome)+', login = '+quotedstr(login)+', senha = '+quotedstr(senha)+', funcao = '+quotedstr(funcao)+', ';
            str_sql := str_sql + 'salario =:salario, dataadmissao = '+quotedstr(FormatDateTime('dd/mm/yyyy', StrToDate(dataadmissao)))+', observacao =:observacao '+cmpdesliga+' where idfuncionario =:idfuncionario ';
            DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, varArrayof([ salario, observacao, idfuncionario ]));
          end;
      end;

    result := true;
  except
    ON E : Exception do
      begin
        sErro := 'FALHA AO GRAVAR REGISTRO: '+e.message;
        Result := false;
        idlocal := 0;
      end;
  end;

  try
    if (ofuncionario.foto <> '') and (fileexists(ofuncionario.foto)) and (idlocal > 0) then
      DmDados.AtualizarImagem(ofuncionario.foto, idlocal);
  except
    ON E : Exception do
      messagedlg('FALHA AO GRAVAR IMAGEM: '+e.message, mterror, [mbok], 0);
  end;
end;

end.
