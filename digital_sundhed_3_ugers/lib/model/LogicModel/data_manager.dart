part of '../../main.dart';

class DataManager {
  static const String DB_NAME = 'Individual history';
  MovementDetector detector;
  DataManager(this.detector); 
  Directory? dir;
  StoreRef? _store;
  var _database;

  Future<void> init() async {
    debugPrint('STATUS: Initializing storage, id: ${detector.individual.name}');

    dir = await getApplicationDocumentsDirectory();
    if (dir == null) {
      debugPrint('WARNING - could not create database. Data is not saved....');
    } else {
      debugPrint('STATUS: Inde i else');
      await dir?.create(recursive: true);
      String path = '${dir!.path}/${DB_NAME}.db';
      _database = await databaseFactoryIo.openDatabase(path);
      _store = intMapStoreFactory.store(detector.individual.name);

      detector.movementDetection.listen((m) {
      debugPrint('STATUS: Stream hørt');
      if (m is Fall || m is Walk) {
        _store?.add(_database, m.toJson());
        debugPrint('STATUS: DataPoint saved');
        debugPrint(path);
      }
    });
    }
  }
}
