unit controller.frmBase;

interface
uses
 UInterfaces,model.observer,model.efectTextUP;
Type
TControllerFrmBase = class
  private
    FObserver: IObserver;
    FEfectLabelUP: IEfect;
    procedure SetObserver(const Value: IObserver);
    procedure SetEfectLabelUP(const Value: IEfect);
  public
  property Observer : IObserver read FObserver write SetObserver;
  property EfectLabelUP:IEfect read FEfectLabelUP write SetEfectLabelUP;
  constructor create;
end;

implementation

{ TControllerFrmBase }

constructor TControllerFrmBase.create;
begin
FObserver:=TObserver.create;
FEfectLabelUP:=TEfectTextUP.Create;
end;


procedure TControllerFrmBase.SetEfectLabelUP(const Value: IEfect);
begin
  FEfectLabelUP := Value;
end;

procedure TControllerFrmBase.SetObserver(const Value: IObserver);
begin
  FObserver := Value;
end;

end.
