part of '../../main.dart';

class LocationManager extends ChangeNotifier {
  StreamSubscription<String>? _gpsSub;
  Stream<int> location;
  bool running = false;

  LocationManager(this.location);

  Stream<String> get readings {
    return Geolocator.getPositionStream().map((event) {
      return 'latitude:    ${event.latitude.toStringAsFixed(2)}\nlongitude: ${event.longitude.toStringAsFixed(2)}\naltitude:    ${event.altitude.toStringAsFixed(2)}';
    });
  }

  void start() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
  }
  if (permission == LocationPermission.deniedForever) {
    running = false;
    return;
  }
  running = true;
  }

  Stream<Position> get positionStream => Geolocator.getPositionStream();

  void stop() {
    _gpsSub?.cancel();
    running = false;
  }
}
