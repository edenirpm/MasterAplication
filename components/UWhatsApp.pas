unit UWhatsApp;

interface
uses
  {$ifdef Android}
    FMX.Helpers.Android, Androidapi.Jni.GraphicsContentViewText,
    Androidapi.Jni.Net, Androidapi.Jni.JavaTypes, idUri, Androidapi.Jni,
    Androidapi.JNIBridge, Androidapi.Helpers,
  {$endif}
    System.classes;
Type
TWhatsApp = class
     {$ifdef Android}
    class procedure SendWhatsapp(AContactNumer,AMessage:string);
    class procedure SendItentWhatsapp(AContactNumber,Amessage:String);
     {$endif}
end;

implementation

{ TAndroid }

{$ifdef Android}
class procedure TWhatsApp.SendWhatsapp(AContactNumer,AMessage:string);
var
  IntentWhats : JIntent;
  mensagem,link,msg : string;
begin
 // link:='http://www.globo.com';
   msg:='whatsapp://send?text='+Amessage+'&phone='+AContactNumer;
  IntentWhats:= TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW,TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(msg))));
  SharedActivity.startActivity(IntentWhats);
end;
class procedure TWhatsApp.SendItentWhatsapp(AContactNumber,AMessage:string);
var
  IntentWhats : JIntent;
  mensagem,link,msg : string;
begin
  IntentWhats:=TJIntent.Create;
  IntentWhats:=TJIntent.JavaClass.init(Tjintent.JavaClass.ACTION_MAIN);
  IntentWhats.setAction(Tjintent.JavaClass.ACTION_SEND);
  IntentWhats.setType(StringToJString('text/plain'));
  IntentWhats.putExtra(TJIntent.JavaClass.EXTRA_TEXT,StringToJString(AMessage));
  IntentWhats.putExtra(Tjintent.JavaClass.EXTRA_PHONE_NUMBER,StringToJString(AContactNumber));
  //IntentWhats.putExtra(StringToJString('phone'),StringToJString(AContactNumber+'@s.whatsapp.net'));
  IntentWhats.setPackage(StringToJString('com.whatsapp'));
  SharedActivity.startActivity(IntentWhats);
end;

{$endif Android}

end.
