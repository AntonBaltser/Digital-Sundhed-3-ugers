part of '../../main.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final viewModel = MainScreenViewModel();

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
                  color: const Color.fromRGBO(74, 144, 226, 1),
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
                  color: const Color.fromRGBO(32, 117, 216, 1),
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
                  color: const Color.fromRGBO(0, 100, 217, 1),
                  borderRadius: isExpanded
                      ? BorderRadius.circular(90)
                      : BorderRadius.circular(70),
                ),
              ),
            ),

            Positioned(
              bottom: -30,
              left: 40,
              right: 40,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                height: isExpanded ? 700 : 300,

                // LIDT MERE BUND-PADDING så der er plads til knappen
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 160),

                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: isExpanded
                      ? BorderRadius.circular(90)
                      : BorderRadius.circular(70),
                ),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: isExpanded ? 1.0 : 0.0,
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Accelerometer',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'geologica',
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '${viewModel.fallCount()}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                            height: 1.4,
                          ),
                        ),

                        const SizedBox(height: 70),

                        Text(
                          'User information',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'geologica',
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Name: ${currentIndividual.name} \n'
                          'Number: ${currentIndividual.phoneNumber} \n'
                          'CPR: ${currentIndividual.id} \n'
                          'Diagnose: ${currentIndividual.diagnose}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                            height: 1.4,
                          ),
                        ),

                        const SizedBox(height: 70),

                        // NY BOKS: Caretaker information
                        const Text(
                          'Caretaker information',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'geologica',
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Name: ${currentCaretaker.name} \n'
                          'Number: ${currentCaretaker.phoneNumber}',
                          style: const TextStyle(
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
            ),

            // Flyttet knap ned: top -> bottom
            Positioned(
              bottom: 35,
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

            // Flyttet den lille hvide knap ned
            Positioned(
              bottom: 35,
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

            // Flyttet pil ned så den følger knapperne
            Positioned(
              bottom: 43,
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
