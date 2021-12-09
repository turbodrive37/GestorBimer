unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, system.uitypes, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart;

type
  TFLogin = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    lemp: TLabel;
    edlogin: TEdit;
    edsenha: TEdit;
    procedure FormShow(Sender: TObject);
    procedure edsenhaExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edloginKeyPress(Sender: TObject; var Key: Char);
    procedure edsenhaKeyPress(Sender: TObject; var Key: Char);
    procedure SimulaTab(var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

uses UDados, UMain;

procedure TFLogin.SimulaTab(var Key: Char);
begin
  Key := #0;
  perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFLogin.edloginKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SimulaTab(Key);
end;

procedure TFLogin.edsenhaExit(Sender: TObject);
var
  s : integer;
begin
  if (trim(edlogin.text) <> '') and (trim(edsenha.text) <> '') then
    begin
      edlogin.SetFocus;
      str_sql := 'select idfuncionario from tbl_funcionarios where login = '+quotedstr( edlogin.text )+' and senha = '+quotedstr( edsenha.text )+' and datadesligamento is null ';
      DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);

      if DmDados.QExecutor.fields[0].asstring <> '' then
        begin
          FrmMain.lbuser.caption := 'Olá, '+edlogin.text+'   ';
          FrmMain.PnBotoes.Visible := false;
          for S := 1 to 100 do
            FrmMain.SerieBarra[s] := TBarSeries.Create(Self);
          FrmMain.DashBoard;
          FrmMain.showmodal;
        end
      else
        messagedlg('USUÁRIO OU SENHA INVÁLIDOS', mtwarning, [mbok], 0);
    end;
end;

procedure TFLogin.edsenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if not ( CharInSet( Key, ['0'..'9', #8, #13] ) ) then
    key := #0;
  if Key = #13 then
    SimulaTab(Key);
end;

procedure TFLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_Escape then
    Close;
end;

procedure TFLogin.FormShow(Sender: TObject);
var
  smsg : string;
begin
  edlogin.SetFocus;
  smsg := DmDados.Conectar;

  if not DmDados.FdConexao.Connected then
    begin
      messagedlg(smsg, mtError, [mbok], 0);
      Close;
    end;
end;

end.
