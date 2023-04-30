import 'dart:convert';

import 'package:lalsalu/dependencies/dependencies.dart';
import 'package:lalsalu/models/user_info.dart';
import 'package:lalsalu/screens/viewmodel.dart';
import 'package:lalsalu/services/auth_services/auth_services.dart';
import 'package:lalsalu/services/user_services/user_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountsViewmodel extends Viewmodel {
  AccountsViewmodel() {
    _getUserInfo();
  }

  AuthServices get _aservices => dependency();
  UserServices get _services => dependency();

  UserInfo? userInfo;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    turnBusy();
    _isLoading = value;
    turnIdle();
  }

  logOut() async {
    var res = await _aservices.logout();
    return res;
  }

  _getUserInfo() async {
    // final prefs = await SharedPreferences.getInstance();
    // final rawJson = prefs.getString('userInfo') ?? '';
    // Map<String, dynamic> map = jsonDecode(rawJson);
    final listJson = await _services.getUserInfo();
    // add user info data to shared pref for later
    final prefs = await SharedPreferences.getInstance();
    String rawJson = jsonEncode(listJson);
    prefs.setString('userInfo', rawJson);
    //end
    print(listJson);
    return update(() async {
      userInfo = UserInfo.fromJson(listJson);
    });
  }
}
