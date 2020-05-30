object fCadCliente: TfCadCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 406
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDados: TPanel
    Left = 0
    Top = 0
    Width = 492
    Height = 352
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowCaption = False
    TabOrder = 0
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 482
      Height = 342
      Align = alClient
      Caption = 'Dados do Cliente'
      TabOrder = 0
      object lblNome: TLabel
        Left = 7
        Top = 18
        Width = 30
        Height = 13
        Caption = 'Nome'
      end
      object lblIdentidade: TLabel
        Left = 7
        Top = 43
        Width = 56
        Height = 13
        Caption = 'Identidade'
      end
      object lblCPF: TLabel
        Left = 7
        Top = 68
        Width = 19
        Height = 13
        Caption = 'CPF'
      end
      object lblTelefone: TLabel
        Left = 7
        Top = 93
        Width = 43
        Height = 13
        Caption = 'Telefone'
      end
      object lblEmail: TLabel
        Left = 7
        Top = 118
        Width = 27
        Height = 13
        Caption = 'Email'
      end
      object GroupBox2: TGroupBox
        Left = 2
        Top = 156
        Width = 478
        Height = 184
        Align = alBottom
        Caption = 'Endere'#231'o'
        TabOrder = 0
        object lblCEP: TLabel
          Left = 15
          Top = 15
          Width = 19
          Height = 13
          Caption = 'CEP'
        end
        object lblLogradouro: TLabel
          Left = 15
          Top = 40
          Width = 61
          Height = 13
          Caption = 'Logradouro'
        end
        object lblBairro: TLabel
          AlignWithMargins = True
          Left = 15
          Top = 90
          Width = 31
          Height = 13
          Caption = 'Bairro'
        end
        object lblMunicipio: TLabel
          Left = 15
          Top = 115
          Width = 52
          Height = 13
          Caption = 'Munic'#237'pio'
        end
        object lblPais: TLabel
          Left = 15
          Top = 140
          Width = 20
          Height = 13
          Caption = 'Pa'#237's'
        end
        object lblUF: TLabel
          Left = 271
          Top = 115
          Width = 14
          Height = 13
          Caption = 'UF'
        end
        object lblNumero: TLabel
          Left = 15
          Top = 65
          Width = 41
          Height = 13
          Caption = 'N'#250'mero'
        end
        object lblComplemento: TLabel
          Left = 153
          Top = 65
          Width = 72
          Height = 13
          Caption = 'Complemento'
        end
        object Label1: TLabel
          Left = 159
          Top = 15
          Width = 129
          Height = 13
          Caption = '(Digite apenas n'#250'meros)'
          Color = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsItalic]
          ParentColor = False
          ParentFont = False
        end
        object edtLogradouro: TEdit
          Left = 94
          Top = 37
          Width = 250
          Height = 21
          TabOrder = 0
        end
        object edtBairro: TEdit
          Left = 94
          Top = 87
          Width = 250
          Height = 21
          TabOrder = 1
        end
        object edtMunicipio: TEdit
          Left = 94
          Top = 112
          Width = 171
          Height = 21
          TabOrder = 2
        end
        object edtUF: TEdit
          Left = 302
          Top = 112
          Width = 42
          Height = 21
          TabOrder = 3
        end
        object edtPais: TEdit
          Left = 94
          Top = 137
          Width = 250
          Height = 21
          TabOrder = 4
        end
        object edtNumero: TEdit
          Left = 94
          Top = 62
          Width = 42
          Height = 21
          TabOrder = 5
        end
        object edtComplemento: TEdit
          Left = 243
          Top = 62
          Width = 101
          Height = 21
          TabOrder = 6
        end
        object edtCep: TMaskEdit
          Left = 94
          Top = 12
          Width = 59
          Height = 21
          EditMask = '00000\-999;1;_'
          MaxLength = 9
          TabOrder = 7
          Text = '     -   '
          OnExit = edtCEPExit
        end
      end
      object edtNome: TEdit
        Left = 96
        Top = 15
        Width = 250
        Height = 21
        TabOrder = 1
      end
      object edtIdentidade: TEdit
        Left = 96
        Top = 40
        Width = 250
        Height = 21
        TabOrder = 2
      end
      object edtCPF: TEdit
        Left = 96
        Top = 65
        Width = 250
        Height = 21
        TabOrder = 3
      end
      object edtTelefone: TEdit
        Left = 96
        Top = 90
        Width = 250
        Height = 21
        TabOrder = 4
      end
      object edtEmail: TEdit
        Left = 96
        Top = 115
        Width = 250
        Height = 21
        TabOrder = 5
      end
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 352
    Width = 492
    Height = 54
    Align = alBottom
    BevelKind = bkFlat
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ShowCaption = False
    TabOrder = 1
    DesignSize = (
      488
      50)
    object btnCadastrar: TButton
      AlignWithMargins = True
      Left = 352
      Top = 13
      Width = 135
      Height = 33
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Cadastrar por e-mail'
      TabOrder = 0
      OnClick = btnCadastrarClick
    end
  end
  object rstClient: TRESTClient
    Accept = 'application/json;q=0.9,text/plain;q=0.9,text/html'
    AcceptCharset = 'UTF-8'
    BaseURL = 'http://viacep.com.br'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 336
    Top = 168
  end
  object rstRequest: TRESTRequest
    Accept = 'application/json;q=0.9,text/plain;q=0.9,text/html'
    AcceptCharset = 'UTF-8'
    Client = rstClient
    Params = <
      item
        Kind = pkURLSEGMENT
        Name = 'cep'
        Options = [poAutoCreated]
      end>
    Resource = 'ws/{cep}/json/'
    Response = rstResponse
    SynchronizedEvents = False
    Left = 368
    Top = 168
  end
  object rstResponse: TRESTResponse
    Left = 400
    Top = 168
  end
end
