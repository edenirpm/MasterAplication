unit model.EfectTextUP;

interface
uses
Fmx.Objects, FMX.Edit, FMX.Ani,UInterfaces, System.UITypes;
type
TEfectTextUP = class(TInterfacedObject,IEfect)
  procedure EfectTextEdit(AObject:TObject);
end;

implementation

{ TEfectLabelsTextUP }

procedure TEfectTextUP.EfectTextEdit(AObject: TObject);
begin
TAnimator.AnimateFloat((AObject as TText), 'Position.Y', -25,0.60);
(AObject as TText).TextSettings.Font.Size:= 11;
(AObject as TText).TextSettings.FontColor:= TAlphaColorRec.Blue;
//(AObject as TText).AnimateFloat('Position.Y',-20,0.30);IsDeprecated
((AObject as TText).Parent as TEdit).SetFocus;
end;

end.
