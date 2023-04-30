class UserInfo {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  // List<Null>? address;

  UserInfo({
    this.sId,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    // this.address
  });

  UserInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    // if (json['address'] != null) {
    //   address = <Null>[];
    //   json['address'].forEach((v) {
    //     address!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    // if (this.address != null) {
    //   data['address'] = this.address!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
