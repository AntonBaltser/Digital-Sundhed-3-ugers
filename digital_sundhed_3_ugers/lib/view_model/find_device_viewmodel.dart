part of '../../main.dart';

enum ConnectionStatus { idle, connecting, connected, error }

class FindDeviceViewModel extends ChangeNotifier {
  final MovesenseManager manager;

  ConnectionStatus status = ConnectionStatus.idle;
  String? errorMeassage;

  FindDeviceViewModel({required this.manager});

  bool get isConnecting => status == ConnectionStatus.connecting;
  bool get isConnected => status == ConnectionStatus.connected;

  Future<void> connect() async {
    if (isConnecting || isConnected) return;

    status = ConnectionStatus.connecting;
    errorMeassage = null;
    notifyListeners();

    try {
      await manager.connect();
    } catch (e) {
      status = ConnectionStatus.error;
      errorMeassage = e.toString();
    }
    notifyListeners();
  }
}
