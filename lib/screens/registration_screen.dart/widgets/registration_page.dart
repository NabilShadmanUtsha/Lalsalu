import 'package:flutter/material.dart';
import 'package:lalsalu/common/custom_button.dart';
import 'package:lalsalu/common/custom_dialouge.dart';
import 'package:lalsalu/common/custom_snackbar.dart';
import 'package:lalsalu/common/custom_text_field.dart';
import 'package:lalsalu/models/all_products.dart';
import 'package:lalsalu/screens/checkout/widgets/checkout.dart';
import 'package:lalsalu/screens/otp_field/otp_field_view.dart';

import 'package:lalsalu/screens/registration_screen.dart/registration_viewmode.dart';

class RegistrationPage extends StatefulWidget {
  final RegistrationViewmodel viewmodel;

  final List<Products> cartItems;
  const RegistrationPage({
    Key? key,
    required this.viewmodel,
    required this.cartItems,
  }) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // for updating user data
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  saveUserData(RegistrationViewmodel viewmodel, theme, context) async {
    if (viewmodel.genderSelector != 0) {
      viewmodel.isLoading = true;
      var res =
          await viewmodel.updateUserData(firstName, lastName, email, phone);
      if (res['stack'] == null) {
        viewmodel.isLoading = false;
        showDialog(
          context: context,
          builder: (context) => CustomDialogue(
            isSuccess: true,
            message: res['message'],
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpFieldView(
                    cartItems: widget.cartItems, phoneNumber: phone.text),
              ),
            ),
          ),
        );
      } else {
        viewmodel.isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(
            res['stack'].toString().replaceAll(
                  RegExp(r"\p{P}", unicode: true),
                  "",
                ),
          ),
        );
      }
    } else {
      viewmodel.isLoading = false;
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar("A valid gender is required!"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text('LalShalu'),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextFormField(
                  textInputType: TextInputType.name,
                  controller: firstName,
                  hintText: "First Name *",
                  isObscured: false,
                  isDigit: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  textInputType: TextInputType.name,
                  controller: lastName,
                  hintText: "Last Name *",
                  isObscured: false,
                  isDigit: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      textInputType: TextInputType.emailAddress,
                      controller: email,
                      hintText: "Email *",
                      isObscured: false,
                      isDigit: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      textInputType: TextInputType.number,
                      controller: phone,
                      hintText: "Phone Number *",
                      isObscured: false,
                      isDigit: false,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Theme(
                              data: ThemeData(
                                toggleableActiveColor: Colors.black,
                                unselectedWidgetColor: Colors.black,
                              ),
                              child: Radio(
                                activeColor: Colors.black,
                                value: 1,
                                groupValue: widget.viewmodel.genderSelector,
                                onChanged: (int? val) {
                                  //print(val);
                                  widget.viewmodel.genderSelector = val!;
                                },
                              ),
                            ),
                            const Text("Male"),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Row(
                          children: [
                            Theme(
                              data: ThemeData(
                                toggleableActiveColor: Colors.black,
                                unselectedWidgetColor: Colors.black,
                              ),
                              child: Radio(
                                activeColor: Colors.black,
                                value: 2,
                                groupValue: widget.viewmodel.genderSelector,
                                onChanged: (int? val) {
                                  //print(val);
                                  widget.viewmodel.genderSelector = val!;
                                },
                              ),
                            ),
                            const Text("Female"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                widget.viewmodel.isLoading == false
                    ? CustomButton(
                        buttonText: "Continue",
                        onPressed: () async => await saveUserData(
                            widget.viewmodel, theme, context),
                        buttonColor: theme.colorScheme.primary,
                        textColor: Colors.white,
                      )
                    : CustomButton(
                        loading: true,
                        buttonColor: theme.colorScheme.primary,
                        textColor: Colors.white,
                      ),
                const SizedBox(
                  height: 180,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
