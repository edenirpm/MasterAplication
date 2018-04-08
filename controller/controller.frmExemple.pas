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
    Fusers:TUsers;
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
  function UpdateUsers(AEndPoint:string):boolean;
  procedure adduser(Ausername:string);
  constructor create;
  destructor destroy;override;
end;
implementation

uses
  System.SysUtils;

{ TControllerFrmExemple }

procedure TControllerFrmExemple.adduser(Ausername: string);
var
user,usr:TUser;
begin
  user:=TUSer.Create;
  user.name:=AUsername;
  Fusers.users.Add(user);
  with (display as Tlistview)do
  begin
    items.Clear;
    for user in fusers.users do
    begin
     with items.Add do
     begin
       Data['Text1']:=user.name;
     end;

    end;
  end;

end;

procedure TControllerFrmExemple.ADisplay(AObject: TObject);
begin
display:=AObject;
end;

constructor TControllerFrmExemple.create;
begin
FAWork:=TWork.Create;
FDao:=TDao.create;
FUsers:=TUSers.create;
end;

destructor TControllerFrmExemple.destroy;
begin
FUsers.Free;
  inherited;
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
     adduser(user.name);
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

function TControllerFrmExemple.UpdateUsers(AEndPoint:string): boolean;
 var
 all:TUSers;
begin
  try
   all:= FDao.putUsers(AendPoint,FUsers);
  finally
   all.DisposeOf;
  end;

end;

end.
