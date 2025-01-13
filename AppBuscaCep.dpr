program AppBuscaCep;

uses
  Vcl.Forms,
  uMain in 'View\uMain.pas' {FrBuscaCep},
  uCep.DB.Controller in 'Controller\uCep.DB.Controller.pas',
  uDB.DAO in 'DAO\uDB.DAO.pas' {DMCon: TDataModule},
  uCep.DB.Model in 'Model\uCep.DB.Model.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrBuscaCep, FrBuscaCep);
  Application.CreateForm(TDMCon, DMCon);
  Application.Run;
end.
