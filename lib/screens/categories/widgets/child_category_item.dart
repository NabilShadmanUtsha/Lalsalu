import 'package:flutter/material.dart';
import 'package:lalsalu/models/category_tree.dart';

class ChildCategoryItem extends StatefulWidget {
  final ChildCategories childCat;
  const ChildCategoryItem({super.key, required this.childCat});

  @override
  State<ChildCategoryItem> createState() => _ChildCategoryItemState();
}

class _ChildCategoryItemState extends State<ChildCategoryItem> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
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
            '${widget.childCat.name}',
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
