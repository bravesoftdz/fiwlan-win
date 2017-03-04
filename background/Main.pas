unit Main;

interface

uses System.Types, System.SysUtils, System.Classes, FIWClasses,
     System.Generics.Collections, WindowsWLANGetter, WindowsLocationInfo,
     System.Sensors, FIWSender;

procedure MainProgram;

implementation

procedure MainProgram;
var Networks : TObjectList<TWlanInfo>;
    Network: TWlanInfo;
    Location: TLocationCoord2D;
begin
  while true do
  begin
  Networks:=TWinNetworkInfo.GetNetworkInfo;
  Location:=TWindowsLocationInfo.GetLocation;;
  for Network in Networks do
    begin
    Network.Location:=Location;
    end;
  if Networks.Count>0 then
    TFIWSender.SendToServer(Networks);
  FreeAndNil(Networks);
  Sleep(5000);
  end;
end;

end.
