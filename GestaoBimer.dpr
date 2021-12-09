program GestaoBimer;

uses
  Vcl.Forms,
  Vcl.Dialogs,
  System.UiTypes,
  windows,
  UMain in 'View\UMain.pas' {FrmMain},
  ULogin in 'View\ULogin.pas' {FLogin},
  UDados in 'Model\UDados.pas' {DmDados: TDataModule},
  UntMaskedit in 'Model\UntMaskedit.pas',
  UFuncionarioModel in 'Model\UFuncionarioModel.pas',
  UFuncionarioController in 'Controller\UFuncionarioController.pas',
  UParecerModel in 'Model\UParecerModel.pas',
  UParecerController in 'Controller\UParecerController.pas',
  URelatorio in 'View\URelatorio.pas' {FrmRelatorio};

{$R *.res}

const
  AppName = 'Gestao Bimer';

begin
  CreateMutex(nil, True, AppName);
  if GetLastError = ERROR_ALREADY_EXISTS then
    MessageDlg('EXISTE OUTRA INSTÂNCIA DO '+AppName+' EM EXECUÇÃO.', mtInformation, [mbOK], 0)
  else
    begin
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TDmDados, DmDados);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmRelatorio, FrmRelatorio);
  Application.Run;
    end;
end.
