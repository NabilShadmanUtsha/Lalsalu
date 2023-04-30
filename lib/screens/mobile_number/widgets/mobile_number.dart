import 'package:lalsalu/models/all_products.dart';
import 'package:flutter/material.dart';
import 'package:lalsalu/common/custom_button.dart';
import 'package:lalsalu/common/custom_snackbar.dart';
import 'package:lalsalu/screens/mobile_number/mobile_number_viewmodel.dart';
import 'package:lalsalu/screens/otp_field/otp_field_view.dart';

class MobileNumber extends StatefulWidget {
  final MobileNumberViewmodel viewmodel;
  final List<Products> cartItems;
  const MobileNumber({
    Key? key,
    required this.viewmodel,
    required this.cartItems,
    required String phoneNumber,
  }) : super(key: key);

  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  TextEditingController phoneNumberController = TextEditingController();

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
                const SizedBox(height: 160),
                Text(
                  'lalsalu',
                  style: theme.textTheme.headline1!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 40),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter your mobile number to get started",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headline2,
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        style: theme.textTheme.bodyText2,
                        autofocus: true,

                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.surface,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          hintText: "Enter your phone number",
                          hintStyle: TextStyle(color: theme.hintColor),
                        ),
                        keyboardType: TextInputType.phone,
                        //textInputAction: TextInputAction.done,
                        controller: phoneNumberController,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 10) {
                            return "A valid phone no. is required!";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const SizedBox(height: 20),
                widget.viewmodel.isLoading == false
                    ? CustomButton(
                        loading: false,
                        buttonColor: Theme.of(context).colorScheme.primary,
                        textColor: Colors.white,
                        buttonText: "Verify Phone",
                        onPressed: () async {
                          if (phoneNumberController.text.isNotEmpty) {
                            setState(() {
                              widget.viewmodel.isLoading = true;
                            });

                            var res = await widget.viewmodel
                                .verifyPhone(phoneNumberController.text);
                            if (res['data'] != null) {
                              widget.viewmodel.isLoading = false;
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OtpFieldView(
                                    phoneNumber: phoneNumberController.text,
                                    cartItems: widget.cartItems,
                                  ),
                                ),
                              );
                            } else {
                              widget.viewmodel.isLoading = false;
                              ScaffoldMessenger.of(context).showSnackBar(
                                errorSnackBar(
                                    "Something went wrong please try again!"),
                              );
                            }
                          } else {
                            widget.viewmodel.isLoading = false;
                            ScaffoldMessenger.of(context).showSnackBar(
                              errorSnackBar(
                                "Please enter your mobile number!",
                              ),
                            );
                          }
                        },
                      )
                    : CustomButton(
                        loading: true,
                        buttonColor: theme.colorScheme.primary,
                        textColor: Colors.white,
                      ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
