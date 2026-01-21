part of '../../main.dart';

class MovementDetector extends ChangeNotifier {
  MovesenseManager movesense = activeMovesense;
  Individual individual = currentIndividual;

  LocationManager location = LocationManager(Stream.empty());

  DateTime? _lowStart;
  bool _sawLow = false;

  final List<Movement> _movements = [];

  StreamSubscription? accSub;

  bool _canDetectFall = true;

  final StreamController<Movement> _movementEventController = StreamController.broadcast();
   
  Stream<Movement> get movementDetection => _movementEventController.stream;

  void addMovement(Movement movement) {
     _movements.add(movement);
     _movementEventController.add(movement);
      notifyListeners();
  }

  void start() async {
    dataManager.init();

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      debugPrint('Location services are disabled.');
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    notifyListeners();

    // ignore: unused_local_variable
    final MessageManager meassageManager = MessageManager(activeMovementDetector);
    debugPrint('STATUS: Meassage Manager instance called');

    debugPrint('STATUS: start() blev kaldt');

    accSub = movesense.device.imu.listen((imu) async {
      final acc = imu.accelerometer.last;

      final didFall = fallAlgorithm(
        acc.x.toDouble(),
        acc.y.toDouble(),
        acc.z.toDouble(),
      );

      if (didFall) {
        debugPrint('STATUS: Fall detected');

        try {
          Position position = await location.positionStream.first;

          addMovement(
            Fall(
              Location(
                position.latitude,
                position.longitude,
                position.altitude,
              ),
              DateTime.now(),
              individual,
            ),
          );
        } catch (e) {
          debugPrint('Could not get location: $e');
          addMovement(Fall(Location(0, 0, 0), DateTime.now(), individual));
        }

        _canDetectFall = false;
        Future.delayed(const Duration(seconds: 5), () {
          _canDetectFall = true;
          debugPrint('STATUS: Fall detection ready');
        });
      }
    });
  }

  bool fallAlgorithm(double x, double y, double z) {
    if (!_canDetectFall) {
      return false;
    }

    final now = DateTime.now();

    double svm = sqrt(x * x + y * y + z * z);

    const low = 6.0;
    const high = 25.0;

    if (svm < low) {
      _sawLow = true;
      _lowStart = now;
      debugPrint('STATUS Dip detected');
      return false;
    }

    if (_sawLow && _lowStart != null) {
      final dtMS = now.difference(_lowStart!).inMilliseconds;

      if (dtMS > 800) {
        _sawLow = false;
        _lowStart = null;
        return false;
      }

      if (svm > high) {
        _sawLow = false;
        _lowStart = null;
        return true;
      }
    }
    return false;
  }

  @override
  void dispose() {
    accSub?.cancel();
    super.dispose();
  }
}
