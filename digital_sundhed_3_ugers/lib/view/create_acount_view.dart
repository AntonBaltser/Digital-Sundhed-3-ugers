part of '../../main.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const SizedBox.expand(),
          Positioned(
            top: 625,
            left: -100,
            right: -100,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(74, 144, 226, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(250),
                  topRight: Radius.circular(250),
                ),
              ),
            ),
          ),

          Positioned(
            top: 685,
            left: -100,
            right: -100,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(32, 117, 216, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(250),
                  topRight: Radius.circular(250),
                ),
              ),
            ),
          ),

          Positioned(
            top: 745,
            left: -100,
            right: -100,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 100, 217, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(250),
                  topRight: Radius.circular(250),
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
                  debugPrint('Knap trykket');
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
            height: 50,
            child: Image.asset('assets/images/Pointing arrow.gif'),
          ),

          Positioned(
            top: 200,
            left: 10,
            right: 10,
            height: 300,
            child: Image.asset('assets/images/logo.avif'),
          ),
        ],
      ),
    );
  }
}
