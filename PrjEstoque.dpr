program PrjEstoque;

uses
  Vcl.Forms,
  UnCadastro in 'UnCadastro.pas' {FrmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
