unit uCep.DB.Model;

interface

uses
  uDB.DAO, Datasnap.DBClient,
  System.Classes;

type
  ICepDBModel = interface
    ['{5C8B293E-F4C8-42A4-8034-351E86577966}']

    function BuscarHistoricoEnderecos: TClientDataset;
    Procedure SalvarCeps(ACds: TClientDataset);
  end;

  TCepDBModel = class(TInterfacedObject, ICepDBModel)
    private

    public
      function BuscarHistoricoEnderecos: TClientDataset;
      Procedure SalvarCeps(ACds: TClientDataset);
  end;
implementation

function TCepDBModel.BuscarHistoricoEnderecos: TClientDataset;
begin
  DMCon.CdsEndereco.Open;
  Result := DMCon.CdsEndereco;
end;

{ TCepModel }

procedure TCepDBModel.SalvarCeps(ACds: TClientDataset);
begin
  DMCon.CdsEndereco.Open;
  DMCon.CdsEndereco.DisableConstraints;

  try
    ACds.DisableControls;
    ACDS.First;

    while not ACDS.Eof do
    begin
      if DMCon.CdsEndereco.Locate('Cep', ACDS.FieldByName('Cep').AsString, []) then
        DMCon.CdsEndereco.Edit
      else
        DMCon.CdsEndereco.Append;

      DMCon.CdsEndereco.CopyFields(ACDS);
      DMCon.CdsEndereco.Post;

      ACDS.Next;
    end;
    DMCon.CdsEndereco.ApplyUpdates(0);

  finally
    DMCon.CdsEndereco.EnableControls;
  end;
end;

end.
