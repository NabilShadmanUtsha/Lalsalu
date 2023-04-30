import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lalsalu/dependencies/dependencies.dart';
import 'package:lalsalu/services/auth_services/auth_services.dart';
import 'package:lalsalu/services/rest_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServicesRest implements AuthServices {
  RestService get rest => dependency();

  @override
  logout() async {
    final Map<String, dynamic> map = await rest.logout("front-end/auth/logout");
    return map['data'];
  }

  @override
  sendLoginCred(String phoneNumber) async {
    final Map<String, dynamic> map = await rest.post(
      'front-end/auth/login',
      data: {
        "phone": phoneNumber,
      },
    );

    return map;
  }

  @override
  verifyOtp(String phoneNumber, String otp) async {
    const storage = FlutterSecureStorage();
    String? userId = await storage.read(key: 'userId');
    // get fcm_token from shared preferences
    //final prefs = await SharedPreferences.getInstance();
    //final fcmToken = prefs.getString('fcm_token') ?? '';
    debugPrint('userid $userId');
    debugPrint('otp $otp');
    debugPrint('phone $phoneNumber');
    final Map<String, dynamic> map = await rest.putWithBasic(
      'front-end/auth/otp-verify',
      data: {
        "userId": userId,
        "otp": otp,
        "phone": phoneNumber,
      },
    );
    //print(map['data']['access']['token']);
    return map;
  }
}
