import 'package:lalsalu/dependencies/dependencies.dart';
import 'package:lalsalu/services/product_services/product_services.dart';
import 'package:lalsalu/services/rest_services.dart';

class ProductServicesRest implements ProductServices {
  RestService get _rest => dependency();

  @override
  getProducts(int pageNo, String categoryId, String subCategoryId,
      String childCategoryId) async {
    print(pageNo);
    print(categoryId);
    final Map<String, dynamic> map = await _rest.get(
        'front-end/products?page=$pageNo&perPage=10&categoryId=$categoryId&subCategoryId=$subCategoryId&childCategoryId=$childCategoryId');
    return map;
  }
}
