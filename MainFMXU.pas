unit MainFMXU;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  System.Bluetooth, System.Bluetooth.Components, FMX.Layouts, FMX.Memo;

type
  TForm2 = class(TForm)
    Button1: TButton;
    BluetoothLE1: TBluetoothLE;
    Memo1: TMemo;
    procedure BluetoothLE1ConnectedDevice(const Sender: TObject;
      const ADevice: TBluetoothLEDevice);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.BluetoothLE1ConnectedDevice(const Sender: TObject;
  const ADevice: TBluetoothLEDevice);
begin
  Memo1.Lines.Add('***** End Discovery Devices *****');
  Memo1.Lines.Add('***** New Device *****');
  Memo1.Lines.Add('ADDRESS');
  Memo1.Lines.Add(ADevice.Address);
  Memo1.Lines.Add('NAME');
  Memo1.Lines.Add(ADevice.DeviceName)
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  GattService: TBluetoothGattService;
begin
  for GattService in BluetoothLE1.GetGattServer.GetServices do
  begin
    Memo1.Lines.Add('***** New GATT Service *****');
    Memo1.Lines.Add(GattService.UUIDName);
  end;
end;

end.
