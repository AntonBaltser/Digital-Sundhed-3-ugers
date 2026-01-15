part of '../../main.dart';

class MainScreenViewModel extends ChangeNotifier {
  final MovesenseManager movesense;

  MainScreenViewModel(this.movesense);

  int? heartRate;

  double? accX, accY, accZ;
  double? gyroX, gyroY, gyroZ;

  StreamSubscription? _hrSub;
  StreamSubscription? _imuSub;

  void start() {
    _hrSub = movesense.device.hr.listen((hr) {
      heartRate = hr;
      notifyListeners();
    });

    _imuSub = movesense.device.imu.listen((imu) {
      final acc = imu.accelerometer.last;
      final gyro = imu.gyroscope.last;

      accX = acc.x.toDouble();
      accY = acc.y.toDouble();
      accZ = acc.z.toDouble();

      gyroX = gyro.x.toDouble();
      gyroY = gyro.y.toDouble();
      gyroZ = gyro.z.toDouble();

      notifyListeners();
    });
  }

  @override
  void dispose() {
    _hrSub?.cancel();
    _imuSub?.cancel();
    super.dispose();
  }
}

