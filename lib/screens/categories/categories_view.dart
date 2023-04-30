import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lalsalu/models/category_tree.dart';
import 'package:lalsalu/screens/categories/categories_viewmodel.dart';
import 'package:lalsalu/screens/categories/widgets/main_category.dart';
import 'package:lalsalu/screens/home/home_viewmodel.dart';
import 'package:lalsalu/screens/view.dart';

class CategoriesView extends StatelessWidget {
  final String tittle;
  final CatDiv categories;
  const CategoriesView(
      {super.key, required this.tittle, required this.categories});

  @override
  Widget build(BuildContext context) {
    return View(
      builder: (_, viewmodel, __) {
        return MainCategories(
          viewmodel: viewmodel,
          tittle: tittle,
          categories: categories,
        );
      },
      viewmodel: CategoriesViewmodel(),
    );
  }
}
