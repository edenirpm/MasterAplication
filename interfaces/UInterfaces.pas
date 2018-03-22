unit UInterfaces;

interface
Type

IObservable = interface
 ['{E7D10654-D1DA-4E2F-8315-7BBC20D78DEA}']
 procedure Update;
end;

IObserver = interface
 ['{F18D185C-5706-4024-9B83-E88D9947DA97}']
 procedure Add(Observable:IObservable);
 procedure Remove(Observable:IObservable);
 procedure Notify;
end;

IEfect= Interface
  ['{3AFA7C88-AB7A-4551-989F-633A845DC863}']
  procedure EfectTextEdit(AObject:TObject);
End;

IWork = interface
  ['{8209DA24-F43D-4FD6-9560-1FE02CF26084}']
  procedure Execute;
end;

ILogin = interface
['{420A60B9-BCA1-4A16-BDD2-48A39973B026}']
 function isLogged:boolean;overload;
 function isLogged(auser,apasssword:string):boolean;overload;
 function Singup(Login,password:string):Ilogin;
end;

IService = interface
['{015E5919-B802-4217-A044-C1FE07135DE0}']
 function getServices(AObjectToDisplay:TObject):IService;
 function addService(AObject:IService):IService;
 function removeService(Aindex:integer):IService;
end;

IProfessional = interface
['{06F68FD2-7B07-4F4B-AA47-3CF750DBF8A5}']
 function getProfessionals(AObjectToDisplay:TObject):IProfessional;
 function addProfessional(AObject:IProfessional):IProfessional;
 function removeProfessional(Aindex:integer):IProfessional;
end;

IUser = interface
['{1EBF6D93-5442-4395-81F0-63CECA271777}']
 function getUsers(AObjectToDisplay:TObject):IUSer;
 function addUser(AObject:Iuser):IUser;
 function removeUser(Aindex:integer):IUser;
end;

IOrder = interface
['{1A751DF0-5AF6-4782-B56C-91B155679A08}']
 function getOrders(AObjectToDisplay:TObject):IOrder;
 function addOrder(AObject:IOrder):IOrder;
 function removeOrder(Aindex:integer):IOrder;
 function acceptOrder(AOrder:IOrder):IOrder;
 function declineOrder(AOrder:IOrder):IOrder;
 function finishOrder(AOrder:IOrder):IOrder;
end;






implementation

end.
