import 'package:flutter/material.dart';
import 'package:lalsalu/screens/accounts/accounts_viewmodel.dart';
import 'package:lalsalu/screens/accounts/widgets/accounts_body.dart';
import 'package:lalsalu/screens/view.dart';
import 'package:lalsalu/screens/viewmodel.dart';

class AccountsView extends StatelessWidget {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return View(
      builder: (_, viewmodel, __) {
        return AccountsBody(
          viewmodel: viewmodel,
        );
      },
      viewmodel: AccountsViewmodel(),
    );
  }
}
