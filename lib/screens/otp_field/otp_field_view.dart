import 'package:flutter/material.dart';
import 'package:lalsalu/models/all_products.dart';
import 'package:lalsalu/screens/otp_field/otp_field_viewmodel.dart';
import 'package:lalsalu/screens/otp_field/widgets/otp_field_body.dart';

import 'package:lalsalu/screens/view.dart';

class OtpFieldView extends StatelessWidget {
  final List<Products> cartItems;
  final String phoneNumber;
  const OtpFieldView(
      {super.key, required this.cartItems, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return View(
      builder: (_, viewmodel, __) {
        return OtpFieldBody(
            viewmodel: viewmodel,
            cartItems: cartItems,
            phoneNumber: phoneNumber);
      },
      viewmodel: OtpFieldViewmodel(),
    );
  }
}
