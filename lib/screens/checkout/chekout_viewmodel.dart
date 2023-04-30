import 'dart:convert';

import 'package:lalsalu/dependencies/dependencies.dart';
import 'package:lalsalu/models/payment.dart';
import 'package:lalsalu/models/user_info.dart';
import 'package:lalsalu/screens/viewmodel.dart';
import 'package:lalsalu/services/payment_services/payment_services.dart';
import 'package:lalsalu/services/user_services/user_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutViewmodel extends Viewmodel {
  CheckoutViewmodel() {
    _getUserInfo();
  }

  UserServices get _services => dependency();
  PaymentServices get _pservices => dependency();

  UserInfo? userInfo;
  Payment? paymentInfo;
  bool _isLoading = false;
  final int _shippingFee = 80;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    turnBusy();
    _isLoading = value;
    turnIdle();
  }

  int _paymentSelector = 0;

  int get paymentSelector => _paymentSelector;
  set paymentSelector(int value) {
    turnBusy();
    _paymentSelector = value;
    turnIdle();
  }

  int get shippingFee => _shippingFee;

  _getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final rawJson = prefs.getString('userInfo') ?? '';
    if (rawJson.isNotEmpty) {
      Map<String, dynamic> map = jsonDecode(rawJson);
      print(map);
      return update(() async {
        userInfo = UserInfo.fromJson(map);
      });
    } else {
      final listJson = await _services.getUserInfo();
      print(listJson);
      return update(() async {
        userInfo = UserInfo.fromJson(listJson);
      });
    }
  }

  sendPaymentInfo(
      String userId,
      String email,
      String phone,
      String address,
      String countryId,
      String countryName,
      String cityId,
      String cityName,
      List products,
      String redirectUrl,
      String paymentFrom,
      double amount,
      double shippingFee) async {
    final Map<String, dynamic> map = await _pservices.sendCashPaymentInfo(
        userId,
        email,
        phone,
        address,
        countryId,
        countryName,
        cityId,
        cityName,
        products,
        redirectUrl,
        paymentFrom,
        amount,
        shippingFee);
    return map;
  }
}
