import 'package:flutter/material.dart';

part 'view_model/individual_info_viewmodel.dart';
part 'view_model/caretaker_info_viewmodel.dart';

part 'view/create_acount_view.dart';
part 'view/individual_info_view.dart';
part 'view/caretaker_info_view.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: CreateAccount(),
      home: IndividualInfo(),
      // home: CareTakerInfo(),
    );
  }
}

//---------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:mdsflutter/Mds.dart';

// void main() {
//   runApp(const MyApp());
// }


// class MyApp extends StatelessWidget {

//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: ScanMovesense(),
//     );
//   }
// }


// class MovesenseDevice {
//   final String name;
//   final String address;

//   MovesenseDevice(this.name, this.address);
// }

// class ScanMovesense extends StatefulWidget {
//   const ScanMovesense({super.key});

//   @override
//   State<ScanMovesense> createState() => _ScanMovesenseState();
// }


// class _ScanMovesenseState extends State<ScanMovesense> {

//   Stream<dynamic>? _accStream;
//   double? _ax;
//   double? _ay;
//   double? _az;

//   String? _deviceSerial;

//   final List<MovesenseDevice> _devices = [];
//   bool _scanning = true;
//   String? _connectedAddress;
//   bool _connecting = false;

//   @override
//   void initState() {
//     super.initState();
//     _startScan();
//   }

//   void _subscribeToAcc() {
//   if (_deviceSerial == null) return;

//   final uri = Mds.createSubscriptionUri(
//     _deviceSerial!,
//     "/Meas/Acc/13",
//   );

//   _accStream = MdsAsync.subscribe(uri, "{}");

//   _accStream!.listen((data) {
//     final acc = data["Body"]["ArrayAcc"][0];

//     setState(() {
//       _ax = acc["x"];
//       _ay = acc["y"];
//       _az = acc["z"];
//     });
//   }, onError: (err) {
//     debugPrint("ACC error: $err");
//   });
// }


//   void _startScan() {
//     Mds.startScan((name, address) {
//       if (name == null || address == null) return;

//       if (_devices.any((d) => d.address == address)) return;

//       setState(() {
//         _devices.add(MovesenseDevice(name, address));
//       });

//       debugPrint("Found device: $name ($address)");
//     });


//     Future.delayed(const Duration(seconds: 10), () {
//       Mds.stopScan();
//       if (mounted) {
//         setState(() {
//           _scanning = false;
//         });
//       }
//       debugPrint("Scan finished");
//     });
//   }

//   void _connect(String address) {
//   if (_connecting) return;

//   setState(() {
//     _connecting = true;
//   });

//   Mds.stopScan();

//   Mds.connect(
//     address,

//     (serial) {
//       debugPrint("Connected: $serial");
//       setState(() {
//         _deviceSerial = serial;
//         _connectedAddress = address;
//         _connecting = false;
//       });

//       _subscribeToAcc();
//     },

//     () {
//       debugPrint("Disconnected");
//       setState(() {
//         _connectedAddress = null;
//         _connecting = false;
//       });
//     },

//     (error) {
//       debugPrint("Connection error: $error");
//       setState(() {
//         _connecting = false;
//       });
//     },

//     (bleAddress) {
//       debugPrint("BLE connected: $bleAddress");
//     },
//   );
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Scan Movesense Devices"),
//       ),
//       body: Center(
//         child: _connectedAddress == null ? _buildScanList()
//       : Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "Accelerometer (13 Hz)",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             Text("X: ${_ax?.toStringAsFixed(2) ?? "-"}"),
//             Text("Y: ${_ay?.toStringAsFixed(2) ?? "-"}"),
//             Text("Z: ${_az?.toStringAsFixed(2) ?? "-"}"),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget _buildScanList() {
//   if (_scanning) {
//     return const Text("Scanning for Movesense devices...");
//   }

//   if (_devices.isEmpty) {
//     return const Text("No devices found");
//   }

//   return ListView.builder(
//     itemCount: _devices.length,
//     itemBuilder: (context, index) {
//       final device = _devices[index];

//       return ListTile(
//         title: Text(device.name),
//         subtitle: Text(device.address),
//         onTap: () => _connect(device.address),
//       );
//     },
//   );
// }

// }
