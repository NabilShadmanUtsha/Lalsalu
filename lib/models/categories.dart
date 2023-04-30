// class Categories {
//   List<Data>? data;
//   String? message;

//   Categories({this.data, this.message});

//   Categories.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     message = json['message'];
//   }
// }

// class Data {
//   String? sId;
//   String? name;

//   Data({this.sId, this.name});

//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//   }
// }
