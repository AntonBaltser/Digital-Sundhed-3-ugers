part of '../../main.dart';

class FindDevice extends StatelessWidget {
  FindDevice({super.key});
  
  final findDeviceViewModel = FindDeviceViewModel(
    manager: MovesenseManager(address: 'ED5C59BE-624A-440F-6D57-CDFE4C0B7947')
  );

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
              bottom: -20,
              left: -5,
              right: -5,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(74, 144, 226, 1),
                  borderRadius: BorderRadius.circular(70)
                ),
              ),
            ),

            Positioned(
              bottom: -20,
              left: -5,
              right: -5,
              child: Container(
                height: 217,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(32, 117, 216, 1),
                  borderRadius: BorderRadius.circular(70)
                ),
              ),
            ),

            Positioned(
              bottom: -20,
              left: -5,
              right: -5,
              child: Container(
                height: 127,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 100, 217, 1),
                  borderRadius: BorderRadius.circular(70)
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
                    final future = findDeviceViewModel.connect();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => LoadingScreen(
                        connectFuture: future,
                      ))
                    );
                    debugPrint('Moving to LoadingScreen ...');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return MainScreen();
                    //     },
                    //   ),
                    // );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Connect',
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
              top: 80,
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
                          return CareTakerInfo();
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
                  child: Image.asset('assets/images/Back button.png'),
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
              top: 687,
              left: 300,
              right: 35,
              height: 49,
              child: Image.asset('assets/images/Pointing arrow.gif'),
            ),

            Positioned(
              top: 60,
              left: 100,
              right: 100,
              height: 75,
              child: Image.asset('assets/images/Logo.webp'),
            ),

            Positioned(
              top: 170,
              left: -150,
              right: -150,
              height: 370,
              child: Image.asset('assets/images/MoveSense.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
