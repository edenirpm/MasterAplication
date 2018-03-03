unit model.work;

interface
uses
 UInterfaces;
Type

TWork = class(TinterfacedObject,Iwork)
  public
    procedure Execute;
end;

implementation
uses
  System.SysUtils;

{ TWork }
procedure TWork.Execute;
begin
Sleep(3000);
end;

end.
