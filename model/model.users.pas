unit model.users;

interface
uses
model.user,system.generics.collections;
type
Tusers = class
  private
    Fusers: TObjectList<TUser>;
    procedure Setusers(const Value: TObjectList<TUser>);
  public
  constructor create;
  destructor destroy;override;
  property users :TObjectList<TUser> read Fusers write Setusers;
end;

implementation

{ Tusers }

constructor Tusers.create;
begin
 Fusers:= TObjectList<TUser>.create;
end;

destructor Tusers.destroy;
begin
 Fusers.Free;
  inherited;
end;

procedure Tusers.Setusers(const Value: TObjectList<TUser>);
begin
  Fusers := Value;
end;

end.
