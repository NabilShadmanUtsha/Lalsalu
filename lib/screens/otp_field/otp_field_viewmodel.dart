import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lalsalu/dependencies/dependencies.dart';
import 'package:lalsalu/screens/viewmodel.dart';
import 'package:lalsalu/services/auth_services/auth_services.dart';

class OtpFieldViewmodel extends Viewmodel {
  AuthServices get authServices => dependency();

  bool _isLoading = false;

  String _otp = '';

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    turnIdle();
  }

  String get otp => _otp;
  set otp(String value) {
    _otp = value;
    turnIdle();
  }

  verifyOtp(String phoneNumber, String otp) async {
    final Map<String, dynamic> map =
        await authServices.verifyOtp(phoneNumber, otp);
    final storage = FlutterSecureStorage();
    if (map['data'] != null) {
      storage.write(key: 'token', value: map['data']['access']['token']);
      storage.write(
          key: 'token_expiry', value: map['data']['access']['expires']);
      storage.write(key: 'rtoken', value: map['data']['refresh']['token']);
      storage.write(
          key: 'rtoken_expiry', value: map['data']['refresh']['expires']);
      storage.write(key: 'userId', value: map['data']['user']['_id']);
    }
    //print(map['data']['user']['firstName']);
    return map;
  }
}
