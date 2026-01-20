part of '../../main.dart';

class MessageManager {
  MovementDetector detector;

  MessageManager(this.detector) {
    detector.movementDetection.listen((m) {
      if (m is Fall) {
        debugPrint('STATUS: Meassage sent');
        sendMessage(m.individual.name, m.place, m.time);
      }
    });
  }

  Future<void> sendMessage(String name, Location loc, DateTime time) async {
    final phone = currentCaretaker.phoneNumber;

    String msg =
        "$name has fallen! \nLocation: \nLatitude: ${loc.latitude.toStringAsFixed(5)} \nLongitude: ${loc.longitude.toStringAsFixed(5)} \nAltitude: ${loc.altitude.toStringAsFixed(5)} \nTime: ${time.hour}:${time.minute}:${time.second}";

    final uri = Uri(scheme: 'sms', path: phone, queryParameters: {'body': msg});

    if (!await launchUrl(uri)) {
      debugPrint("Kunne ikke åbne SMS-app");
    }
  }
}
