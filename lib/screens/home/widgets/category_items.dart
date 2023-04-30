import 'package:flutter/material.dart';
import 'package:lalsalu/models/category_tree.dart';
import 'package:lalsalu/screens/categories/categories_view.dart';

class CategoryItem extends StatefulWidget {
  final CatDiv categories;
  const CategoryItem({super.key, required this.categories});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoriesView(
              tittle: widget.categories.name!,
              categories: widget.categories,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
            width: 50,
            child: Image(
              image: AssetImage('assets/images/mencloth.jpg'),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '${widget.categories.name}',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyText1!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
