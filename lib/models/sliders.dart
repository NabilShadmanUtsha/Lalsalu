class Sliders {
  List<Data>? data;
  String? message;

  Sliders({this.data, this.message});

  Sliders.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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
  String? sId;
  String? title;
  String? subTitle;
  String? url;
  String? status;
  String? description;

  Data(
      {this.photo,
      this.sId,
      this.title,
      this.subTitle,
      this.url,
      this.status,
      this.description});

  Data.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    sId = json['_id'];
    title = json['title'];
    subTitle = json['subTitle'];
    url = json['url'];
    status = json['status'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['url'] = this.url;
    data['status'] = this.status;
    data['description'] = this.description;
    return data;
  }
}
