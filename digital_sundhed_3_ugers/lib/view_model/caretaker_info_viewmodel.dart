part of '../../main.dart';

class CareTakerInfoViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String get name {
    return nameController.text;
  }

  String get phone {
    return phoneController.text;
  }

  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}