part of '../../main.dart';

// Under er en måskelinje som chatten har forslået:
//enum ConnectionStatus { disconnected, connecting, connected }

class MovesenseManager {
  final String name;
  final String address;

  final List<MovesenseGyroscopeSample> gyroscope;
  Stream<int>? acc;

  

  MovesenseManager({
    required this.name,
    required this.address,
    required this.gyroscope,
    this.acc,
  });

  final MovesenseDevice device = MovesenseDevice(address: '0C:8C:DC:1B:23:BF');



  Future<void> connect() async {
    if(!device.isConnected){
      await device.connect();
      debugPrint("device is connected");
    }else{
    }
  }

  Future<void> disconnect() async {}
}
