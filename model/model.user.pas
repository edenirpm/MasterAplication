unit model.user;

interface
type
Tuser = class
  private
    Fname: string;
    procedure Setname(const Value: string);
  published
property name:string read Fname write Setname;
end;

implementation

{ Tuser }

procedure Tuser.Setname(const Value: string);
begin
  Fname := Value;
end;

end.
