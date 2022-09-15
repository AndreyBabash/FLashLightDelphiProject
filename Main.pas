unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Media,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Platform.Android, Androidapi.JNI.Os, AndroidApi.Helpers, Androidapi.JNI.GraphicsContentViewText;

type
  TForm1 = class(TForm)
    Button1: TButton;
    CameraComponent1: TCameraComponent;
    CameraComponent2: TCameraComponent;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    flag:boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var Vibrator: JVibrator;
begin
    Vibrator := TJVibrator.Wrap(SharedActivity.getSystemService(TJContext.JavaClass.VIBRATOR_SERVICE));
  if flag then
  begin
    if Vibrator.hasVibrator() then Vibrator.vibrate(1000);
    CameraComponent1.TorchMode:=TTorchMode.ModeOn;
    Button1.Text:='FLASH ON';
    flag:=false;
  end
  else
  begin
    if Vibrator.hasVibrator() then Vibrator.vibrate(1000);
    CameraComponent1.TorchMode:=TTorchMode.ModeOff;
    Button1.Text:='FLASH OFF';
    flag:=true;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  flag:=true;
end;

end.
