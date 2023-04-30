import 'package:lalsalu/models/all_products.dart';

class Payment {
  String? userId;
  String? email;
  String? phone;
  String? address;
  Country? country;
  Country? city;
  List<Products>? products;
  String? redirectUrl;
  String? paymentFrom;
  int? amount;
  int? shippingFee;

  Payment(
      {this.userId,
      this.email,
      this.phone,
      this.address,
      this.country,
      this.city,
      this.products,
      this.redirectUrl,
      this.paymentFrom,
      this.amount,
      this.shippingFee});

  Payment.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    city = json['city'] != null ? new Country.fromJson(json['city']) : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    redirectUrl = json['redirectUrl'];
    paymentFrom = json['paymentFrom'];
    amount = json['amount'];
    shippingFee = json['shippingFee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['redirectUrl'] = this.redirectUrl;
    data['paymentFrom'] = this.paymentFrom;
    data['amount'] = this.amount;
    data['shippingFee'] = this.shippingFee;
    return data;
  }
}

class Country {
  String? sId;
  String? name;

  Country({this.sId, this.name});

  Country.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
