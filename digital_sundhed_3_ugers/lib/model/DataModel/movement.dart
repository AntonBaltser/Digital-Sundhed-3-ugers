part of '../../main.dart';

abstract class Movement {
  Location place;
  DateTime time;
  Individual individual;

  Movement(this.place, this.time, this.individual);

  Map<String, dynamic> toJson();
}

class Fall extends Movement {
  Fall(super.place, super.time, super.individual);

  Map<String, dynamic> toJson() {
    return {
      'Individual info': {
        'name': individual.name,
        'CPR': individual.id,
        'Phone': individual.phoneNumber,
        'Diagnose': individual.diagnose,
      },
      'Fall info': {
        'Location': {
          'Latitude': place.latitude,
          'Longitude': place.longitude,
          'Altitude': place.altitude,
        },
        'Time': '${time.hour}:${time.minute}:${time.second}',
      },
    };
  }
}

class Walk extends Movement {
  int minuttes;

  Walk(super.place, super.time, this.minuttes, super.individual);

  Map<String, dynamic> toJson() {
    return {
      'Individual info': {
        'name': individual.name,
        'CPR': individual.id,
        'Phone': individual.phoneNumber,
        'Diagnose': individual.diagnose,
      },
      'Walk info': {
        'Start location': {
          'Latitude': place.latitude,
          'Longitude': place.longitude,
          'Altitude': place.altitude,
        },
        'End location': {
          'Latitude': place.latitude,
          'Longitude': place.longitude,
          'Altitude': place.altitude,
        },
        'Walk time': minuttes,
      },
    };
  }
}
