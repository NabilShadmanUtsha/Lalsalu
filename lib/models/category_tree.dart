class CategoryTree {
  List<CatDiv>? data;
  String? message;

  CategoryTree({this.data, this.message});

  CategoryTree.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CatDiv>[];
      json['data'].forEach((v) {
        data!.add(CatDiv.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class CatDiv {
  String? sId;
  String? name;
  List<SubCategories>? subCategories;

  CatDiv({this.sId, this.name, this.subCategories});

  CatDiv.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    if (json['subCategories'] != null) {
      subCategories = <SubCategories>[];
      json['subCategories'].forEach((v) {
        subCategories!.add(SubCategories.fromJson(v));
      });
    }
  }
}

class SubCategories {
  String? sId;
  String? name;
  List<ChildCategories>? childCategories;

  SubCategories({this.sId, this.name, this.childCategories});

  SubCategories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    if (json['childCategories'] != null) {
      childCategories = <ChildCategories>[];
      json['childCategories'].forEach((v) {
        childCategories!.add(ChildCategories.fromJson(v));
      });
    }
  }
}

class ChildCategories {
  String? sId;
  String? name;

  ChildCategories({this.sId, this.name});

  ChildCategories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }
}
