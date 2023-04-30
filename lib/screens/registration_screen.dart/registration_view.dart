import 'package:flutter/material.dart';
import 'package:lalsalu/models/all_products.dart';
import 'package:lalsalu/screens/registration_screen.dart/registration_viewmode.dart';
import 'package:lalsalu/screens/registration_screen.dart/widgets/registration_page.dart';
import 'package:lalsalu/screens/view.dart';

class RegistrationView extends StatelessWidget {
  final List<Products> cartItems;

  const RegistrationView({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return View(
      builder: (_, viewmodel, __) {
        return RegistrationPage(
          viewmodel: viewmodel,
          cartItems: cartItems,
        );
      },
      viewmodel: RegistrationViewmodel(),
    );
  }
}
