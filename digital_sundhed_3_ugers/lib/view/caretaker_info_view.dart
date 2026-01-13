part of '../../main.dart';

class CareTakerInfo extends StatelessWidget {
  CareTakerInfo({super.key});

  final viewModel = CareTakerInfoViewModel();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 900,
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
                          borderSide: const BorderSide(color: Color.fromRGBO(74, 144, 226, 1)),
                          ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color.fromRGBO(74, 144, 226, 1), width: 2), 
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color.fromRGBO(74, 144, 226, 1), width: 3)
                        )
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
                          borderSide: const BorderSide(color: Color.fromRGBO(74, 144, 226, 1)),
                          ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color.fromRGBO(74, 144, 226, 1), width: 2), 
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color.fromRGBO(74, 144, 226, 1), width: 3)
                        )
                      ),
                    ),
                  ],
                )
              ),

              
              Positioned(
                top: 625,
                left: -100,
                right: -100,
                height: 300,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(74, 144, 226, 1),
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
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(32, 117, 216, 1),
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
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 100, 217, 1),
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
                      debugPrint('Name: ${viewModel.name} \n Phone: ${viewModel.phone}');
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
                top: 687,
                left: 300,
                right: 35,
                height: 50,
                child: Image.asset('assets/images/Pointing arrow.gif'),
              ),

              Positioned(
                top: 25,
                left: 120,
                right: 120,
                height: 200,
                child: Image.asset('assets/images/logo.avif'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
