abstract class PaymentServices {
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
      double shippingFee);
}
