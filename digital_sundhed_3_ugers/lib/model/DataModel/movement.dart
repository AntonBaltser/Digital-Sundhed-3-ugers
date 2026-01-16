part of '../../main.dart';

class Movement {
  Location place;
  DateTime time;
  Individual individual;

  Movement(this.place, this.time, this.individual);
}

class Fall extends Movement {
  // How severe is the fall on a scale from 0 to 10.
  Fall(super.place, super.time, super.individual);
}

class Walk extends Movement {
  // The number of minutes walked during this walk session.
  int minuttes;

  Walk(super.place, super.time, this.minuttes, super.individual);
}

class MovementHistory {
  List<Movement> history = [];
  DataManager database;
  MovementDetector detector;

  // This construtor also listens to the stream.
  MovementHistory(this.database, this.detector) {
    detector.movementDetection().listen((movement) {
      addMovement(movement);
    });
  }

  void addMovement(Movement movement) {
    history.add(movement);
    database.saveMovement(movement);
  }

  int get numberOfFalls => history.whereType<Fall>().length;
  int get numberOfWalk => history.whereType<Walk>().length;

  int get minutesWalked {
    var sum = 0;
    for (var movement in history) {
      if (movement is Walk) {
        sum += movement.minuttes;
      }
    }
    return sum;
  }
}
