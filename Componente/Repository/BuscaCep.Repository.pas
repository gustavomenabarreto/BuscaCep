unit BuscaCep.Repository;

interface

uses
  System.Classes,
  System.Generics.Collections,
  REST.Json,
  Gerador.Logs,
  Busca.Cep.Viacep.Model,
  REST.Types, REST.Client,
  IdURI, System.SysUtils, Vcl.Dialogs,
  Xml.XMLDoc, Xml.XMLIntf;

type
  IBuscaCepRepository<T> = interface
    ['{D60B0B13-9EC9-446A-8BD9-58778D14F394}']
    function GetCep(ACep: string): T;
    procedure SetTipoBusca(const Value: TTipoBusca);
  end;

  TTipoBuscaHelper = record Helper for TTipoBusca
    function ToString: string;
  end;

  TBuscaCepRepository = class(TInterfacedObject,
    IBuscaCepRepository<TListViacep>)
  private const
    URL_VIACEP = 'https://viacep.com.br/ws/';

  var
    FRESTRequest: TRESTRequest;
    FRESTClient: TRESTClient;
    FTipoBusca: TTipoBusca;
    function DesserializarXMLParaDTO(const AXml: string): TListViacep;
  public
    function GetCep(ACep: string): TListViacep;
    procedure SetTipoBusca(const Value: TTipoBusca);

    constructor Create();
    destructor Destroy; override;

  end;

implementation

uses
  StrUtils;

{ TTBuscaCepRepository<T> }
constructor TBuscaCepRepository.Create();
begin
  FRESTClient := TRESTClient.Create(Nil);
  FRESTRequest := TRESTRequest.Create(FRESTClient);
  FRESTClient.Accept := '*/*';
  FRESTClient.AcceptCharset := 'utf-8';
  FRESTClient.AllowCookies := true;
  FRESTRequest.Client := FRESTClient;
end;

destructor TBuscaCepRepository.Destroy;
begin
  FRESTRequest.Free;
  FRESTClient.Free;
  inherited;
end;

procedure TBuscaCepRepository.SetTipoBusca(const Value: TTipoBusca);
begin
  FTipoBusca := Value;
end;

function TBuscaCepRepository.GetCep(ACep: string): TListViacep;
var
  lbSucess: Boolean;
  lContent: String;
begin
  lbSucess := false;
  try
    FRESTClient.BaseURL := TIdURI.URLEncode(URL_VIACEP + ACep.Replace('-', '') + FTipoBusca.ToString);

    FRESTRequest.Method := rmGET;
    FRESTRequest.Execute;

    case FTipoBusca of
      tpXML:
        begin
          Result := DesserializarXMLParaDTO(FRESTRequest.Response.Content);
        end;
      tpJson:
        begin
          lContent := ifthen(FRESTRequest.Response.JSONText.Contains('['),
            FRESTRequest.Response.JSONText,
            '[' + FRESTRequest.Response.JSONText + ']');

          Result := TViacepModel.FromJsonArray(lContent);
        end;
    end;

    lbSucess := Assigned(Result) and (not Result[0].Cep.Trim.IsEmpty);

    if not lbSucess then
      MessageDlg
        ('O Cep informado, não foi encontrado, verifique se o mesmo, existe!',
        TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);

  except
    on E: Exception do
    begin
      TLog.GravarLog('TBuscaCepRepository.GetCep: TClientSocket<TApiCepModel> '
        + E.Message);
    end;
  end;
end;

function TBuscaCepRepository.DesserializarXMLParaDTO(const AXml: string)
  : TListViacep;
var
  XMLDoc: IXMLDocument;
  RootNode, ItemNode, EnderecosNode: IXMLNode;
  lItems: TViacepModel;
  I: Integer;

  procedure AdicionarItem(AXml: IXMLNode);
  begin
    lItems := TViacepModel.Create;

    lItems.Cep := AXml.ChildNodes['cep'].Text;
    lItems.Logradouro := AXml.ChildNodes['logradouro'].Text;
    lItems.Complemento := AXml.ChildNodes['complemento'].Text;
    lItems.Unidade := AXml.ChildNodes['unidade'].Text;
    lItems.Bairro := AXml.ChildNodes['bairro'].Text;
    lItems.Localidade := AXml.ChildNodes['localidade'].Text;
    lItems.Uf := AXml.ChildNodes['uf'].Text;
    lItems.Estado := AXml.ChildNodes['estado'].Text;
    lItems.Regiao := AXml.ChildNodes['regiao'].Text;
    lItems.Ibge := AXml.ChildNodes['ibge'].Text;
    lItems.Gia := AXml.ChildNodes['gia'].Text;
    lItems.Ddd := AXml.ChildNodes['ddd'].Text;
    lItems.Siafi := AXml.ChildNodes['siafi'].Text;
    Result.Add(lItems);
  end;

begin
  XMLDoc := LoadXMLData(AXml);
  RootNode := XMLDoc.DocumentElement;
  Result := TListViacep.Create;
  EnderecosNode := RootNode.ChildNodes.FindNode('enderecos');
  try
    if EnderecosNode = nil then // Apenas um item
    begin
      AdicionarItem(RootNode);
    end
    else
      for I := 0 to RootNode.ChildNodes.Count - 1 do // Lista de endereco
      begin
        for var J := 0 to EnderecosNode.ChildNodes.Count - 1 do
        begin
          ItemNode := EnderecosNode.ChildNodes[I];
          if ItemNode.NodeName = 'endereco' then
          begin
            AdicionarItem(ItemNode);
          end;
        end;
      end;
  except
    Result.Free;
    raise;
  end;
end;

{ TTipoBuscaHelper }

function TTipoBuscaHelper.ToString: string;
begin
  case self of
    tpXML:
      Result := '/xml/';
    tpJson:
      Result := '/json/';
  end;
end;

end.
