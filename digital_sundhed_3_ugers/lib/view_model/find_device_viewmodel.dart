part of '../../main.dart';

class FindDeviceViewModel {
  Future<void> connect() async {
    debugPrint('Calling movesense.connect()');
    await activeMovesense.connect();
  }
}
