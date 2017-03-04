unit FIWClasses;

interface

uses System.Sensors;

type

TWlanInfo = class
  private
    FName: string;
    FLocation: TLocationCoord2D;
  public
    constructor Create;
    property Name: string read FName write FName;
    property Location: TLocationCoord2D read FLocation write FLocation;
    destructor Destroy; override;
end;

implementation

constructor TWlanInfo.Create;
begin
  inherited;
end;

destructor TWlanInfo.Destroy;
begin
  inherited;
end;

end.
