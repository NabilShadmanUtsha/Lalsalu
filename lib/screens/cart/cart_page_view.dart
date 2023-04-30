import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lalsalu/models/all_products.dart';
import 'package:lalsalu/screens/cart/cart_page_viewmodel.dart';
import 'package:lalsalu/screens/cart/widgets/cart_page_body.dart';
import 'package:lalsalu/screens/view.dart';

class CartPageView extends StatelessWidget {
  final List<Products> cartItems;
  const CartPageView({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return View(
      builder: (_, viewmodel, __) {
        return CartPageBody(
          viewmodel: viewmodel,
          cartItems: cartItems,
          phoneNumber: '',
        );
      },
      viewmodel: CartPageViewmodel(),
    );
  }
}
