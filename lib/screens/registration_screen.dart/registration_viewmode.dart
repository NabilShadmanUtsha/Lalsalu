import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lalsalu/dependencies/dependencies.dart';
import 'package:lalsalu/screens/viewmodel.dart';
import 'package:lalsalu/services/user_services/user_services.dart';

class RegistrationViewmodel extends Viewmodel {
  UserServices get _services => dependency();

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    turnBusy();
    _isLoading = value;
    turnIdle();
  }

  int _genderSelector = 0;

  int get genderSelector => _genderSelector;
  set genderSelector(int value) {
    turnBusy();
    _genderSelector = value;
    turnIdle();
  }

  updateUserData(firstName, lastName, email, phone) async {
    final storage = FlutterSecureStorage();
    String gender = '';
    if (genderSelector == 1) {
      gender = 'male';
    } else {
      gender = 'female';
    }
    final Map<String, dynamic> map = await _services.updateUserData(
      firstName.text.trim(),
      lastName.text.trim(),
      email.text.trim(),
      phone.text.trim(),
      gender,
    );
    storage.write(key: 'userId', value: map['data']['_id']);
    return map;
  }
}
