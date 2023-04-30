import 'package:lalsalu/dependencies/dependencies.dart';
import 'package:lalsalu/models/all_products.dart';
import 'package:lalsalu/models/category_tree.dart';
import 'package:lalsalu/screens/viewmodel.dart';
import 'package:lalsalu/services/home_services/home_services.dart';
import 'package:lalsalu/services/product_services/product_services.dart';

class CategoriesViewmodel extends Viewmodel {
  HomeServices get _service => dependency();
  ProductServices get productService => dependency();

  CategoryTree? category;
  AllProducts? allProductList;

  getCategories() async {
    print('called Categories');
    final listJson = await _service.getCategories();
    // print(listJson);
    return update(() async {
      category = CategoryTree.fromJson(listJson);
    });
  }

  getAllProducts(int pageNo, String categoryId, String subCategoryId,
      String childCategoryId) async {
    print('called All Products');
    final listJson = await productService.getProducts(
        pageNo, categoryId, subCategoryId, childCategoryId);
    // print(listJson);
    return update(() async {
      allProductList = AllProducts.fromJson(listJson);
    });
  }
}
