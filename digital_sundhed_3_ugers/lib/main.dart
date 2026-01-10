import 'package:flutter/material.dart';
import 'package:mdsflutter/Mds.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScanMovesense(),
    );
  }
}

class ScanMovesense extends StatefulWidget {
  const ScanMovesense({super.key});

  @override
  _ScanMovesenseState createState() => _ScanMovesenseState();
}

class _ScanMovesenseState extends State<ScanMovesense> {
  final List<String> _devices = [];
  bool _scanning = true;

  @override
  void initState() {
    super.initState();

    // Start scan
    Mds.startScan((name, address) {
      if (name != null && address != null) {
        final deviceInfo = "$name ($address)";
        if (!_devices.contains(deviceInfo)) {
          setState(() {
            _devices.add(deviceInfo);
          });
          print("Found device: $deviceInfo");
        }
      }
    });

    // Stop scan automatisk efter 10 sekunder
    Future.delayed(const Duration(seconds: 10), () {
      Mds.stopScan();
      setState(() {
        _scanning = false;
      });
      print("Scan finished.");
    });
  }

  @override
  void dispose() {
    Mds.stopScan();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan Movesense Devices")),
      body: Center(
        child: _scanning
            ? const Text(
                "Scanning for Movesense devices...",
                style: TextStyle(fontSize: 18),
              )
            : _devices.isEmpty
                ? const Text(
                    "No devices found",
                    style: TextStyle(fontSize: 18),
                  )
                : ListView.builder(
                    itemCount: _devices.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_devices[index]),
                      );
                    },
                  ),
      ),
    );
  }
}
