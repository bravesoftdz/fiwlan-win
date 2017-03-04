unit fMainView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Sensors,
  System.Sensors.Components, FMX.Controls.Presentation, FMX.StdCtrls, ceffmx;

type
  TForm1 = class(TForm)
    ChromiumFMX1: TChromiumFMX;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormShow(Sender: TObject);
begin
  ChromiumFMX1.Load
    ('file://C:/Prog/scb2017/fiwlan-win/frontend/Win32/Debug/maprender.html');
end;

end.
