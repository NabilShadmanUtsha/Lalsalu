import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lalsalu/dependencies/dependencies.dart';
import 'package:lalsalu/services/rest_services.dart';
import 'package:lalsalu/services/user_services/user_services.dart';

class UserServicesRest implements UserServices {
  RestService get rest => dependency();
  @override
  getUserInfo() async {
    final Map<String, dynamic> map =
        await rest.getWithToken('front-end/user/account-info');
    return map['data'];
  }

  @override
  updateUserData(
    String firstName,
    String lastName,
    String email,
    String phone,
    String gender,
  ) async {
    final Map<String, dynamic> map = await rest.post(
      'front-end/auth/register',
      data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "gender": gender,
      },
    );
    //print("response: ${map['message']}");
    return map;
  }
}
