unit Busca.Cep.Controller;

interface

uses
  Classes,
  BuscaCep.Services,
  BuscaCep.Repository,
  Busca.Cep.ViaCep.Model;

Type
  TBuscaCepController = class(TComponent)
  private
    FIBuscaCepServices: IBuscaCepServices;
    FTipoBusca: TTipoBusca;
  published
    function BuscarCep(ACep: String): TListViacep;

    property TipoBusca: TTipoBusca read FTipoBusca write FTipoBusca;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

procedure Register;

implementation

uses
  System.SysUtils;

{ TBuscaCepController }

procedure Register;
begin
  RegisterComponents('BuscaCep', [TBuscaCepController]);
end;

function TBuscaCepController.BuscarCep(ACep: string): TListViacep;
begin
  FIBuscaCepServices := TBuscaCepServices.Create(TBuscaCepRepository.Create);
  try
    FIBuscaCepServices.SetTipoBusca(TipoBusca);
    Result := FIBuscaCepServices.GetCep(ACep);
  finally
    FIBuscaCepServices := Nil;
  end;
end;

constructor TBuscaCepController.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TBuscaCepController.Destroy;
begin
  FIBuscaCepServices := Nil;
  inherited;
end;

end.
