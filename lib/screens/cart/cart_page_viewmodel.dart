import 'dart:convert';

import 'package:lalsalu/models/all_products.dart';
import 'package:lalsalu/screens/viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPageViewmodel extends Viewmodel {
  CartPageViewmodel() {
    getFromStorage();
  }

  List<Products> _cartItems = [];
  List<Products> get cartItems => _cartItems;
  set cartItems(List<Products> value) {
    _cartItems = value;
    turnIdle();
  }

  getFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final rawJson = prefs.getString('cartItems') ?? '';
    if (rawJson.isNotEmpty) {
      final list = jsonDecode(rawJson);
      return update(() async {
        cartItems = list.map<Products>((e) => Products.fromJson(e)).toList();
      });
    } else {
      return update(() async {
        cartItems = [];
      });
    }
  }
}
