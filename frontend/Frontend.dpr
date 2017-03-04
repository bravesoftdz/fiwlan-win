program Frontend;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMainView in 'fMainView.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
