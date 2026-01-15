part of '../../main.dart';

class IndinvidualInfoViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cprController = TextEditingController();
  final TextEditingController diagnoseController = TextEditingController();

  String get name {
    return nameController.text;
  }

  String get phone {
    return phoneController.text;
  }

  String get cpr {
    return cprController.text;
  }

  String get diagnose {
    return diagnoseController.text;
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