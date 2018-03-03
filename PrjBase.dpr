program PrjBase;

uses
  System.StartUpCopy,
  FMX.Forms,
  UfrmBase in 'view\UfrmBase.pas' {FrmBase},
  UInterfaces in 'interfaces\UInterfaces.pas',
  model.work in 'model\model.work.pas',
  model.observer in 'model\model.observer.pas',
  controller.frmBase in 'controller\controller.frmBase.pas',
  Androidapi.JNI.Toast in 'components\Androidapi.JNI.Toast.pas',
  UWhatsApp in 'components\UWhatsApp.pas',
  model.EfectTextUP in 'model\model.EfectTextUP.pas',
  UfrmExemple in 'view\UfrmExemple.pas' {FrmExemple},
  controller.frmExemple in 'controller\controller.frmExemple.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmExemple, FrmExemple);
  Application.CreateForm(TFrmBase, FrmBase);
  Application.Run;
end.
