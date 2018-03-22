unit controller.frmExemple;

interface
uses
Uinterfaces,model.work,udao,model.user, FMX.Dialogs,model.users,fmx.listview;
Type
TControllerFrmExemple = class(TInterfacedObject,IWork)
  private
    FAWork: IWork;
    FDao: IDao;
    FDisplay: Tobject;
    procedure SetAWork(const Value: IWork);
    procedure SetDao(const Value: IDao);
    procedure SetDisplay(const Value: Tobject);
    property Dao:IDao read FDao write SetDao;
    property Display:Tobject read Fdisplay write SetDisplay;
  public
  procedure Execute;overload;
  property AWork:IWork read FAWork write SetAWork;
  procedure ADisplay(AObject:TObject);
  function Getusers(AEndPoint:string):iwork;

  constructor create;
end;
implementation

uses
  System.SysUtils;

{ TControllerFrmExemple }

procedure TControllerFrmExemple.ADisplay(AObject: TObject);
begin
display:=AObject;
end;

constructor TControllerFrmExemple.create;
begin
FAWork:=TWork.Create;
FDao:=TDao.create;
end;

procedure TControllerFrmExemple.Execute;
begin
 getusers('Users.json');
end;

function TControllerFrmExemple.Getusers(AEndPoint: string):iwork;
var
 user:TUser;
 All:TUsers;
begin
 Result:=self;
 try
    All:=FDao.getUsers(AEndPoint);
    (Fdisplay as Tlistview).Items.Clear;
    for user in All.users do
    begin
     if (FDisplay is TListview) then
     begin
      with (Fdisplay as Tlistview).Items.Add do
        begin
         data['Text1']:= user.name;
        end;
     end;
    end;
 finally
  All.Disposeof;
 end;
end;

procedure TControllerFrmExemple.SetAWork(const Value: IWork);
begin
  FAWork := Value;
end;

procedure TControllerFrmExemple.SetDao(const Value: IDao);
begin
  FDao := Value;
end;

procedure TControllerFrmExemple.SetDisplay(const Value: Tobject);
begin
FDisplay:=Value;
end;

end.
