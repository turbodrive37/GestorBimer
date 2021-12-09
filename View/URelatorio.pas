unit URelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLRichFilter, RLHTMLFilter,
  RLFilters, RLPDFFilter, RLParser;

type
  TFrmRelatorio = class(TForm)
    RLListaParecer: TRLReport;
    RLBand1: TRLBand;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLBand4: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBMemo1: TRLDBMemo;
    RLBand5: TRLBand;
    RLDBResult1: TRLDBResult;
    RLBand6: TRLBand;
    RLDBResult2: TRLDBResult;
    RLPDFFilter1: TRLPDFFilter;
    RLHTMLFilter1: TRLHTMLFilter;
    RLRichFilter1: TRLRichFilter;
    rlfiltros: TRLLabel;
    RLExpressionParser1: TRLExpressionParser;
    RLDBText4: TRLDBText;
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelatorio: TFrmRelatorio;

implementation

{$R *.dfm}

uses UDados, UMain;

procedure TFrmRelatorio.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if FrmMain.zebrar mod 2 = 1 then
    TRLBand(sender).Color := $00E4E4E4
  else
    TRLBand(sender).Color := clWhite;
  inc(FrmMain.zebrar);
end;

end.
