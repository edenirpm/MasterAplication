unit controller.frmExemple;

interface
uses
Uinterfaces,model.work;
Type
TControllerFrmExemple = class
  private
    FAWork: IWork;
    procedure SetAWork(const Value: IWork);
  published
  property AWork:IWork read FAWork write SetAWork;
  constructor create;
end;
implementation

{ TControllerFrmExemple }

constructor TControllerFrmExemple.create;
begin
FAWork:=TWork.Create;
end;

procedure TControllerFrmExemple.SetAWork(const Value: IWork);
begin
  FAWork := Value;
end;

end.
