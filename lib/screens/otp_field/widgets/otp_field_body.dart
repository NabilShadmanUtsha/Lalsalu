import 'package:lalsalu/models/all_products.dart';
import 'package:lalsalu/screens/checkout/checkout_view.dart';

import 'package:flutter/material.dart';

import 'package:lalsalu/common/custom_button.dart';

import 'package:lalsalu/screens/otp_field/otp_field_viewmodel.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:lalsalu/common/custom_snackbar.dart';

class OtpFieldBody extends StatefulWidget {
  final String phoneNumber;
  final List<Products> cartItems;
  final OtpFieldViewmodel viewmodel;
  const OtpFieldBody({
    Key? key,
    required this.viewmodel,
    required this.phoneNumber,
    required this.cartItems,
  }) : super(key: key);

  @override
  State<OtpFieldBody> createState() => _OtpFieldBodyState();
}

class _OtpFieldBodyState extends State<OtpFieldBody> {
  bool isLoading = false;
  String otp = '';
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 30,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Text(
                  "OTP Verification",
                  style: theme.textTheme.headline2!.copyWith(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "we have sent you a OTP code at",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyText2,
                ),
                Text(
                  widget.phoneNumber,
                  style: theme.textTheme.bodyText2,
                ),
                const SizedBox(height: 50),
                PinCodeTextField(
                  keyboardType: TextInputType.number,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  scrollPadding: EdgeInsets.zero,
                  textStyle: theme.textTheme.bodyText1,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    inactiveColor: theme.colorScheme.secondary,
                    selectedColor: theme.colorScheme.primary,
                    borderWidth: 4,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: false,
                  onCompleted: (v) async {
                    await verifyOTP(widget.viewmodel);
                  },
                  onChanged: (value) {
                    otp = value;
                  },
                  appContext: context,
                ),
                const SizedBox(height: 20),
                widget.viewmodel.isLoading == true
                    ? CustomButton(
                        buttonColor: Theme.of(context).colorScheme.primary,
                        textColor: Colors.white,
                        loading: true,
                        onPressed: () {},
                      )
                    : CustomButton(
                        buttonColor: Theme.of(context).colorScheme.primary,
                        textColor: Colors.white,
                        buttonText: "Verify OTP",
                        loading: false,
                        onPressed: () {
                          verifyOTP(widget.viewmodel);
                        },
                      ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  verifyOTP(OtpFieldViewmodel viewmodel) async {
    if (otp.isNotEmpty) {
      setState(() {
        widget.viewmodel.isLoading = true;
      });

      var res = await viewmodel.verifyOtp(widget.phoneNumber, otp);

      if (res['data'] != null) {
        viewmodel.isLoading = false;

        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CheckoutView(cartItems: widget.cartItems),
          ),
        );
      } else {
        viewmodel.isLoading = false;

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            errorSnackBar("${res['message']}, please try again!"));
      }
    } else {
      viewmodel.isLoading = false;

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(errorSnackBar("Please enter your otp!"));
    }
  }
}
