part of '../../main.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    // Find telefonens højde
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
                  borderRadius: BorderRadius.circular(70),
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
                  borderRadius: BorderRadius.circular(70),
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
                  borderRadius: BorderRadius.circular(70),
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
                    debugPrint('Moving to IndividualInfo ...');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return IndividualInfo();
                        },
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Setup Account',
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
              top: 165,
              left: 60,
              right: 0,
              child: const Text(
                'Fall Detection App',
                style: TextStyle(
                  color: Color.fromRGBO(76, 138, 208, 1),
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'geologica',
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
              top: 275,
              left: 10,
              right: 10,
              height: 200,
              child: Image.asset('assets/images/Logo.webp'),
            ),
          ],
        ),
      ),
    );
  }
}
