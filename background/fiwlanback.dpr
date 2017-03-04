program fiwlanback;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Main in 'Main.pas',
  nduWlanAPI in 'deps\WlanAPI\nduWlanAPI.pas',
  nduWlanTypes in 'deps\WlanAPI\nduWlanTypes.pas',
  nduCType in 'deps\WlanAPI\nduCType.pas',
  nduEapTypes in 'deps\WlanAPI\nduEapTypes.pas',
  nduL2cmn in 'deps\WlanAPI\nduL2cmn.pas',
  nduNtDDNdis in 'deps\WlanAPI\nduNtDDNdis.pas',
  nduWinDot11 in 'deps\WlanAPI\nduWinDot11.pas',
  nduWinNT in 'deps\WlanAPI\nduWinNT.pas',
  WlanInfo in 'WlanInfo.pas',
  WindowsWlanGetter in 'WindowsWlanGetter.pas';

begin
  try
    { TODO -oUser -cConsole Main : Code hier einfügen }
    MainProgram;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
