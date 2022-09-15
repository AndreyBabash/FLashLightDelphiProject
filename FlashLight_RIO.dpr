program FlashLight_RIO;

uses
  System.StartUpCopy,
  FMX.Forms,
  AndroidApi.Helpers,
  FMX.Platform.Android,
  Androidapi.JNI.Embarcadero,
  AndroidApi.JNI.GraphicsContentViewText,
  Androidapi.JNI,
  Main in 'Main.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  SharedActivity.getWindow.addFlags(TJWindowManager_LayoutParams.JavaClass.FLAG_KEEP_SCREEN_ON);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
