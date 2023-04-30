import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lalsalu/dependencies/dependencies.dart';
import 'package:lalsalu/screens/viewmodel.dart';
import 'package:lalsalu/services/auth_services/auth_services.dart';

class MobileNumberViewmodel extends Viewmodel {
  AuthServices get authServices => dependency();

  bool _isLoading = false;

  String _phoneNumber = '';

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    turnIdle();
  }

  String get phoneNumber => _phoneNumber;
  set phoneNumber(String value) {
    _phoneNumber = value;
    turnIdle();
  }

  verifyPhone(String phoneNumber) async {
    final Map<String, dynamic> map =
        await authServices.sendLoginCred(phoneNumber);
    final storage = FlutterSecureStorage();
    print(map['data']);
    storage.write(key: 'userId', value: map['data']['_id']);
    return map;
  }
}
