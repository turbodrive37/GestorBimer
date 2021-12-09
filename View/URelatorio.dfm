object FrmRelatorio: TFrmRelatorio
  Left = 0
  Top = 0
  Caption = 'FrmRelatorio'
  ClientHeight = 381
  ClientWidth = 806
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLListaParecer: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    Margins.LeftMargin = 5.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Margins.BottomMargin = 5.000000000000000000
    DataSource = DmDados.DsParecer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Title = 'Relat'#243'rio de Parecer dos Funcion'#225'rios'
    ExpressionParser = RLExpressionParser1
    object RLBand1: TRLBand
      Left = 19
      Top = 19
      Width = 756
      Height = 72
      BandType = btColumnHeader
      object RLLabel1: TRLLabel
        Left = 224
        Top = 3
        Width = 265
        Height = 19
        Caption = 'Lista de Parecer dos Funcion'#225'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 3
        Top = 56
        Width = 31
        Height = 16
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 73
        Top = 56
        Width = 28
        Height = 16
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 302
        Top = 56
        Width = 62
        Height = 16
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rlfiltros: TRLLabel
        Left = 3
        Top = 34
        Width = 31
        Height = 16
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 19
      Top = 91
      Width = 756
      Height = 74
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      DataFields = 'login'
      object RLBand2: TRLBand
        Left = 0
        Top = 1
        Width = 756
        Height = 15
        BandType = btColumnHeader
        object RLDBText1: TRLDBText
          Left = 0
          Top = 0
          Width = 67
          Height = 14
          Align = faLeftTop
          DataField = 'login'
          DataSource = DmDados.DsParecer
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = 'Login: '
        end
        object RLDBText4: TRLDBText
          Left = 259
          Top = 0
          Width = 85
          Height = 14
          DataField = 'funcao'
          DataSource = DmDados.DsParecer
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = 'Fun'#231#227'o: '
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 16
        Width = 756
        Height = 36
        BeforePrint = RLBand3BeforePrint
        object RLDBText2: TRLDBText
          Left = 1
          Top = 2
          Width = 66
          Height = 14
          AutoSize = False
          DataField = 'dataparecer'
          DataSource = DmDados.DsParecer
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 73
          Top = 2
          Width = 224
          Height = 14
          AutoSize = False
          DataField = 'tipo'
          DataSource = DmDados.DsParecer
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBMemo1: TRLDBMemo
          Left = 302
          Top = 2
          Width = 451
          Height = 31
          AutoSize = False
          Behavior = [beSiteExpander]
          DataField = 'descricao'
          DataSource = DmDados.DsParecer
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 52
        Width = 756
        Height = 16
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 632
          Top = 0
          Width = 124
          Height = 16
          Align = faRight
          DataField = 'idparecer'
          DataSource = DmDados.DsParecer
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Info = riCount
          ParentFont = False
          Text = 'N'#186' de Registros: '
        end
      end
    end
    object RLBand4: TRLBand
      Left = 19
      Top = 181
      Width = 756
      Height = 16
      BandType = btFooter
      object RLSystemInfo1: TRLSystemInfo
        Left = 684
        Top = 0
        Width = 72
        Height = 14
        Align = faRightTop
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 0
        Top = 0
        Width = 104
        Height = 13
        Align = faLeftTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        Info = itNow
        ParentFont = False
        Text = 'Impresso em '
      end
    end
    object RLBand6: TRLBand
      Left = 19
      Top = 165
      Width = 756
      Height = 16
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDBResult2: TRLDBResult
        Left = 574
        Top = 1
        Width = 182
        Height = 15
        Align = faRight
        DataField = 'idparecer'
        DataSource = DmDados.DsParecer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        Info = riCount
        ParentFont = False
        Text = 'Total de Registros Listados: '
      end
    end
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 472
    Top = 232
  end
  object RLHTMLFilter1: TRLHTMLFilter
    DocumentStyle = dsCSS2
    DisplayName = 'Formato HTML'
    Left = 552
    Top = 232
  end
  object RLRichFilter1: TRLRichFilter
    DisplayName = 'Documento do Word'
    Left = 160
    Top = 240
  end
  object RLExpressionParser1: TRLExpressionParser
    Left = 320
    Top = 256
  end
end
