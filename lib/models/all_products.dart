class AllProducts {
  Data? data;
  String? message;

  AllProducts({this.data, this.message});

  AllProducts.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<Products>? products;
  int? page;
  int? total;
  int? showing;
  bool? hasMore;

  Data({this.products, this.page, this.total, this.showing, this.hasMore});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    page = json['page'];
    total = json['total'];
    showing = json['showing'];
    hasMore = json['hasMore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['total'] = this.total;
    data['showing'] = this.showing;
    data['hasMore'] = this.hasMore;
    return data;
  }
}

class Products {
  String? sId;
  Category? category;
  Category? subCategory;
  List<Tags>? tags;
  String? name;
  Price? price;
  Discount? discount;
  Stock? stock;
  Description? description;
  File? file;
  String? productId;
  String? sku;

  Products(
      {this.sId,
      this.category,
      this.subCategory,
      this.tags,
      this.name,
      this.price,
      this.discount,
      this.stock,
      this.description,
      this.file,
      this.productId,
      this.sku});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    subCategory = json['subCategory'] != null
        ? new Category.fromJson(json['subCategory'])
        : null;
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
    name = json['name'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    discount = json['discount'] != null
        ? new Discount.fromJson(json['discount'])
        : null;
    stock = json['stock'] != null ? new Stock.fromJson(json['stock']) : null;
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    productId = json['productId'];
    sku = json['sku'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.subCategory != null) {
      data['subCategory'] = this.subCategory!.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    if (this.discount != null) {
      data['discount'] = this.discount!.toJson();
    }
    if (this.stock != null) {
      data['stock'] = this.stock!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    data['productId'] = this.productId;
    data['sku'] = this.sku;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['_id'] = this.sId;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cost'] = this.cost;
    data['tax'] = this.tax;
    data['regular'] = this.regular;
    data['new'] = this.newPrice;
    return data;
  }
}

class Discount {
  String? type;
  dynamic? value;
  String? from;
  String? to;

  Discount({this.type, this.value, this.from, this.to});

  Discount.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    data['value'] = this.value;
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAlert'] = this.isAlert;
    data['alertQty'] = this.alertQty;
    data['quantity'] = this.quantity;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['short'] = this.short;
    data['long'] = this.long;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cover'] = this.cover;
    data['featured'] = this.featured;
    data['video'] = this.video;
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
    return data;
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
