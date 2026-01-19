part of '../../main.dart';


class MessageManager  {
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
    final phone = currentCaretaker.phoneNumber; // fx "+4512345678"

    String msg = "$name has fallen at the location at altitude: ${loc.altitude}, longitude: ${loc.longitude} and altitude: ${loc.altitude} and the time $time";

    final uri = Uri(
      scheme: 'sms',
      path: phone,
      queryParameters: {'body': msg},
    );

    if (!await launchUrl(uri)) {
      debugPrint("Kunne ikke åbne SMS-app");
    }
  }
}