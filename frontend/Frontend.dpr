program Frontend;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMainView in 'views\fMainView.pas' {Form1},
  DataInputView in 'views\DataInputView.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
