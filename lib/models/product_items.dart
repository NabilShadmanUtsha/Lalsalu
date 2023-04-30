import 'package:lalsalu/models/all_products.dart';

class ProductItems {
  List<Products>? data;
  String? message;

  ProductItems({this.data, this.message});

  ProductItems.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Products>[];
      json['data'].forEach((v) {
        data!.add(Products.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class Category {
  String? name;
  String? sId;

  Category({this.name, this.sId});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['_id'] = this.sId;
    return data;
  }
}

class Tags {
  String? name;
  String? photo;
  String? sId;

  Tags({this.name, this.photo, this.sId});

  Tags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photo = json['photo'];
    sId = json['_id'];
  }
}

class Price {
  dynamic cost;
  dynamic tax;
  dynamic regular;
  dynamic newPrice;

  Price({this.cost, this.tax, this.regular, this.newPrice});

  Price.fromJson(Map<String, dynamic> json) {
    cost = json['cost'];
    tax = json['tax'];
    regular = json['regular'];
    newPrice = json['new'];
  }
}

class Discount {
  dynamic type;
  dynamic value;
  dynamic from;
  dynamic to;

  Discount({this.type, this.value, this.from, this.to});

  Discount.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    from = json['from'];
    to = json['to'];
  }
}

class Stock {
  bool? isAlert;
  int? alertQty;
  int? quantity;

  Stock({this.isAlert, this.alertQty, this.quantity});

  Stock.fromJson(Map<String, dynamic> json) {
    isAlert = json['isAlert'];
    alertQty = json['alertQty'];
    quantity = json['quantity'];
  }
}

class Description {
  String? short;
  String? long;

  Description({this.short, this.long});

  Description.fromJson(Map<String, dynamic> json) {
    short = json['short'];
    long = json['long'];
  }
}

class File {
  String? cover;
  String? featured;
  String? video;
  List<Gallery>? gallery;

  File({this.cover, this.featured, this.video, this.gallery});

  File.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    featured = json['featured'];
    video = json['video'];
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(new Gallery.fromJson(v));
      });
    }
  }
}

class Gallery {
  String? file;
  String? sId;

  Gallery({this.file, this.sId});

  Gallery.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['_id'] = this.sId;
    return data;
  }
}
