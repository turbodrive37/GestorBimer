unit UntMaskedit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.ComCtrls, system.uitypes, Vcl.WinXCalendars;

type
  TMaskEditHelper = class helper for TMaskEdit
  public
    class var bt : TBitBtn;
    class var mcalen : TCalendarView;

    procedure ChamaBtn;
    procedure ChamaCal(Sender : TObject);
    procedure JogaCal(Sender : TObject);
    procedure FechaCal(Sender : TObject);
    procedure ValidarData(Sender: TObject);
  end;

implementation

{ TMaskEditHelper }

procedure TMaskEditHelper.ChamaBtn;
begin
  if TMaskEdit(Self) = nil then
    Exit;

  bt := Tbitbtn.Create(Self);
  try
    bt.Name := 'BtCal'+TMaskEdit(Self).name;
  except
  end;
  bt.Height := TMaskEdit(Self).height;
  bt.width := 30;
  bt.Left := TMaskEdit(Self).Left + TMaskEdit(Self).width + 1;
  bt.top := TMaskEdit(Self).top;
  bt.Caption := '▼';
  bt.Visible := true;
  bt.TabStop := false;
  bt.OnClick := ChamaCal;

  TMaskEdit(Self).OnExit := FechaCal;
  TMaskEdit(Self).EditMask := '99/99/9999;1;_';

  bt.Parent := TForm(Self).parent;
end;

procedure TMaskEditHelper.ChamaCal(Sender: TObject);
begin
  if not Assigned(mcalen)  then
    begin
      mcalen := TCalendarView.Create(Nil);
      mcalen.Name := 'Cal'+TMaskEdit(Self).name;
      mcalen.width := 195;
      mcalen.height := 145;
      mcalen.Font.Size := 10;
      mcalen.HeaderInfo.Font.Size := 10;

      if ( ( TForm(Self).height - TMaskEdit(Self).top ) <= 147) and ( TMaskEdit(Self).top > 147 ) then // cálculo da posição do calendário
        mcalen.top := TMaskEdit(Self).top - 147
      else
        mcalen.top := TMaskEdit(Self).top + TMaskEdit(Self).height + 2;

      if  TMaskEdit(Self).Left < 130  then
        mcalen.Left := TMaskEdit(Self).Left
      else
        mcalen.Left := TMaskEdit(Self).Left - 100;

      mcalen.visible := true;
      mcalen.Onchange := JogaCal;

      mcalen.Parent := TForm(Self).parent;
    end
  else
    begin
      mcalen.visible := false;
      mcalen := nil;
      FreeandNil(mcalen);
    end;
end;

procedure TMaskEditHelper.ValidarData(Sender: TObject);
begin
  try
    if TMaskEdit(Self).text <> '  /  /    ' then
      strtodate(TMaskEdit(Self).text);
  except
    TMaskEdit(Self).clear;
    messagedlg('DATA INVÁLIDA', mtwarning, [mbok], 0);
  end;
end;

procedure TMaskEditHelper.FechaCal(Sender: TObject);
begin
  if Assigned(mcalen)  then
    begin
      mcalen.Visible := false;
      mcalen := nil;
      FreeandNil(mcalen);
    end;

  ValidarData(Sender);
end;

procedure TMaskEditHelper.JogaCal(Sender: TObject);
begin
  if Assigned(mcalen) then
    begin
      TMaskEdit(Self).text := datetostr(mcalen.Date);
      mcalen.Visible := false;
      mcalen := nil;
      FreeandNil(mcalen);
    end;
end;

end.
