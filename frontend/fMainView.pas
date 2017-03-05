unit fMainView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Sensors,
  System.Sensors.Components, FMX.Controls.Presentation, FMX.StdCtrls, ceflib,
  ceffmx, FMX.Objects, FMX.MultiView;

type
  TForm1 = class(TForm)
    ChromiumFMX1: TChromiumFMX;
    AniIndicator1: TAniIndicator;
    procedure FormShow(Sender: TObject);
    procedure ChromiumFMX1RequestGeolocationPermission(Sender: TObject;
      const browser: ICefBrowser; const requestingUrl: ustring;
      requestId: Integer; const callback: ICefGeolocationCallback;
      out Result: Boolean);
    procedure ChromiumFMX1LoadEnd(Sender: TObject; const browser: ICefBrowser;
      const frame: ICefFrame; httpStatusCode: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.ChromiumFMX1LoadEnd(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; httpStatusCode: Integer);
begin
  AniIndicator1.Enabled:=false;
  AniIndicator1.Visible:=false;
end;

procedure TForm1.ChromiumFMX1RequestGeolocationPermission(Sender: TObject;
  const browser: ICefBrowser; const requestingUrl: ustring; requestId: Integer;
  const callback: ICefGeolocationCallback; out Result: Boolean);
var Frame: TCefFrameRef;
begin
  Result:=true;
  callback.Cont(true);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ChromiumFMX1.Load
    ('C:\Prog\scb2017\fiwlan-win\frontend\Win32\Debug\webpage\maprender.html');
end;

end.
