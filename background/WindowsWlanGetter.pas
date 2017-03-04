unit WindowsWlanGetter;

interface

uses nduWlanAPI, System.Types, System.SysUtils, System.Classes, nduWlanTypes,
    FIWClasses, System.Generics.Collections;

type

TWinNetworkInfo = class
  class function GetNetworkInfo: TObjectList<TWlanInfo>;
end;

implementation

class function TWinNetworkInfo.GetNetworkInfo: TObjectList<TWlanInfo>;
var Handle: DWORD;
    NegotiatedVersion: DWORD; //Version used in this session
    pAvailableNetworkList: Pndu_WLAN_AVAILABLE_NETWORK_LIST;  //Interface to network list
    pWlanInterfaceInfo: Pndu_WLAN_INTERFACE_INFO_LIST; //Info about wireless interfaces
    i, j, z: integer;          //Loop variables
    pInterfaceGUID: PGUID; //GUID buffer
    SDummy: string; //Buf string
    NewNetwork: TWlanInfo;
begin
  SDummy:='';
  Result:=TObjectList<TWlanInfo>.Create(true);
  {Get handle of wlan api}
  if not WlanOpenHandle(2,nil,@NegotiatedVersion,@Handle)=0 then
    raise Exception.Create('WinOpenHandle not succeded');
  try
    try
      {Get wlan network interfaces}
      if not WlanEnumInterfaces(Handle,nil,@pWlanInterfaceInfo)=0 then
        raise Exception.Create('WlanEnumInterfaces not succeded');
      for i:=0 to pWlanInterfaceInfo^.dwNumberOfItems-1 do
        begin
         {Get list of networks for every interface}
          pInterfaceGUID:=@pWlanInterfaceInfo^
            .InterfaceInfo[pWlanInterfaceInfo^.dwIndex].InterfaceGuid;
          if not WlanGetAvailableNetworkList(Handle,pInterfaceGUID,
              WLAN_AVAILABLE_NETWORK_INCLUDE_ALL_ADHOC_PROFILES
              ,nil,
              pAvailableNetworkList) = 0 then
              raise Exception.Create('WlanGetAvailibleNetworkList not succeded');
         {if network is open, save the information}
         for j:=0 to pAvailableNetworkList^.dwNumberOfItems - 1 do
         begin
           SDummy:='';
           if not (pAvailableNetworkList^.Network[j].dot11DefaultAuthAlgorithm
           =DOT11_AUTH_ALGO_80211_OPEN) then
             continue;
           {If open network found, save ssid and name}
           //Become SSID
           for z:=0 to pAvailableNetworkList^.Network[j].dot11Ssid.uSSIDLength-1 do
               SDummy := SDummy + Chr(pAvailableNetworkList^.Network[j].dot11Ssid.ucSSID[z]);
           if SDummy.Trim='' then
               continue;
           NewNetwork:=TWlanInfo.Create;
           NewNetwork.Name:=SDummy.Trim;
           Result.Add(NewNetwork);
         end;
        end;
   except
     FreeAndNil(Result);
   end;
  finally
   WlanCloseHandle(Handle,nil);
  end;
end;

end.
