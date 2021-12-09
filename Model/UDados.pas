unit UDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Phys.ODBCBase, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, inifiles, variants, Vcl.StdCtrls;

type
  TDmDados = class(TDataModule)
    FDConexao: TFDConnection;
    QExecutor: TFDQuery;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    DsFuncionarios: TDataSource;
    DsParecer: TDataSource;
    QFuncionarios: TFDQuery;
    QParecer: TFDQuery;

    procedure LeINI;
    function Conectar : String;
    Procedure Executa_Query(NConexao : TFDConnection; MQuery : TFDQuery; SqlComb : string; parametros : variant);
    procedure QFuncionariosAfterOpen(DataSet: TDataSet);
    Procedure Popular_Combobox( MCombo : TCombobox; SqlComb, ValorPadComb : string);
    procedure AtualizarImagem(sImagem : string; iIdfuncionario : integer);
    function ValidarLogin(slogin : string; iidfuncionario : integer) : boolean;

  private
    { Private declarations }
  public
    { Public declarations }
    Ip_Servidor, Database, Senha, Usuario : string;
  end;

var
  DmDados: TDmDados;
  str_sql, configini : string;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Procedure tDmDados.Executa_Query(NConexao : TFDConnection; MQuery : TFDQuery; SqlComb : string; parametros : variant);
var
  i, j : integer;
begin
  With MQuery do
    begin
      Close;

      if Nconexao <> nil then
        MQuery.Connection := NConexao;

      Sql.clear;
      Sql.text := SqlComb;

      if not VarIsNull(parametros) then
        begin
          if VarIsArray(Parametros)  then
            begin
              i := VarArrayLowBound(Parametros, 1);
              j := VarArrayHighBound(Parametros, 1);
              while i <= j do
                begin
                  MQuery.Params[i].Value := Parametros[i];
                  Inc(i);
                end;
            end
          else
            MQuery.Params[0].Value := Parametros;
        end;

      if (Ansiuppercase(copy(sqlcomb, 1, 6)) = 'SELECT') or (Ansiuppercase(copy(sqlcomb, 1, 4)) = 'SHOW') then
        Open
      else
        Execute;
    end;
end;

Procedure tDmDados.Popular_Combobox( MCombo : TCombobox; SqlComb, ValorPadComb : string);
var
  QConComb : TFDQuery;
begin
  QConComb := TFDQuery.create(Nil);

  Executa_Query(FDConexao, QConComb, SqlComb, null);

  QConComb.first;

  MCombo.clear;
  MCombo.items.clear;
  while not QConComb.eof do
    begin
      if trim( QConComb.fields[0].asstring ) <> '' then
        MCombo.Items.add( QConComb.fields[0].asstring );

      QConComb.next;
    end;
  if ValorPadComb <> '' then
    MCombo.ItemIndex := MCombo.items.IndexOf( ValorPadComb );

  QConComb.close;
  QConComb.Free;
end;

procedure tDmDados.AtualizarImagem(sImagem : string; iIdfuncionario : integer);
begin
  QExecutor.Close;
  QExecutor.SQL.Clear;
  QExecutor.SQL.Add('update tbl_funcionarios set foto =:foto where idfuncionario =:idfuncionario ');
  QExecutor.ParamByName('foto').LoadFromFile(sImagem, ftBlob);
  QExecutor.ParamByName('idfuncionario').asinteger := iIdfuncionario;
  QExecutor.execsql;
end;

function tDmDados.ValidarLogin(slogin : string; iidfuncionario : integer) : boolean;
begin
  Result := true;
  str_sql := 'select idfuncionario from tbl_funcionarios where login = '+quotedstr(slogin)+' and idfuncionario <>:idfuncionario';
  DmDados.Executa_Query(nil, QExecutor, str_sql, varArrayof([ iidfuncionario ]));
  if QExecutor.Fields[0].AsString <> '' then
    Result := false;
end;

procedure tDmDados.LeINI;
var
  ArqIni : TIniFile;
begin
  ArqIni := TIniFile.Create(configini);
  try
    Ip_Servidor := ArqIni.ReadString('BaseDados', 'Ip_Servidor', Ip_Servidor);
    Database    := ArqIni.ReadString('BaseDados', 'Database', DataBase);
    Senha       := ArqIni.ReadString('BaseDados', 'Senha', Senha);
    Usuario     := ArqIni.ReadString('BaseDados', 'Usuario', Usuario);
  finally
    ArqIni.Free;
  end;
end;

procedure TDmDados.QFuncionariosAfterOpen(DataSet: TDataSet);
begin
  TNumericField(QFuncionarios.FieldByName('salario')).DisplayFormat := '0.00';
end;

function TDmDados.Conectar : String;
begin
  Result := '';
  FdConexao.Connected := false;
  configini := ExtractFilePath(ParamStr(0)) +'Bimer.ini';

  if fileexists(configini) then
    begin
      Leini;

      try
        FDConexao.Params.Clear;
        FDConexao.LoginPrompt := false;
        FDConexao.DriverName :=  'MSSQL';
        FDConexao.Params.DriverID  :=  'MSSQL';
        FDConexao.Params.Database  :=  Database;
        FDConexao.Params.UserName  :=  Usuario;
        FDConexao.Params.Password  :=  Senha;
        FDConexao.Params.Add('server='+ Ip_Servidor);

        FDConexao.Connected := true;
      Except
        on E:Exception do
          begin
            FDConexao.Connected := false;
            Result := 'FALHA NA CONEXÃO COM O BANCO DE DADOS: '  + #13#10 + E.Message;
          end;
      end;
    end
  else
    Result := 'ARQUIVO '+configini+' NÃO ENCONTRADO';
end;

end.
