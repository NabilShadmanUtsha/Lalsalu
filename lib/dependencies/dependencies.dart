import 'package:get_it/get_it.dart';
import 'package:lalsalu/services/auth_services/auth_services.dart';
import 'package:lalsalu/services/auth_services/auth_services_rest.dart';
import 'package:lalsalu/services/home_services/home_services.dart';
import 'package:lalsalu/services/home_services/home_services_rest.dart';
import 'package:lalsalu/services/payment_services/payment_services.dart';
import 'package:lalsalu/services/product_services/product_services.dart';
import 'package:lalsalu/services/product_services/product_services_rest.dart';
import 'package:lalsalu/services/rest_services.dart';
import 'package:lalsalu/services/user_services/user_services.dart';
import 'package:lalsalu/services/user_services/user_services_rest.dart';

import '../services/payment_services/payment_services_rest.dart';

GetIt dependency = GetIt.instance;

void init() {
  // inject base url
  dependency.registerLazySingleton<RestService>(
    () => const RestService(baseUrl: 'https://api.lalsalushop.com'),
  );

  // inject service class
  dependency.registerLazySingleton<HomeServices>(() => HomeServicesRest());
  dependency
      .registerLazySingleton<ProductServices>(() => ProductServicesRest());

  dependency.registerLazySingleton<AuthServices>(() => AuthServicesRest());
  dependency.registerLazySingleton<UserServices>(() => UserServicesRest());
  dependency
      .registerLazySingleton<PaymentServices>(() => PaymentServicesRest());
}
