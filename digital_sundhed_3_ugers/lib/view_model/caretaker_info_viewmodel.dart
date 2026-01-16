part of '../../main.dart';

class CareTakerInfoViewModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  String get name => nameController.text;
  String get phone => phoneController.text;

  Caretaker buildCaretaker() {
    return Caretaker(name, phone);
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
