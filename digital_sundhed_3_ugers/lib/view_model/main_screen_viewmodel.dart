part of '../../main.dart';

class MainScreenViewModel extends ChangeNotifier {
  MovementDetector movementDetector = activeMovementDetector;
  MovesenseManager movesense = activeMovesense;
  Individual individual = currentIndividual;


  MainScreenViewModel() {
    movementDetector.addListener(notifyListeners);
  }

  int get fallCount {
    return movementDetector._movements.length;
  }

  @override
  void dispose() {
    movementDetector.removeListener(notifyListeners);
    super.dispose();
  }
}
