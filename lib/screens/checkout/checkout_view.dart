import 'package:flutter/material.dart';
import 'package:lalsalu/models/all_products.dart';
import 'package:lalsalu/screens/checkout/chekout_viewmodel.dart';
import 'package:lalsalu/screens/checkout/widgets/checkout.dart';
import 'package:lalsalu/screens/view.dart';

class CheckoutView extends StatelessWidget {
  final List<Products> cartItems;
  const CheckoutView({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return View(
      builder: (_, viewmodel, __) {
        return CheckOut(
          viewmodel: viewmodel,
          cartItems: cartItems,
        );
      },
      viewmodel: CheckoutViewmodel(),
    );
  }
}
