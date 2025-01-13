unit uDB.DAO;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Datasnap.DBClient, Datasnap.Provider;

type
  TDMCon = class(TDataModule)
    FDCon: TFDConnection;
    QryEndereco: TFDQuery;
    PrvEndereco: TDataSetProvider;
    CdsEndereco: TClientDataSet;
    QryEnderecoCep: TStringField;
    QryEnderecoLogradouro: TStringField;
    QryEnderecoComplemento: TStringField;
    QryEnderecoUnidade: TStringField;
    QryEnderecoBairro: TStringField;
    QryEnderecoLocalidade: TStringField;
    QryEnderecoUf: TStringField;
    QryEnderecoEstado: TStringField;
    QryEnderecoRegiao: TStringField;
    QryEnderecoIbge: TStringField;
    QryEnderecoGia: TStringField;
    QryEnderecoDdd: TStringField;
    QryEnderecoSiafi: TStringField;
    CdsEnderecoCep: TStringField;
    CdsEnderecoLogradouro: TStringField;
    CdsEnderecoComplemento: TStringField;
    CdsEnderecoUnidade: TStringField;
    CdsEnderecoBairro: TStringField;
    CdsEnderecoLocalidade: TStringField;
    CdsEnderecoUf: TStringField;
    CdsEnderecoEstado: TStringField;
    CdsEnderecoRegiao: TStringField;
    CdsEnderecoIbge: TStringField;
    CdsEnderecoGia: TStringField;
    CdsEnderecoDdd: TStringField;
    CdsEnderecoSiafi: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCon: TDMCon;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
