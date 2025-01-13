unit uCep.DB.Controller;

interface

uses
  Datasnap.DBClient, uCep.DB.Model;

type
  TCepDBController = class
  public
    class function BuscarHistoricoEnderecos: TClientDataset;
    class Procedure SalvarCeps(ACds: TClientDataSet);
  end;

implementation

{ TCepDBController }

class function TCepDBController.BuscarHistoricoEnderecos: TClientDataset;
var IModel: ICepDBModel;
begin
  IModel := TCepDBModel.Create;
  Result := IModel.BuscarHistoricoEnderecos;
end;

class procedure TCepDBController.SalvarCeps(ACds: TClientDataSet);
var IModel: ICepDBModel;
begin
  IModel := TCepDBModel.Create;
  IModel.SalvarCeps(ACds);
end;

end.
