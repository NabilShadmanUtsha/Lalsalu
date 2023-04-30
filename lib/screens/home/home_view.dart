import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lalsalu/screens/home/home_viewmodel.dart';
import 'package:lalsalu/screens/home/widgets/home_body.dart';

import 'package:lalsalu/screens/view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View(
      builder: (_, viewmodel, __) {
        return HomeBody(
          viewmodel: viewmodel,
        );
      },
      viewmodel: HomeViewmodel(),
    );
  }
}
