import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lalsalu/screens/products/product_page_viewmodel.dart';
import 'package:lalsalu/screens/products/widgets/product_page_body.dart';
import 'package:lalsalu/screens/view.dart';

class ProductPageView extends StatelessWidget {
  const ProductPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return View(
      builder: (_, viewmodel, __) {
        return ProductPageBody(
          viewmodel: viewmodel,
        );
      },
      viewmodel: ProductPageViewmodel(),
    );
  }
}
