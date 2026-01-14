part of '../../main.dart';

class MovementDetector {
  MovesenseManager movesense;
  LocationManager location;
  Individual individual;

  MovementDetector({
    required this.movesense,
    required this.location,
    required this.individual,
  });

  /// Return af stream of movements.
  Stream<Movement> movementDetection() {
    // final accStream = movesense.acc;
    // final gyroStream = movesense.gyro;

    /// returns a random fall every 10 second
    return Stream<Movement>.periodic(
      const Duration(seconds: 10),
      (index) => Fall(Location(1, 2, 3), DateTime.now(), index, individual),
    );
  }
}
