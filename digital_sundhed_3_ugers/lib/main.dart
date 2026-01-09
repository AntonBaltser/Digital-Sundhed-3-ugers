import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const platform = MethodChannel('com.example/movesense');

  const MyApp({super.key});

  Future<void> connectDevice() async {
    try {
      final String result = await platform.invokeMethod('connectDevice', 'RYP2458');
      print(result); // Output: "Connected to device: 12345ABC"
    } on PlatformException catch (e) {
      print("Failed to connect: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Movesense Test")),
        body: Center(
          child: ElevatedButton(
            onPressed: connectDevice,
            child: Text("Connect Movesense"),
          ),
        ),
      ),
    );
  }
}