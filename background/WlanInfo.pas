unit WlanInfo;

interface

type
TWlanInfo = class
  private
    FName: string;
  public
    constructor Create;
    property Name: string read FName write FName;
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
