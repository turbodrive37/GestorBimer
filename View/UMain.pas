unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, system.uitypes,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  System.ImageList, Vcl.ImgList, Vcl.Mask, UntMaskedit, Vcl.ExtDlgs,
  UFuncionarioController, UFuncionarioModel, UParecerController,
  UParecerModel, jpeg, Vcl.Menus, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart;

type
  TFrmMain = class(TForm)
    PnTitulo: TPanel;
    imgMenu: TImage;
    lbuser: TLabel;
    ImgSaida: TImage;
    Label1: TLabel;
    PnBtn: TPanel;
    PnBack: TPanel;
    PnBotoes: TPanel;
    SBDash: TSpeedButton;
    SBFunc: TSpeedButton;
    PnFunc: TPanel;
    PnDash: TPanel;
    SBRelat: TSpeedButton;
    PnRelatorios: TPanel;
    PCBimer: TPageControl;
    TSDash: TTabSheet;
    TSControle: TTabSheet;
    TSFuncionario: TTabSheet;
    TSAdicParecer: TTabSheet;
    TSVisualizar: TTabSheet;
    TSRelatorio: TTabSheet;
    Panel1: TPanel;
    PnAddFunc: TPanel;
    ImgBusca: TImage;
    edbuscalogin: TEdit;
    Panel3: TPanel;
    DBFunc: TDBGrid;
    ImgFuncoes: TImageList;
    lbnome: TLabel;
    ednome: TEdit;
    lblogin: TLabel;
    edlogin: TEdit;
    lbsenha: TLabel;
    edsenha: TEdit;
    cbfuncao: TComboBox;
    lbfuncao: TLabel;
    lbsalario: TLabel;
    edsalario: TEdit;
    lbadmissao: TLabel;
    mkadmissao: TMaskEdit;
    lbdesligamento: TLabel;
    mkdesligamento: TMaskEdit;
    lbobservacao: TLabel;
    mmobservacao: TMemo;
    ImgFuncionario: TImage;
    btnimagem: TBitBtn;
    ImgP1: TOpenPictureDialog;
    Panel4: TPanel;
    lbcodparecer: TLabel;
    lbloginparecer: TLabel;
    lbadmissaoparecer: TLabel;
    lbtipo: TLabel;
    cbtipo: TComboBox;
    Label2: TLabel;
    mkdataparecer: TMaskEdit;
    Label3: TLabel;
    mmdescricao: TMemo;
    Panel7: TPanel;
    PnSalvarFunc: TPanel;
    PnCancFunc: TPanel;
    Panel5: TPanel;
    PnSalvarParecer: TPanel;
    PnCancParecer: TPanel;
    PopMParecer: TPopupMenu;
    AdicionarParecer1: TMenuItem;
    N1: TMenuItem;
    VisualizarParecer1: TMenuItem;
    Panel6: TPanel;
    lbcodparecer2: TLabel;
    lbloginparecer2: TLabel;
    lbadmissaoparecer2: TLabel;
    Panel8: TPanel;
    PnSairVisualiza: TPanel;
    mmvisualizar: TMemo;
    Panel9: TPanel;
    DBGrid1: TDBGrid;
    PnFiltro: TPanel;
    PnRelatorio: TPanel;
    Label4: TLabel;
    cblogin2: TComboBox;
    Label5: TLabel;
    cbfuncao2: TComboBox;
    Label6: TLabel;
    mkinicial: TMaskEdit;
    Label7: TLabel;
    mkfinal: TMaskEdit;
    PnGraficoFuncao: TPanel;
    PnGraficoQtde: TPanel;
    GraficoPizza: TChart;
    Series1: TPieSeries;
    Chart1: TChart;
    procedure ImgSaidaClick(Sender: TObject);
    procedure EventoSair;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SimulaTab(var Key: Word);
    Function GetStateK (Key: integer): boolean;
    procedure FormShow(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure PnDashClick(Sender: TObject);
    procedure PnFuncClick(Sender: TObject);
    procedure PnAddFuncClick(Sender: TObject);
    procedure ImgBuscaClick(Sender: TObject);
    procedure DBFuncDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edsalarioKeyPress(Sender: TObject; var Key: Char);
    procedure edsalarioExit(Sender: TObject);
    procedure PnSalvarFuncClick(Sender: TObject);
    procedure btnimagemClick(Sender: TObject);
    procedure mkadmissaoExit(Sender: TObject);
    procedure PnCancFuncClick(Sender: TObject);
    procedure LiberarObjetoFuncionario;
    procedure CriarObjetoFuncionario;
    procedure ConsultarFuncionarios;
    procedure LimparCamposFuncionario;
    procedure DBFuncCellClick(Column: TColumn);
    procedure TSFuncionarioShow(Sender: TObject);
    procedure PnSalvarParecerClick(Sender: TObject);
    procedure TSAdicParecerShow(Sender: TObject);
    procedure AdicionarParecer1Click(Sender: TObject);
    procedure VisualizarParecer1Click(Sender: TObject);
    procedure CriarObjetoParecer;
    procedure LiberarObjetoParecer;
    procedure PnCancParecerClick(Sender: TObject);
    procedure LimparCamposParecer;
    procedure TSControleShow(Sender: TObject);
    procedure PnSairVisualizaClick(Sender: TObject);
    procedure PnRelatoriosClick(Sender: TObject);
    procedure TSRelatorioShow(Sender: TObject);
    procedure PnFiltroClick(Sender: TObject);
    procedure PnRelatorioClick(Sender: TObject);
    procedure Dashboard;
    procedure ListarParecer;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edloginExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fechar : boolean;
    zebrar : integer;
    filtrodebusca : string;
    SerieBarra: Array[1..100] of TBarSeries;
  end;

var
  FrmMain: TFrmMain;
  oFuncionario : TFuncionario;
  oFuncionarioController : TFuncionarioController;
  oParecer : TParecer;
  oParecerController : TParecerController;

implementation

{$R *.dfm}

uses ULogin, UDados, URelatorio;

procedure TFrmMain.CriarObjetoFuncionario;
begin
  oFuncionario := TFuncionario.Create;
  oFuncionarioController := TFuncionarioController.Create;
end;

procedure TFrmMain.CriarObjetoParecer;
begin
  oParecer := TParecer.Create;
  oParecerController := TParecerController.Create;
end;

procedure TFrmMain.LiberarObjetoFuncionario;
begin
  try
    if (ofuncionario.foto <> '') and (fileexists(ofuncionario.foto)) then
      deletefile(ofuncionario.foto);
  except
  end;

  FreeAndNil( oFuncionario );
  FreeAndNil( oFuncionariocontroller );
end;

procedure TFrmMain.LiberarObjetoParecer;
begin
  FreeAndNil( oParecer );
  FreeAndNil( oParecercontroller );
end;

procedure TFrmMain.LimparCamposFuncionario;
begin
  ednome.clear;
  edlogin.Clear;
  edsenha.Clear;
  cbfuncao.ItemIndex := -1;
  edsalario.text := '0,00';
  mkadmissao.Clear;
  mkdesligamento.Clear;
  mmobservacao.Lines.Clear;
  imgfuncionario.picture.Assign(nil);
end;

procedure TFrmMain.LimparCamposParecer;
begin
  cbtipo.itemindex := -1;
  mkdataparecer.clear;
  mmdescricao.Lines.Clear;
end;

procedure TFrmMain.SimulaTab(var Key: Word);
begin
  Key := 0;
  perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFrmMain.TSAdicParecerShow(Sender: TObject);
begin
  cbtipo.SetFocus;
end;

procedure TFrmMain.TSControleShow(Sender: TObject);
begin
  edbuscalogin.SetFocus;
end;

procedure TFrmMain.TSFuncionarioShow(Sender: TObject);
begin
  ednome.setfocus;
end;

procedure TFrmMain.TSRelatorioShow(Sender: TObject);
begin
  cblogin2.SetFocus;
end;

procedure TFrmMain.AdicionarParecer1Click(Sender: TObject);
begin
  CriarObjetoParecer;

  oParecer.idfuncionario := DmDados.QFuncionarios.fieldbyname('idfuncionario').Asinteger;

  lbcodparecer.caption := 'Código: '+DmDados.QFuncionarios.fieldbyname('idfuncionario').AsString;
  lbloginparecer.caption := 'Login: '+DmDados.QFuncionarios.fieldbyname('login').AsString;
  lbadmissaoparecer.caption := 'Admissão: '+DmDados.QFuncionarios.fieldbyname('dataadmissao').AsString;

  TsControle.TabVisible := false;
  TsAdicParecer.TabVisible := true;
end;

procedure TFrmMain.VisualizarParecer1Click(Sender: TObject);
begin
  CriarObjetoParecer;

  oParecer.idfuncionario := DmDados.QFuncionarios.fieldbyname('idfuncionario').Asinteger;
  lbcodparecer2.caption := 'Código: '+DmDados.QFuncionarios.fieldbyname('idfuncionario').AsString;
  lbloginparecer2.caption := 'Login: '+DmDados.QFuncionarios.fieldbyname('login').AsString;
  lbadmissaoparecer2.caption := 'Admissão: '+DmDados.QFuncionarios.fieldbyname('dataadmissao').AsString;

  oParecerController.VisualizaParecer(mmvisualizar, oParecer.idfuncionario);
  TsControle.TabVisible := false;
  TsVisualizar.TabVisible := true;
end;

Function TFrmMain.GetStateK (Key: integer): boolean;
begin
  Result := Odd(GetKeyState (Key));
end;

procedure TFrmMain.ImgBuscaClick(Sender: TObject);
begin
  if edbuscalogin.text <> '' then
    str_sql := 'select * from tbl_funcionarios where login like '+quotedstr('%'+edbuscalogin.text+'%')+' order by idfuncionario'
  else
    str_sql := 'select * from tbl_funcionarios order by idfuncionario';
  DmDados.Executa_Query(nil, DmDados.QFuncionarios, str_sql, null);
end;

procedure TFrmMain.imgMenuClick(Sender: TObject);
begin
  if PnBotoes.Visible = false then
    PnBotoes.Visible := true
  else
    PnBotoes.Visible := false;
end;

procedure TFrmMain.DBFuncCellClick(Column: TColumn);
var
  foto: TStream;
  imgtemp : TJPEGImage;
  arquivojpg : string;
  Ponteiro   : TPoint;
begin
  if (Dmdados.QFuncionarios.active) and (Dmdados.QFuncionarios.fields[0].asstring <> '') then
    begin
      if DBFunc.SelectedIndex = 5 then
        begin
          CriarObjetoFuncionario;

          oFuncionario.idfuncionario := Dmdados.QFuncionarios.fieldbyname('idfuncionario').asinteger;
          oFuncionario.foto := '';
          ednome.text := Dmdados.QFuncionarios.fieldbyname('nome').asstring;
          edlogin.text := Dmdados.QFuncionarios.fieldbyname('login').asstring;
          edsenha.text := Dmdados.QFuncionarios.fieldbyname('senha').asstring;
          cbfuncao.ItemIndex := cbfuncao.Items.IndexOf(Dmdados.QFuncionarios.fieldbyname('funcao').asstring);
          edsalario.text := trim(format('%5.2f',[ Dmdados.QFuncionarios.fieldbyname('salario').asfloat ]));
          mkadmissao.text := Dmdados.QFuncionarios.fieldbyname('dataadmissao').asstring;
          mkdesligamento.text := Dmdados.QFuncionarios.fieldbyname('datadesligamento').asstring;
          mmobservacao.lines.Clear;
          mmobservacao.lines.add(Dmdados.QFuncionarios.fieldbyname('observacao').asstring);

          if trim(Dmdados.QFuncionarios.FieldByName('foto').asstring) <> '' then
            begin
              arquivojpg := ExtractFilePath(ParamStr(0)) + 'id'+Dmdados.QFuncionarios.fieldbyname('idfuncionario').asstring+'.jpg';

              imgtemp := TJPEGImage.Create;
              try
                foto := Dmdados.QFuncionarios.CreateBlobStream(Dmdados.QFuncionarios.FieldByName('foto'), bmRead);
                imgtemp.LoadFromStream(foto);
                imgFuncionario.Picture.Assign(imgtemp);
                imgFuncionario.Picture.SaveToFile(arquivojpg);
                oFuncionario.foto := arquivojpg;
              except
                on E : exception do
                  imgFuncionario.Picture.Assign(nil);
              end;
            end;

          TsControle.TabVisible := false;
          TsFuncionario.TabVisible := true;
        end;

      if DBFunc.SelectedIndex = 6 then
        begin
          if MessageDlg('CONFIRMA A EXCLUSÃO DO REGISTRO ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
              str_sql := 'delete from tbl_funcionarios where idfuncionario =:idfuncionario';
              DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, varArrayof([ Dmdados.QFuncionarios.fieldbyname('idfuncionario').asinteger ]));

              Dmdados.QFuncionarios.refresh;
            end;
        end;

      if DBFunc.SelectedIndex = 7 then
        begin
          GetCursorPos(Ponteiro);
          PopMParecer.Popup(Ponteiro.X - 190, Ponteiro.Y);
        end;
    end;
end;

procedure TFrmMain.DBFuncDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.index = 5 then
    begin
      DBFunc.Canvas.FillRect(Rect);
      ImgFuncoes.draw(DBFunc.Canvas, Rect.Left+5, Rect.top + 1, 0);
    end;
  if Column.index = 6 then
    begin
      DBFunc.Canvas.FillRect(Rect);
      ImgFuncoes.draw(DBFunc.Canvas, Rect.Left+5, Rect.top + 1, 1);
    end;
  if Column.index = 7 then
    begin
      DBFunc.Canvas.FillRect(Rect);
      ImgFuncoes.draw(DBFunc.Canvas, Rect.Left+5, Rect.top + 1, 2);
    end;
end;

procedure TFrmMain.edloginExit(Sender: TObject);
begin
  if not DmDados.ValidarLogin(trim(edlogin.Text), ofuncionario.idfuncionario) then
    begin
      edlogin.clear;
      messagedlg('LOGIN JÁ UTILIZADO POR OUTRO USUÁRIO', mtwarning, [mbok], 0);
    end;
end;

procedure TFrmMain.edsalarioExit(Sender: TObject);
begin
  try
    if strtofloat(edsalario.Text) <= 0 then
      messagedlg('É NECESSÁRIO INFORMAR UM VALOR DIFERENTE DE ZERO', mtwarning, [mbok], 0);
  except
    edsalario.Text := '0,00';
    messagedlg('É NECESSÁRIO INFORMAR UM VALOR VÁLIDO.', mtwarning, [mbok], 0);
  end;
  edsalario.text := trim(format('%5.2f',[strtoFloat(tedit(sender).text)]));
end;

procedure TFrmMain.edsalarioKeyPress(Sender: TObject; var Key: Char);
begin
  if not ( CharInSet( Key, ['0'..'9', #8, ',', #13] ) ) then
    key := #0;
end;

procedure TFrmMain.EventoSair;
begin
  if MessageDlg('FINALIZAR APLICAÇÃO ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      fechar := true;
      Close;
      Flogin.Close;
    end;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If fechar = false Then
    Action := caNone;
end;

procedure TFrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If GetStateK (VK_LMENU) And (Key = VK_F4) Then
    EventoSair;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  fechar := false;
end;

procedure TFrmMain.ImgSaidaClick(Sender: TObject);
begin
  EventoSair;
end;

procedure TFrmMain.mkadmissaoExit(Sender: TObject);
begin
  TMaskedit(sender).ValidarData(Sender);
end;

procedure TFrmMain.btnimagemClick(Sender: TObject);
begin
  if (ImgP1.Execute) and (ImgP1.FileName <> '') then
    begin
      try
        ImgFuncionario.Picture.LoadFromFile(ImgP1.FileName);
        oFuncionario.foto := ImgP1.FileName;
      except
        on E : exception do
          Messagedlg('FALHA AO SELECIONAR IMAGEM: '+e.message, mtERROR, [mbok], 0);
      end;
    end;
end;

procedure TFrmMain.PnSalvarParecerClick(Sender: TObject);
var
  mserro : string;
begin
  with oParecer do
    begin
      tipo := cbtipo.text;
      dataparecer := mkdataparecer.text;
      descricao := mmdescricao.text;
    end;
  if oParecerController.GravarRegistro( oParecer, mserro ) = false then
    messagedlg(mserro, mtwarning, [mbok], 0)
  else
    begin
      cbtipo.SetFocus;
      LimparCamposParecer;
    end;
end;

procedure TFrmMain.ConsultarFuncionarios;
begin
  TsControle.TabVisible := true;

  str_sql := 'select * from tbl_funcionarios order by idfuncionario';
  DmDados.Executa_Query(nil, DmDados.QFuncionarios, str_sql, null);
end;

procedure TFrmMain.PnCancParecerClick(Sender: TObject);
begin
  TsAdicParecer.TabVisible := false;
  LiberarObjetoParecer;
  LimparCamposParecer;

  ConsultarFuncionarios;
end;

procedure TFrmMain.PnSairVisualizaClick(Sender: TObject);
begin
  TsVisualizar.TabVisible := false;
  LiberarObjetoParecer;

  ConsultarFuncionarios;
end;

procedure TFrmMain.PnAddFuncClick(Sender: TObject);
begin
  CriarObjetoFuncionario;

  oFuncionario.idfuncionario := 0;
  oFuncionario.foto := '';

  TsControle.TabVisible := false;
  TsFuncionario.TabVisible := true;
end;

procedure TFrmMain.PnCancFuncClick(Sender: TObject);
begin
  TsFuncionario.TabVisible := false;
  LiberarObjetoFuncionario;
  LimparCamposFuncionario;

  ConsultarFuncionarios;
end;

procedure TFrmMain.Dashboard;
var
  i, idfuncao : integer;
  tdmeses: array[0..11] of String;
begin
  tdmeses[0] := 'Jan.';
  tdmeses[1] := 'Fev.';
  tdmeses[2] := 'Março';
  tdmeses[3] := 'Abril';
  tdmeses[4] := 'Maio';
  tdmeses[5] := 'Junho';
  tdmeses[6] := 'Julho';
  tdmeses[7] := 'Agosto';
  tdmeses[8] := 'Setembro';
  tdmeses[9] := 'Outubro';
  tdmeses[10] := 'Novembro';
  tdmeses[11] := 'Dez.';

  GraficoPizza.Series[0].Clear;
  GraficoPizza.Update;
  str_sql := 'select count(fun.funcao) as contagem, fun.funcao, atv.corgrafico from tbl_funcionarios fun, tbl_funcoes atv where fun.funcao = atv.nome group by fun.funcao, atv.corgrafico';
  DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);
  if DmDados.QExecutor.RecordCount > 0 then
    begin
      DmDados.QExecutor.First;
      while not DmDados.QExecutor.eof do
        begin
          GraficoPizza.Series[0].Add(DmDados.QExecutor.fieldbyname('contagem').asfloat, DmDados.QExecutor.fieldbyname('funcao').asstring, DmDados.QExecutor.fieldbyname('corgrafico').value);

          DmDados.QExecutor.Next;
        end;
    end;

  Chart1.RemoveAllSeries;
  str_sql := 'select count(fun.funcao) as contagem, fun.funcao, DATEPART(MONTH, fun.dataadmissao) as mes, atv.corgrafico, ';
  str_sql := str_sql + 'atv.idfuncoes from tbl_funcionarios fun, tbl_funcoes atv where fun.funcao = atv.nome and  DATEPART(YEAR, fun.dataadmissao) = 2021 group by fun.funcao, DATEPART(MONTH, fun.dataadmissao), DATEPART(YEAR, fun.dataadmissao), atv.corgrafico, atv.idfuncoes';
  DmDados.Executa_Query(nil, DmDados.QExecutor, str_sql, null);
  if DmDados.QExecutor.RecordCount > 0 then
    begin
      idfuncao := DmDados.QExecutor.fieldbyname('idfuncoes').asinteger;
      SerieBarra[idfuncao].Clear;
      SerieBarra[idfuncao].Title  := DmDados.QExecutor.fieldbyname('funcao').asstring;
      SerieBarra[idfuncao].SeriesColor   := DmDados.QExecutor.fieldbyname('corgrafico').value;
      SerieBarra[idfuncao].Marks.Visible := false;
      SerieBarra[idfuncao].Marks.Style := smsValue;
      SerieBarra[idfuncao].Marks.Callout.Length := 5;
      SerieBarra[idfuncao].BarWidthPercent := 60;
      Chart1.AddSeries(SerieBarra[idfuncao]);

      while not DmDados.QExecutor.eof do
        begin
          if idfuncao <> DmDados.QExecutor.fieldbyname('idfuncoes').asinteger then
            begin
              idfuncao := DmDados.QExecutor.fieldbyname('idfuncoes').asinteger;
              SerieBarra[idfuncao].Clear;
              SerieBarra[idfuncao].Title  := DmDados.QExecutor.fieldbyname('funcao').asstring;
              SerieBarra[idfuncao].SeriesColor   := DmDados.QExecutor.fieldbyname('corgrafico').value;
              SerieBarra[idfuncao].Marks.Visible := false;
              SerieBarra[idfuncao].Marks.Style := smsValue;
              SerieBarra[idfuncao].Marks.Callout.Length := 5;
              SerieBarra[idfuncao].BarWidthPercent := 60;
              Chart1.AddSeries(SerieBarra[idfuncao]);
            end;

          SerieBarra[idfuncao].Add( DmDados.QExecutor.fieldbyname('contagem').asinteger,
                      tdmeses[DmDados.QExecutor.fieldbyname('mes').asinteger - 1],
                      DmDados.QExecutor.fieldbyname('corgrafico').value);

          DmDados.QExecutor.next;
        end;
    end;

  TsDash.TabVisible := true;
  for i := 1 to PCBimer.PageCount - 1 do
    PCBimer.Pages[i].TabVisible := false;
end;

procedure TFrmMain.PnDashClick(Sender: TObject);
begin
  Dashboard;
end;

procedure TFrmMain.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  R : TRect;
begin
 R := Rect;
 Dec(R.Bottom,2);
 if Column.Field = DmDados.QParecer.fieldbyname('descricao') then
   begin
     if not (gdSelected in State) then
       DBGrid1.Canvas.FillRect(Rect);
     DrawText(DBGrid1.Canvas.Handle, pchar(DmDados.QParecer.fieldbyname('descricao').AsString), length(DmDados.QParecer.fieldbyname('descricao').AsString), R, DT_WORDBREAK);
   end;
end;

procedure TFrmMain.ListarParecer;
var
  filtros : string;
begin
  filtros := '';
  filtrodebusca := '';
  str_sql := 'select par.idparecer, par.idfuncionario, par.tipo, par.descricao, par.dataparecer, fun.login, fun.funcao ';
  str_sql := str_sql + 'from tbl_parecer par, tbl_funcionarios fun where par.idfuncionario = fun.idfuncionario ';
  if cblogin2.ItemIndex > 0 then
    begin
      filtros := filtros + 'and fun.login = '+quotedstr(cblogin2.text)+' ';
      filtrodebusca := 'Login';
    end;
  if cbfuncao2.ItemIndex > 0 then
    begin
      filtros := filtros + ' and fun.funcao = '+quotedstr(cbfuncao2.text)+' ';
      filtrodebusca := filtrodebusca +', Função';
    end;
  if (mkinicial.Text <> '  /  /    ') and (mkfinal.Text <> '  /  /    ') then
    begin
      filtros := filtros + ' and par.dataparecer between '+quotedstr(FormatDateTime('dd/mm/yyyy', StrToDate(mkinicial.Text)))+' and '+quotedstr(FormatDateTime('dd/mm/yyyy', StrToDate(mkfinal.Text)))+' ';
      filtrodebusca := filtrodebusca +', Período';
    end;

  filtros := filtros + 'order by par.idfuncionario, par.dataparecer desc';

  DmDados.Executa_Query(nil, DmDados.QParecer, str_sql+filtros, null);
end;

procedure TFrmMain.PnFiltroClick(Sender: TObject);
begin
  ListarParecer;
end;

procedure TFrmMain.PnRelatorioClick(Sender: TObject);
begin
  zebrar := 0;
  if not DmDados.QParecer.Active then
    ListarParecer;
  if filtrodebusca <> '' then
    FrmRelatorio.rlfiltros.Caption := 'Filtro de Busca: '+filtrodebusca
  else
    FrmRelatorio.rlfiltros.Caption := '';
  FrmRelatorio.RLListaParecer.prepare;
  FrmRelatorio.RLListaParecer.preview;
end;

procedure TFrmMain.PnRelatoriosClick(Sender: TObject);
var
  i : integer;
begin
  for i := PCBimer.PageCount - 2 Downto 0 do
    PCBimer.Pages[i].TabVisible := false;

  str_sql := 'select nome from tbl_funcoes order by idfuncoes';
  DmDados.Popular_Combobox(cbfuncao2, str_sql, '');

  str_sql := 'select login from tbl_funcionarios order by idfuncionario';
  DmDados.Popular_Combobox(cblogin2, str_sql, '');

  DmDados.QParecer.Close;

  TsRelatorio.TabVisible := true;
  mkinicial.ChamaBtn;
  mkfinal.ChamaBtn;
end;

procedure TFrmMain.PnFuncClick(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to PCBimer.PageCount - 1  do
    PCBimer.Pages[i].TabVisible := false;
  TsControle.TabVisible := true;

  str_sql := 'select * from tbl_funcionarios order by idfuncionario';
  DmDados.Executa_Query(nil, DmDados.QFuncionarios, str_sql, null);

  str_sql := 'select nome from tbl_funcoes order by idfuncoes';
  DmDados.Popular_Combobox(cbfuncao, str_sql, '');

  str_sql := 'select nome from tbl_tiposparecer order by idtipos';
  DmDados.Popular_Combobox(cbtipo, str_sql, '');

  mkadmissao.ChamaBtn;
  mkdesligamento.ChamaBtn;
  mkdataparecer.ChamaBtn;
end;

procedure TFrmMain.PnSalvarFuncClick(Sender: TObject);
var
  mserro : string;
begin
  with oFuncionario do
    begin
      nome := ednome.text;
      login := edlogin.text;
      senha := edsenha.text;
      funcao := cbfuncao.text;
      salario := strtofloat(edsalario.text);
      dataadmissao := mkadmissao.text;
      if mkdesligamento.text <> '  /  /    ' then
        datadesligamento := mkdesligamento.text
      else
        datadesligamento := '';
      observacao := mmobservacao.text;
    end;
  if ofuncionarioController.GravarRegistro( ofuncionario, mserro ) = false then
    messagedlg(mserro, mtwarning, [mbok], 0)
  else
    PnCancFuncClick(nil);
end;

end.
