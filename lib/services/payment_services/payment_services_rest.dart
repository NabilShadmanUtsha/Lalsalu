import 'package:lalsalu/dependencies/dependencies.dart';
import 'package:lalsalu/services/payment_services/payment_services.dart';
import 'package:lalsalu/services/rest_services.dart';

class PaymentServicesRest implements PaymentServices {
  RestService get rest => dependency();

  @override
  sendCashPaymentInfo(
      String userId,
      String email,
      String phone,
      String address,
      String countryId,
      String countryName,
      String cityId,
      String cityName,
      List products,
      String redirectUrl,
      String paymentFrom,
      double amount,
      double shippingFee) async {
    final Map<String, dynamic> map = await rest.post(
      '/front-end/payment/cash-payment',
      data: {
        "userId": userId,
        "email": email,
        "phone": phone,
        "address": address,
        "country": {"_id": countryId, "name": countryName},
        "city": {"_id": cityId, "name": cityName},
        "products": products,
        "redirectUrl": "",
        "paymentFrom": "",
        "amount": amount,
        "shippingFee": shippingFee
      },
    );
    return map;
  }
}
