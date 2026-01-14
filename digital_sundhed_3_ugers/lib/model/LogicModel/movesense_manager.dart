part of '../../main.dart';

// Under er en måskelinje som chatten har forslået:
//enum ConnectionStatus { disconnected, connecting, connected }

class MovesenseManager {
  final String address;
  MovesenseDevice? device;

  MovesenseManager({
    required this.address,
  });

  Future<void> connect() async {
  device = MovesenseDevice(address: address);
    if(!device!.isConnected){
      await device!.connect();
      debugPrint("device is connected");
      // await device?.getDeviceInfo();
    }
  }

  Future<void> disconnect() async {}
}
