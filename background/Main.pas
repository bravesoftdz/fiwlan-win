unit Main;

interface

uses System.Types, System.SysUtils, System.Classes, WlanInfo,
     System.Generics.Collections, WindowsWLANGetter;

procedure MainProgram;

implementation

procedure MainProgram;
var Networks : TObjectList<TWlanInfo>;
    Network: TWlanInfo;
begin
  Networks:=TWinNetworkInfo.GetNetworkInfo;
  for Network in Networks do
    Writeln('Network ' + Network.Name);
  FreeAndNil(Networks);
end;

end.
