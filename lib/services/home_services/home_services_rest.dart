import 'package:lalsalu/dependencies/dependencies.dart';
import 'package:lalsalu/services/home_services/home_services.dart';
import 'package:lalsalu/services/rest_services.dart';

class HomeServicesRest implements HomeServices {
  RestService get _rest => dependency();

  @override
  getBanner() async {
    final Map<String, dynamic> map =
        await _rest.get('front-end/landing/banners');
    return map;
  }

  @override
  getSliders() async {
    final Map<String, dynamic> map =
        await _rest.get('front-end/landing/sliders');
    return map;
  }

  @override
  getCategories() async {
    final Map<String, dynamic> map =
        await _rest.get('front-end/utilities/category-tree');
    return map;
  }

  @override
  getNewArrival() async {
    final Map<String, dynamic> map =
        await _rest.get('front-end/landing/new-arrival-products');
    return map;
  }

  @override
  getOnSale() async {
    final Map<String, dynamic> map =
        await _rest.get('front-end/landing/on-sale-products');
    return map;
  }

  @override
  getFeatured() async {
    final Map<String, dynamic> map =
        await _rest.get('front-end/landing/featured-products');
    return map;
  }

  @override
  getCategoryProducts() async {
    final Map<String, dynamic> map =
        await _rest.get('front-end/landing/categories-products');
    return map;
  }
}
