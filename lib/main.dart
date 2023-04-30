import 'package:flutter/material.dart';
import 'package:lalsalu/common/theme_data.dart';
import 'package:lalsalu/screens/onboard_screen/onboard_screem_view.dart';
import 'package:lalsalu/screens/onboard_screen/widgets/onboard_screen_body.dart';
import 'package:lalsalu/dependencies/dependencies.dart' as di;
import 'screens/onboard_screen/onboard_screen_viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: const OnboardScreenView(),
    );
  }
}
