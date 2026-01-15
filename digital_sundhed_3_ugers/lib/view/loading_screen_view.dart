part of '../../main.dart';

class LoadingScreen extends StatelessWidget {

  final MovesenseManager? manager;
  LoadingScreen({super.key, required this.connectFuture, this.manager});

  final Future<void> connectFuture;


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
        return FutureBuilder<void>(
      future: connectFuture,
      builder: (context, snapshot) {
        // Hvis der kom en fejl under connect
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Kunne ikke forbinde",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      snapshot.error.toString(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // tilbage til FindDevice
                      },
                      child: const Text("Tilbage"),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        // Når forbindelsen er færdig: navigér videre
        if (snapshot.connectionState == ConnectionState.done) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await Future.delayed(const Duration(seconds: 5));
            
            if (!context.mounted) return;

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => MainScreen()),
            );
          });
        }

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

            Positioned(
              top: 500,
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
        );
  }
  }
