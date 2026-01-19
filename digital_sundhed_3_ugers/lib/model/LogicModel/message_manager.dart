part of '../../main.dart';

class MessageManager {
  Caretaker caretaker;
  Individual individual;
  MovementDetector detector;

  MessageManager(this.caretaker, this.individual, this.detector);

  // void sendMessage() {
  //   detector.movementDetection().listen((m) {
  //     if (m is Fall) {
  //       if (m.individual.id == individual.id) {
  //         print("${m.individual.name} has fallen at the location ${m.place}");
  //       }
  //     }
  //   });
  // }
}
