import 'dart:convert';

import 'package:lalsalu/dependencies/dependencies.dart';
import 'package:lalsalu/models/all_products.dart';
import 'package:lalsalu/models/banners.dart';

import 'package:lalsalu/models/category_products.dart';
import 'package:lalsalu/models/category_tree.dart';
import 'package:lalsalu/models/product_items.dart';
import 'package:lalsalu/models/sliders.dart';
import 'package:lalsalu/screens/viewmodel.dart';
import 'package:lalsalu/services/home_services/home_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewmodel extends Viewmodel {
  HomeViewmodel() {
    getCategoryProducts();
    getBannerLanding();
    getSliders();
    getNewArrival();
    getOnSale();
    getFeatured();
    getCategories();
    getFromStorage();
  }
  HomeServices get _service => dependency();

  Banners? appBannerList;
  Sliders? appSliderList;
  ProductItems? newArrivalList;
  ProductItems? onSaleList;
  ProductItems? featuredList;
  CategoryTree? categoryList;
  CategoryProducts? cProductList;
  List<Products> _cartItems = [];

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    turnIdle();
  }

  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    turnIdle();
  }

  List<Products> get cartItems => _cartItems;
  set cartItems(List<Products> value) {
    _cartItems = value;
    turnIdle();
  }

  int get currentPosition => _currentPosition;
  set currentPosition(int value) {
    _currentPosition = value;
    turnIdle();
  }

  int _selectedIndex = 0;
  int _currentPosition = 0;
  bool _isLoading = false;

  getBannerLanding() async {
    final listJson = await _service.getBanner();
    // add authors info data to shared pref for later
    final prefs = await SharedPreferences.getInstance();
    String rawJson = jsonEncode(listJson);
    prefs.setString('banners', rawJson);
    //end
    return update(() async {
      appBannerList = Banners.fromJson(listJson);
    });
  }

  getSliders() async {
    final listJson = await _service.getBanner();
    // add authors info data to shared pref for later
    final prefs = await SharedPreferences.getInstance();
    String rawJson = jsonEncode(listJson);
    prefs.setString('sliders', rawJson);
    //end
    return update(() async {
      appSliderList = Sliders.fromJson(listJson);
    });
  }

  getNewArrival() async {
    print('called getNewArrival');
    final listJson = await _service.getNewArrival();
    //print(listJson);
    return update(() async {
      newArrivalList = ProductItems.fromJson(listJson);
    });
  }

  getOnSale() async {
    print('called getOnSale');
    final listJson = await _service.getOnSale();
    //print(listJson);
    return update(() async {
      onSaleList = ProductItems.fromJson(listJson);
    });
  }

  getFeatured() async {
    print('called getFeaturedl');
    final listJson = await _service.getFeatured();
    // print(listJson);
    return update(() async {
      featuredList = ProductItems.fromJson(listJson);
    });
  }

  getCategories() async {
    print('called Categories');
    final listJson = await _service.getCategories();
    // print(listJson);
    return update(() async {
      categoryList = CategoryTree.fromJson(listJson);
    });
  }

  getCategoryProducts() async {
    print('called Category Products');
    final listJson = await _service.getCategoryProducts();
    // print(listJson);
    return update(() async {
      cProductList = CategoryProducts.fromJson(listJson);
    });
  }

  addToCartLocal(Products item) async {
    cartItems.add(item);
    final prefs = await SharedPreferences.getInstance();
    String rawJson = jsonEncode(cartItems);
    prefs.setString('cartItems', rawJson);
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
