import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lalsalu/screens/onboard_screen/onboard_screen_viewmodel.dart';
import 'package:lalsalu/screens/onboard_screen/widgets/onboard_screen_body.dart';
import 'package:lalsalu/screens/view.dart';

class OnboardScreenView extends StatelessWidget {
  const OnboardScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View(
      builder: (_, viewmodel, __) {
        return OnboardScreenBody(
          viewmodel: viewmodel,
        );
      },
      viewmodel: OnboardScreenViewmodel(),
    );
  }
}
