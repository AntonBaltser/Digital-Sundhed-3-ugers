part of '../../main.dart';


  // Kald den når brugeren trykker "Next" (eller når du vil gemme)
 class IndinvidualInfoViewModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final cprController = TextEditingController();
  final diagnoseController = TextEditingController();

  String get name => nameController.text;
  String get phone => phoneController.text;
  String get cpr => cprController.text;
  String get diagnose => diagnoseController.text;

  // Gemmer alt på én gang (ingen null-problemer)
  Individual buildIndividual() {
    return Individual(name, phone, cpr, diagnose);
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    cprController.dispose();
    diagnoseController.dispose();
    super.dispose();
  }
}

