import 'package:flutter/material.dart';
import 'package:lalsalu/models/category_tree.dart';

class SubCategoryItem extends StatefulWidget {
  final SubCategories subCat;
  const SubCategoryItem({super.key, required this.subCat});

  @override
  State<SubCategoryItem> createState() => _SubCategoryItemState();
}

class _SubCategoryItemState extends State<SubCategoryItem> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => CategoriesView(
        //       tittle: widget.subCat.name!,
        //       categories: widget.subCat,
        //     ),
        //   ),
        // );
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
            '${widget.subCat.name}',
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
