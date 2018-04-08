unit UfrmExemple;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UfrmBase, FMX.Ani, FMX.Objects, FMX.MultiView, FMX.Effects,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Edit,Controller.frmExemple,model.user,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;//Uses no controller

type
  TFrmExemple = class(TFrmBase)
    RoundRect1: TRoundRect;
    Text4: TText;
    RoundRect2: TRoundRect;
    Edit1: TEdit;
    Text5: TText;
    RoundRect3: TRoundRect;
    Text6: TText;
    ListView1: TListView;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Text7: TText;
    procedure Text4Click(Sender: TObject);
    procedure Efect(Sender:TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Text7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Text6Click(Sender: TObject);
  private
   Ctrl:TControllerFrmExemple;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExemple: TFrmExemple;

implementation

{$R *.fmx}

procedure TFrmExemple.Efect(Sender: TObject);
begin
EfectLabelUP(Sender);
end;

procedure TFrmExemple.FormCreate(Sender: TObject);
begin
  inherited;
Ctrl:=TControllerFrmExemple.create;
end;

procedure TFrmExemple.FormDestroy(Sender: TObject);
begin
  inherited;
Ctrl.Free;
end;

procedure TFrmExemple.SpeedButton1Click(Sender: TObject);
var
 Ctrl:TControllerFrmExemple;
begin
  inherited;
  try
   Ctrl:=TControllerFrmExemple.create;
   ctrl.ADisplay(Listview1);
   ExecuteWork(Ctrl);
  finally

  end;


end;

procedure TFrmExemple.SpeedButton2Click(Sender: TObject);
begin
  inherited;
 Ctrl.UpdateUsers('Users.json');
end;

procedure TFrmExemple.Text4Click(Sender: TObject);
begin
  inherited;
 LongToast('Um teste de toast');
end;



procedure TFrmExemple.Text6Click(Sender: TObject);
begin
  inherited;
Executework(Ctrl.AWork);
end;

procedure TFrmExemple.Text7Click(Sender: TObject);
begin
  inherited;
 Ctrl.ADisplay(Listview1);
 Ctrl.adduser(edit1.Text);
end;

end.
