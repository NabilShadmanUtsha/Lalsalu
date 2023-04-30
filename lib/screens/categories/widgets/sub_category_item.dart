import 'package:flutter/material.dart';
import 'package:lalsalu/models/category_tree.dart';

class SubCategoryItem extends StatefulWidget {
  final SubCategories categories;
  const SubCategoryItem({super.key, required this.categories});

  @override
  State<SubCategoryItem> createState() => _SubCategoryItemState();
}

class _SubCategoryItemState extends State<SubCategoryItem> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(20),
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
