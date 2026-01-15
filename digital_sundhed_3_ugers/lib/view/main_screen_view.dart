part of '../../main.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isExpanded = false;

  int? heartRate;
  StreamSubscription? _hrSub;

  @override
  void initState() {
    super.initState();

    // START HR SUBSCRIBE
    _hrSub = movesense.device.hr.listen((hr) {
      debugPrint('HR: $hr');
      setState(() {
        heartRate = hr;
      });
    });
  }

  @override
  void dispose() {
    _hrSub?.cancel();
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
              bottom: 400,
              left: 20,
              right: 130,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 73, 159, 49),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'Fall Detection \n Active',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'geologica',
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 400,
              left: 270,
              right: 20,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 73, 159, 49),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Image.asset('assets/images/Check.png')),
              ),
            ),

            Positioned(
              bottom: -20,
              left: -5,
              right: -5,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                height: isExpanded ? 700 : 300,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(74, 144, 226, 1),
                  borderRadius: isExpanded
                      ? BorderRadius.circular(90)
                      : BorderRadius.circular(70),
                ),
              ),
            ),

            Positioned(
              bottom: -20,
              left: -5,
              right: -5,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                height: isExpanded ? 500 : 217,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(32, 117, 216, 1),
                  borderRadius: isExpanded
                      ? BorderRadius.circular(90)
                      : BorderRadius.circular(70),
                ),
              ),
            ),

            Positioned(
              bottom: -20,
              left: -5,
              right: -5,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                height: isExpanded ? 300 : 127,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 100, 217, 1),
                  borderRadius: isExpanded
                      ? BorderRadius.circular(90)
                      : BorderRadius.circular(70),
                ),
              ),
            ),

            Positioned(
              bottom: -20,
              left: 40,
              right: 40,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                height: isExpanded ? 700 : 300,
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 120),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: isExpanded
                      ? BorderRadius.circular(90)
                      : BorderRadius.circular(70),
                ),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: isExpanded ? 1.0 : 0.0,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HeartRate',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: 'geologica',
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        heartRate != null
                            ? 'Puls: $heartRate bpm'
                            : 'Måler puls...',
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(height: 110),

                      Text(
                        'Data',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: 'geologica',
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Her kommer data fra ViewModel senere',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              top: 680,
              left: 30,
              right: 100,
              height: 65,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Show Data',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 100, 217, 1),
                        fontSize: 33,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'geologica',
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 680,
              left: 300,
              right: 30,
              height: 65,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            Positioned(
              top: 83,
              left: 30,
              right: 330,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return CreateAccount();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                              const begin = Offset(-1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeOut;

                              final tween = Tween(
                                begin: begin,
                                end: end,
                              ).chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                      ),
                    );
                  },
                  child: Image.asset('assets/images/restart.png'),
                ),
              ),
            ),

            Positioned(
              top: isExpanded ? 685 : 690,
              left: 300,
              right: isExpanded ? 28 : 32.5,
              height: 49,
              child: Transform.rotate(
                angle: isExpanded ? (3.14 / 2) : (-3.14 / 2),
                child: Image.asset('assets/images/Pointing arrow.gif'),
              ),
            ),

            Positioned(
              top: 60,
              left: 100,
              right: 100,
              height: 75,
              child: Image.asset('assets/images/Logo.webp'),
            ),
            Positioned(
              top: 62,
              left: 287,
              right: -7,
              child: Image.asset('assets/images/MoveSense.jpg'),
            ),
            Positioned(
              top: 105,
              left: 345,
              right: 5,
              height: 20,
              child: Image.asset('assets/images/Check.png'),
            ),
          ],
        ),
      ),
    );
  }
}
