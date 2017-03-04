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
var Client: TNetHTTPClient;
    URL: string;
    Response: IHTTPResponse;
    X: ISuperObject;
begin
  Client := TNetHTTPClient.Create(nil);
  try
    URL:='https://pos.cit.api.here.com/positioning/v1/locate'
          + '?app_id=' + 'AVXyCDekzRs00iaDF4YH'
          + '&app_code=' + 'DCwSahLUWz5YFQCijAC5jQ';
    Client.ContentType:='application/json';
    Client.Accept:='application/json';
    Response:=Client.Post(URL,'query.json');
    x := SO(Response.ContentAsString());
    Result.Longitude:=X.O['location'].F['lng'];
    Result.Latitude:=X.O['location'].F['lat'];
  finally
    FreeAndNil(Client);
  end;
end;

end.
