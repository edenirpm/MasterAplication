unit uDao;

interface
uses
  IPPeerClient,System.Threading,System.sysUtils,System.Inifiles,System.classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,Rest.Json,
  Uinterfaces,System.generics.collections,
  model.user,model.users, REST.Types, FMX.Dialogs;
type
IDao = interface
['{6831AF8B-53F8-45CA-9789-673C12ED9D7A}']
 function getUsers(AEndPoint:string):Tusers;
 function putUsers(AEndPoint:string;AUsers:TUsers):TUsers;

end;
TDao = class(TinterfacedObject,IDao)
  private
    FRequest:TRestRequest;
    FResponse:TRestResponse;
    FRestClient:TRestClient;
    FKey:string;
 public
   constructor create;
   destructor destroy;override;
   function getUsers(AEndPoint:string):TUsers;
   function putUsers(AEndPoint:string;AUsers:TUsers):TUsers;
end;

implementation

{ TDao }

constructor TDao.create;
begin
  FRequest:=TRESTRequest.Create(nil);
  FResponse:=TRESTResponse.Create(nil);
  FRestClient:=TRESTClient.Create(nil);
  FRequest.Client:=FRestClient;
  FRequest.Response:=FResponse;
end;

destructor TDao.destroy;
begin
  FRequest.DisposeOf;
  FResponse.DisposeOf;
  FRestClient.DisposeOf;
  inherited;
end;

function TDao.getUsers(AEndPoint: string): TUsers;
var
user,user2:TUser;
users:TUsers;
savelocal:TStringStream;
begin
 FRestClient.BaseURL:='https://tuder-f5cd8.firebaseio.com/'+AendPoint;
 FRequest.Method:=TRESTRequestMethod.rmGet;
 FRequest.Execute;
 try
  {optional save a local file}
  { Savelocal:=TStringStream.Create(FResponse.JSONText);
  Savelocal.SaveToFile('teste.txt');
  Savelocal.DisposeOf;
  {end save a local file}

  Result:= TJson.JsonToObject<Tusers>(FResponse.JSONText);
 except
  Result:=nil;
 end;
end;

function TDao.putUsers(AEndPoint: string;AUsers:TUsers): TUsers;
begin
 FRestClient.BaseURL:='https://tuder-f5cd8.firebaseio.com/'+AendPoint;
 FRequest.Method:=TRESTRequestMethod.rmput;
 FRequest.AddBody(TJson.ObjectToJsonString(AUsers),ContentTypeFromString('application/json'));
 FRequest.Execute;
 try
  Result:= TJson.JsonToObject<TUsers>(FResponse.Content);
 except
  Result:=nil;
 end;
end;

end.
