unit WindowsLocationInfo;

interface

uses System.Sensors, System.SysUtils, System.Net.HttpClient,
      System.Net.HTTPClientComponent, XSuperObject, System.Classes;

type

TWindowsLocationInfo = class
  class function GetLocation: TLocationCoord2D;
end;

implementation

class function TWindowsLocationInfo.GetLocation: TLocationCoord2D;
begin
  Result.Latitude:=52.505616;
  Result.Longitude:= 13.393037;
end;

end.
