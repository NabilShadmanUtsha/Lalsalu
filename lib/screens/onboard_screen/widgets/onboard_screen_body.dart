import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lalsalu/screens/home/home_controller.dart';
import 'package:lalsalu/screens/home/widgets/home_body.dart';
import 'package:lalsalu/screens/onboard_screen/onboard_screem_view.dart';
import 'package:lalsalu/screens/onboard_screen/onboard_screen_viewmodel.dart';
import 'package:lalsalu/screens/mobile_number/widgets/mobile_number.dart';
import 'package:lalsalu/screens/viewmodel.dart';

class OnboardScreenBody extends StatefulWidget {
  final OnboardScreenViewmodel viewmodel;
  const OnboardScreenBody({Key? key, required this.viewmodel})
      : super(key: key);

  @override
  State<OnboardScreenBody> createState() => _OnboardScreenBodyState();
}

class _OnboardScreenBodyState extends State<OnboardScreenBody> {
  PageController pageController = PageController(initialPage: 0);

  int currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  currentPosition = index;
                });
              },
              controller: pageController,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(30),
                      ),
                      const SizedBox(
                        height: 100,
                        child: Image(
                          image: AssetImage('assets/images/lalsalu_logo.png'),
                        ),
                      ),
                      const SizedBox(
                        height: 400,
                        child: Image(
                          image: AssetImage('assets/images/women.png'),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Shop Anywhere',
                        style: theme.textTheme.headline2,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(30),
                      ),
                      const SizedBox(
                        height: 100,
                        child: Image(
                          image: AssetImage('assets/images/lalsalu_logo.png'),
                        ),
                      ),
                      const SizedBox(
                        height: 400,
                        child: Image(
                          image: AssetImage('assets/images/men.png'),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Travel Evrywhere',
                        style: theme.textTheme.headline2,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                2,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeController(),
                        ),
                      );
                    },
                    child: Text(
                      'Skip',
                      style: theme.textTheme.button,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      currentPosition == 1
                          ? Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeController(),
                              ),
                            )
                          : pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                    },
                    child: Text(
                      currentPosition == 1 ? 'Get Started' : 'Next',
                      style: theme.textTheme.button,
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentPosition == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentPosition == index ? Colors.black : Color(0xFFD9D9D9),
      ),
    );
  }
}
