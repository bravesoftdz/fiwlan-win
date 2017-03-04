unit FIWSender;

interface

uses FIWClasses, System.Generics.Collections, System.SysUtils,
      System.Net.HttpClient,
      System.Net.HTTPClientComponent, System.Classes;

type

TFIWSender = class
  class procedure SendToServer(Info: TObjectList<TWlanInfo>);
end;

const

SERVER_IP='192.168.43.105';
SERVER_PORT='5678';
SERVER_ENDPOINT='';

implementation

class procedure TFIWSender.SendToServer(Info: TObjectList<TWlanInfo>);
var Network: TWlanInfo;
    Client: TNetHTTPClient;
    i: integer;
    URL: string;
    StringList: TStringList;
    FS:TFormatSettings;
    Response: IHTTPResponse;
begin
  FS.DecimalSeparator:='.';
  Client := TNetHTTPClient.Create(nil);
  StringList := TStringList.Create;
    for Network in Info do
    begin
      try
        URL := 'http://' + SERVER_IP + ':' + SERVER_PORT +
          '/' + SERVER_ENDPOINT + '?' +
          'name=' + Network.Name + '&' +
          'lat=' + FloatTostr(Network.Location.Latitude,FS) + 'F&' +
          'long=' + FloatToStr(Network.Location.Longitude,FS) + 'F';
        Response:=Client.Post(URL,StringList);
      except
        continue;
       end;
    end;
  FreeAndNil(Client);
  FreeAndNil(StringList);
end;

end.
