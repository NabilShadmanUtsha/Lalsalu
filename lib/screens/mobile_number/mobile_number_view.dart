import 'package:flutter/material.dart';
import 'package:lalsalu/models/all_products.dart';
import 'package:lalsalu/screens/mobile_number/mobile_number_viewmodel.dart';
import 'package:lalsalu/screens/mobile_number/widgets/mobile_number.dart';
import 'package:lalsalu/screens/view.dart';

class MobileNumberView extends StatelessWidget {
  final List<Products> cartItems;
  final String phoneNumber;
  const MobileNumberView(
      {super.key, required this.cartItems, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return View(
      builder: (_, viewmodel, __) {
        return MobileNumber(
            viewmodel: viewmodel,
            cartItems: cartItems,
            phoneNumber: phoneNumber);
      },
      viewmodel: MobileNumberViewmodel(),
    );
  }
}
