import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lalsalu/common/custom_button.dart';
import 'package:lalsalu/dependencies/dependencies.dart';
import 'package:lalsalu/screens/accounts/accounts_view.dart';
import 'package:lalsalu/screens/home/home_view.dart';
import 'package:lalsalu/services/rest_services.dart';

class HomeController extends StatefulWidget {
  const HomeController({super.key});

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  int _selectedIndex = 0;

  Widget widgetOptions(int i) {
    final List<Widget> widgetOptions = <Widget>[
      const HomeView(),
      Container(),
      const AccountsView(),
    ];
    return widgetOptions.elementAt(i);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false, //selected item
        showUnselectedLabels: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 3,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/home.svg',
              width: 30,
              height: 30,
            ),
            activeIcon: SvgPicture.asset(
              'assets/svg/home_active.svg',
              color: Theme.of(context).colorScheme.primary,
              width: 30,
              height: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/mall.svg',
              width: 30,
              height: 30,
            ),
            activeIcon: SvgPicture.asset(
              'assets/svg/mall_active.svg',
              color: Theme.of(context).colorScheme.primary,
              width: 30,
              height: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/face.svg',
              width: 30,
              height: 30,
            ),
            activeIcon: SvgPicture.asset(
              'assets/svg/face_active.svg',
              color: Theme.of(context).colorScheme.primary,
              width: 30,
              height: 30,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: const Color(0xFF8DB8D0),
        onTap: _onItemTapped,
      ),
    );
  }
}
