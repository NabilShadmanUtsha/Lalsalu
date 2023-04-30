import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lalsalu/dependencies/dependencies.dart';
import 'package:lalsalu/models/all_products.dart';
import 'package:lalsalu/screens/checkout/checkout_view.dart';
import 'package:lalsalu/screens/mobile_number/mobile_number_view.dart';
import 'package:lalsalu/screens/registration_screen.dart/registration_view.dart';
import 'package:lalsalu/services/rest_services.dart';
import 'package:lalsalu/services/user_services/user_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? accessTokenExpiry;
String? refreshTokenExpiry;

bool isRefreshTokenExpired = true;
bool isAcessTokenExpired = true;

class AuthWrapper extends StatefulWidget {
  final List<Products> cartItems;
  const AuthWrapper({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  //HomeTabViewmodel viewmodel = HomeTabViewmodel();

  @override
  void initState() {
    super.initState();
    checkIfRefreshTokenExpired().then(
      (v) => checkIfAccessTokenExpired().then((res) {
        if (isAcessTokenExpired == true) {
          showBottomSheet();
        }
      }),
    );
  }

  RestService get rest => dependency();
  UserServices get uServices => dependency();

  checkIfRefreshTokenExpired() async {
    const storage = FlutterSecureStorage();
    refreshTokenExpiry = await storage.read(key: "rtoken_expiry");
    // String? rtoken = await storage.read(key: "rtoken");
    // debugPrint(rtoken);
    if (refreshTokenExpiry != null) {
      DateTime expiryDate = DateTime.parse(refreshTokenExpiry!);
      if (expiryDate.isBefore(DateTime.now())) {
        debugPrint("R Token expired");
        setState(() {
          isRefreshTokenExpired = true;
        });
        return isRefreshTokenExpired;
      } else {
        setState(() {
          isRefreshTokenExpired = false;
        });
        return isRefreshTokenExpired;
      }
    }
  }

  checkIfAccessTokenExpired() async {
    const storage = FlutterSecureStorage();
    accessTokenExpiry = await storage.read(key: "token_expiry");
    if (accessTokenExpiry != null) {
      if (isRefreshTokenExpired == true) {
        setState(() {
          isAcessTokenExpired = true;
        });
        return isAcessTokenExpired;
      } else {
        DateTime expiryDate = DateTime.parse(accessTokenExpiry!);
        if (expiryDate.isBefore(DateTime.now())) {
          debugPrint("Token expired");
          final Map<String, dynamic> map =
              // ignore: use_build_context_synchronously
              await rest.refrshToken('front-end/auth/renew');

          const storage = FlutterSecureStorage();
          storage.write(key: 'token', value: map['data']['access']['token']);
          storage.write(
              key: 'token_expiry', value: map['data']['access']['expires']);
          storage.write(key: 'rtoken', value: map['data']['refresh']['token']);
          storage.write(
              key: 'rtoken_expiry', value: map['data']['refresh']['expires']);
          storage.write(key: 'userId', value: map['data']['user']['_id']);
          setState(() {
            isAcessTokenExpired = false;
          });
          return isAcessTokenExpired;
        } else {
          final listJson = await uServices.getUserInfo();
          if (listJson != null) {
            // add user info data to shared pref for later
            final prefs = await SharedPreferences.getInstance();
            String rawJson = jsonEncode(listJson);
            prefs.setString('userInfo', rawJson);
            //end
            debugPrint("Token not expired");
            setState(() {
              isAcessTokenExpired = false;
            });
            return isAcessTokenExpired;
          } else {
            debugPrint("Token expired");
            setState(() {
              isAcessTokenExpired = true;
            });
            return isAcessTokenExpired;
          }
        }
      }
    } else {
      setState(() {
        isAcessTokenExpired = true;
      });
      return isAcessTokenExpired;
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (isAcessTokenExpired == true) {
    //   debugPrint(isAcessTokenExpired.toString());
    //   return const OnboardScreenView();
    // } else {
    //   debugPrint(isAcessTokenExpired.toString());
    //   return const HomeController();
    // }
    return CheckoutView(
      cartItems: widget.cartItems,
    );
  }

  void showBottomSheet() {
    var theme = Theme.of(context);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 400,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Already have an account?',
                    style: theme.textTheme.bodyText1!.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: Text('Click here to Log in'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MobileNumberView(
                            cartItems: widget.cartItems,
                            phoneNumber: '',
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Don\'t have an account?',
                    style: theme.textTheme.bodyText1!.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: Text('Click here to Sign Up'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RegistrationView(cartItems: widget.cartItems),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
