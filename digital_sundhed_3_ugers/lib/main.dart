import 'package:flutter/material.dart';
import 'package:movesense_plus/movesense_plus.dart';
import 'package:flutter/services.dart';

// import 'dart:async';

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

part 'view/create_acount_view.dart';
part 'view/individual_info_view.dart';
part 'view/caretaker_info_view.dart';
part 'view/find_device_view.dart';
part 'view/loading_screen_view.dart';
part 'view/main_screen_view.dart';

final MovesenseManager movesense = MovesenseManager(address: 'ED5C59BE-624A-440F-6D57-CDFE4C0B7947');

void main() async {
  // Lock screen rotation
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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

// class MyApp extends StatelessWidget {

//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MovesenseScanDebugScreen(),
//     );
//   }
// }


// class MovesenseScanDebugScreen extends StatefulWidget {
//   const MovesenseScanDebugScreen({super.key});

//   @override
//   State<MovesenseScanDebugScreen> createState() => _MovesenseScanDebugScreenState();
// }

// class _MovesenseScanDebugScreenState extends State<MovesenseScanDebugScreen> {
//   StreamSubscription<MovesenseDevice>? _sub;
//   final Set<String> _seenAddresses = {}; // undgå spam i terminalen
//   Timer? _stopTimer;

//   @override
//   void initState() {
//     super.initState();
//     _startScan();
//   }

//   void _startScan() {
//     debugPrint("=== STARTING MOVESE NSE SCAN ===");

//     // Lyt på fundne devices
//     _sub = Movesense().devices.listen((device) {
//       final addr = device.address;
//       if (addr != null && _seenAddresses.add(addr)) {
//         debugPrint("FOUND: name='${device.name}'  address='$addr'");
//       }
//     }, onError: (e) {
//       debugPrint("Scan stream error: $e");
//     });

//     // Start scan
//     Movesense().scan();

//     // Stop efter 10 sek
//     _stopTimer?.cancel();
//     _stopTimer = Timer(const Duration(seconds: 10), () {
//       debugPrint("=== STOPPING SCAN (timeout) ===");
//       Movesense().stopScan();
//       _sub?.cancel();
//     });
//   }

//   @override
//   void dispose() {
//     _stopTimer?.cancel();
//     Movesense().stopScan();
//     _sub?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Movesense scan (debug)")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Tryk for at scanne igen
//             _seenAddresses.clear();
//             _sub?.cancel();
//             Movesense().stopScan();
//             _startScan();
//           },
//           child: const Text("Scan igen (print i terminal)"),
//         ),
//       ),
//     );
//   }
// }

