part of '../../main.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  StreamSubscription<DeviceConnectionStatus>? _sub;

  @override
  void initState() {
    super.initState();
      _sub = activeMovesense.device.statusEvents.listen((status) {
        debugPrint('STATUS: $status');

        activeMovementDetector = MovementDetector();
        activeMovementDetector.start();

        if (status == DeviceConnectionStatus.connected && mounted) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => MainScreen()),
            );
          });
        }
      });
    
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: screenHeight,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 200,
              left: -150,
              right: -150,
              height: 350,
              child: Image.asset('assets/images/Loading.gif'),
            ),
            const Positioned(
              top: 500,
              left: 122,
              child: Text(
                'Searching',
                style: TextStyle(
                  color: Color.fromRGBO(66, 141, 227, 1),
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'geologica',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
