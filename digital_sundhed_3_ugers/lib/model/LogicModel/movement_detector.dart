part of '../../main.dart';

class MovementDetector extends ChangeNotifier {
  MovesenseManager movesense = activeMovesense;
  Individual individual = currentIndividual;

  List<Movement> _movements = [];

  StreamSubscription? accSub;

  bool _canDetectFall = true;

  void start() {
    debugPrint('STATUS: start() blev kaldt');
    accSub = movesense.device.imu.listen((imu) {
      final acc = imu.accelerometer.last;

      final didFall = fallAlgorithm(
        acc.x.toDouble(),
        acc.y.toDouble(),
        acc.z.toDouble(),
      );

      if (didFall) {
        debugPrint('STATUS: Fall detected');
        _movements.add(Fall(Location(0, 0, 0), DateTime.now(), individual));
        notifyListeners();
        _canDetectFall = false;
        Future.delayed(const Duration(seconds: 10), () {
          _canDetectFall = true;
          debugPrint('STATUS: Fall detection ready');
        });
      }
    });
  }

  bool fallAlgorithm(double x, double y, double z) {
    final magnitude = (x);
    if (!_canDetectFall) {
      return false;
    }
    return magnitude > 30;
  }

  @override
  void dispose() {
    accSub?.cancel();
    super.dispose();
  }

  /// Return af stream of movements.
  Stream<Movement> movementDetection() {
    // final accStream = movesense.acc;
    // final gyroStream = movesense.gyro;

    /// returns a random fall every 10 second
    return Stream<Movement>.periodic(
      const Duration(seconds: 10),
      (index) => Fall(Location(1, 2, 3), DateTime.now(), individual),
    );
  }
}
