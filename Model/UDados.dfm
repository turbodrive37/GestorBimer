object DmDados: TDmDados
  OldCreateOrder = False
  Height = 338
  Width = 330
  object FDConexao: TFDConnection
    Params.Strings = (
      'DriverID=MSSQL'
      'Password=sa123'
      'Server=localhost'
      'User_Name=sa'
      'Database=dbgestaobimer2')
    LoginPrompt = False
    Left = 64
    Top = 16
  end
  object QExecutor: TFDQuery
    Connection = FDConexao
    Left = 64
    Top = 72
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    DriverID = 'MSSQL'
    Left = 200
    Top = 24
  end
  object DsFuncionarios: TDataSource
    DataSet = QFuncionarios
    Left = 64
    Top = 152
  end
  object DsParecer: TDataSource
    DataSet = QParecer
    Left = 152
    Top = 152
  end
  object QFuncionarios: TFDQuery
    AfterOpen = QFuncionariosAfterOpen
    Connection = FDConexao
    SQL.Strings = (
      'select * from tbl_funcionarios')
    Left = 64
    Top = 216
  end
  object QParecer: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      
        'select par.idparecer, par.idfuncionario, par.tipo, par.descricao' +
        ', par.dataparecer, fun.login, fun.funcao from tbl_parecer par, t' +
        'bl_funcionarios fun where par.idfuncionario = fun.idfuncionario')
    Left = 152
    Top = 216
  end
end
