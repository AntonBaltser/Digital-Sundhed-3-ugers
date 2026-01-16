part of '../../main.dart';

class IndividualInfo extends StatelessWidget {
  IndividualInfo({super.key});

  final viewModel = IndinvidualInfoViewModel();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SizedBox(
        height: screenHeight,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 220,
              left: 35,
              right: 35,
              child: Column(
                children: [
                  TextField(
                    controller: viewModel.nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter Name',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(74, 144, 226, 1),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(74, 144, 226, 1),
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(74, 144, 226, 1),
                          width: 3,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  TextField(
                    controller: viewModel.phoneController,
                    decoration: InputDecoration(
                      hintText: 'Enter Phone number',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(74, 144, 226, 1),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(74, 144, 226, 1),
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(74, 144, 226, 1),
                          width: 3,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  TextField(
                    controller: viewModel.cprController,
                    decoration: InputDecoration(
                      hintText: 'Enter Cpr-number',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(74, 144, 226, 1),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(74, 144, 226, 1),
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(74, 144, 226, 1),
                          width: 3,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  TextField(
                    controller: viewModel.diagnoseController,
                    decoration: InputDecoration(
                      hintText: 'Enter Diagnose',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(74, 144, 226, 1),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(74, 144, 226, 1),
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(74, 144, 226, 1),
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: -20,
              left: -5,
              right: -5,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(74, 144, 226, 1),
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
                  color: Color.fromRGBO(32, 117, 216, 1),
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
                  color: Color.fromRGBO(0, 100, 217, 1),
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
                    currentIndividual = viewModel.buildIndividual();

                     debugPrint(
                        'Name: ${currentIndividual.name}\n'
                        'Phone: ${currentIndividual.phoneNumber}\n'
                        'Cpr-nr: ${currentIndividual.id}\n'
                        'Diagnose: ${currentIndividual.diagnose}',
  );
                    debugPrint('Moving to CareTakerInfo ...');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CareTakerInfo();
                        },
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Next',
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
                  child: Image.asset('assets/images/Back button.png'),
                ),
              ),
            ),

            Positioned(
              top: 165,
              left: 70,
              right: 0,
              child: const Text(
                'User information',
                style: TextStyle(
                  color: Color.fromRGBO(76, 138, 208, 1),
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'geologica',
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
          ],
        ),
      ),
    );
  }
}
