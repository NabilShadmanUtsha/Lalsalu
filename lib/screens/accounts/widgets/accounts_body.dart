import 'package:flutter/material.dart';
import 'package:lalsalu/common/custom_button.dart';
import 'package:lalsalu/dependencies/dependencies.dart';
import 'package:lalsalu/services/rest_services.dart';

class AccountsBody extends StatefulWidget {
  const AccountsBody({super.key, required viewmodel});

  @override
  State<AccountsBody> createState() => _AccountsBodyState();
}

class _AccountsBodyState extends State<AccountsBody> {
  RestService get rest => dependency();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: CustomButton(
            buttonText: "Logout",
            onPressed: () async => await rest.logout("front-end/auth/logout"),
            buttonColor: Colors.black,
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
