import 'package:flutter/material.dart';
import 'package:movesense_plus/movesense_plus.dart';
import 'package:flutter/services.dart';


import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:sembast/utils/sembast_import_export.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
// import 'package:sembast/sembast.dart';
// import 'package:path/path.dart';

// import 'dart:convert';
import 'dart:async';
import 'dart:math';
import 'dart:io';

part 'model/DataModel/Location.dart';
part 'model/DataModel/movement.dart';
part 'model/LogicModel/location_manager.dart';
part 'model/LogicModel/movement_detector.dart';
part 'model/LogicModel/movesense_manager.dart';
part 'model/DataModel/person.dart';
part 'model/LogicModel/data_manager.dart';
part 'model/LogicModel/message_manager.dart';

part 'view_model/create_acount_viewmodel.dart';
part 'view_model/individual_info_viewmodel.dart';
part 'view_model/caretaker_info_viewmodel.dart';
part 'view_model/main_screen_viewmodel.dart';
part 'view_model/find_device_viewmodel.dart';
part 'view_model/loading_screen_viewmodel.dart';

part 'view/create_acount_view.dart';
part 'view/individual_info_view.dart';
part 'view/caretaker_info_view.dart';
part 'view/find_device_view.dart';
part 'view/loading_screen_view.dart';
part 'view/main_screen_view.dart';

late final MovesenseManager activeMovesense;
late final MovementDetector activeMovementDetector;
late final Individual currentIndividual;
late final Caretaker currentCaretaker;
// late final MessageManager meassageManager;
final DataManager dataManager = DataManager(activeMovementDetector);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  activeMovesense = MovesenseManager(
    address: '2E37B870-A014-74F7-89DE-5060CF703A2F',
  );

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateAccount(),
      );
  }
}
