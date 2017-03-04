program Frontend;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMainView in 'fMainView.pas' {Form1},
  ceffmx in 'dep\dcef3\ceffmx.pas',
  cefgui in 'dep\dcef3\cefgui.pas',
  ceflib in 'dep\dcef3\ceflib.pas',
  cefvcl in 'dep\dcef3\cefvcl.pas',
  ceferr in 'dep\dcef3\ceferr.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
