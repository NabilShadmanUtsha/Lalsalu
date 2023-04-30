class Banners {
  List<Data>? data;
  String? message;

  Banners({this.data, this.message});

  Banners.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? photo;
  int? position;
  String? sId;
  String? name;
  String? url;
  String? status;
  String? description;

  Data(
      {this.photo,
      this.position,
      this.sId,
      this.name,
      this.url,
      this.status,
      this.description});

  Data.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    position = json['position'];
    sId = json['_id'];
    name = json['name'];
    url = json['url'];
    status = json['status'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    data['position'] = this.position;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['url'] = this.url;
    data['status'] = this.status;
    data['description'] = this.description;
    return data;
  }
}
