part of '../../main.dart';

class MovesenseManager {
  final String address;
  late final MovesenseDevice device;

  MovesenseManager({required this.address}) {
    device = MovesenseDevice(address: address);
  }

  Future<void> connect() async {
    debugPrint('MovesenseManager.connect() called');

    if (device.isConnected) {
      debugPrint('Already connected');
      return;
    }

    debugPrint('Trying to connect to $address');
    await device.connect();
  }
}
