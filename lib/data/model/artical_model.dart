class articalModel {
  String? message;
  List<Articals>? articals;

  articalModel({this.message, this.articals});

  articalModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['articals'] != null) {
      articals = <Articals>[];
      json['articals'].forEach((v) {
        articals!.add(new Articals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.articals != null) {
      data['articals'] = this.articals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articals {
  int? id;
  String? title;
  String? thumnail;
  String? content;
  String? author;
  String? sub_cateogry_id;
  String? categoryId;
  String? tagId;
  String? typeId;
  String? origin;
  String? featureId;
  int? like;
  String? createdAt;
  String? updatedAt;
  Category? category;
  Type? type;

  Articals(
      {this.id,
        this.title,
        this.thumnail,
        this.content,
        this.author,
        this.sub_cateogry_id,
        this.categoryId,
        this.tagId,
        this.typeId,
        this.origin,
        this.featureId,
        this.like,
        this.createdAt,
        this.updatedAt,
        this.category,
        this.type});

  Articals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumnail = json['thumnail'];
    content = json['content'];
    author = json['author'];
    sub_cateogry_id = json['sub_cateogry_id'];
    categoryId = json['category_id'];
    tagId = json['tag_id'];
    typeId = json['type_id'];
    origin = json['origin'];
    featureId = json['feature_id'];
    like = json['like'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumnail'] = this.thumnail;
    data['content'] = this.content;
    data['author'] = this.author;
    data['sub_cateogry_id'] = this.sub_cateogry_id;
    data['category_id'] = this.categoryId;
    data['tag_id'] = this.tagId;
    data['type_id'] = this.typeId;
    data['origin'] = this.origin;
    data['feature_id'] = this.featureId;
    data['like'] = this.like;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? title;
  String? discription;
  String? thumnail;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
        this.title,
        this.discription,
        this.thumnail,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    discription = json['discription'];
    thumnail = json['thumnail'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['discription'] = this.discription;
    data['thumnail'] = this.thumnail;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Type {
  int? id;
  String? name;
  String? description;
  Null? createdAt;
  Null? updatedAt;

  Type({this.id, this.name, this.description, this.createdAt, this.updatedAt});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
