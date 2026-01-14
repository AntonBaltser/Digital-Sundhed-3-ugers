part of '../../main.dart';

class LoadingScreen extends StatelessWidget {
  LoadingScreen({super.key});

  final viewModel = IndinvidualInfoViewModel();

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
              top: 200,
              left: -150,
              right: -150,
              height: 400,
              child: Image.asset('assets/images/Loading.gif'),
            ),

            Positioned(
              top: 530,
              left: 122,
              right: 0,
              child: const Text(
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
