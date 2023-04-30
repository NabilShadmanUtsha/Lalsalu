import 'package:lalsalu/models/all_products.dart';

class CategoryProducts {
  List<Data>? data;
  String? message;

  CategoryProducts({this.data, this.message});

  CategoryProducts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class Data {
  String? sId;
  String? name;
  List<Products>? products;

  Data({this.sId, this.name, this.products});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
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
}
