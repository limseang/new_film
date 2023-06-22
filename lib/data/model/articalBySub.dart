class ArticalBySubModel {
  String? message;
  List<Articalbysub>? artical;

  ArticalBySubModel({this.message, this.artical});

  ArticalBySubModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['artical'] != null) {
      artical = <Articalbysub>[];
      json['artical'].forEach((v) {
        artical!.add(new Articalbysub.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.artical != null) {
      data['artical'] = this.artical!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articalbysub {
  int? id;
  String? title;
  String? thumnail;
  String? content;
  String? author;
  String? subCateogryId;
  String? categoryId;
  String? tagId;
  String? typeId;
  String? origin;
  String? featureId;
  Null? like;
  String? createdAt;
  String? updatedAt;

  Articalbysub(
      {this.id,
        this.title,
        this.thumnail,
        this.content,
        this.author,
        this.subCateogryId,
        this.categoryId,
        this.tagId,
        this.typeId,
        this.origin,
        this.featureId,
        this.like,
        this.createdAt,
        this.updatedAt});

  Articalbysub.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumnail = json['thumnail'];
    content = json['content'];
    author = json['author'];
    subCateogryId = json['sub_cateogry_id'];
    categoryId = json['category_id'];
    tagId = json['tag_id'];
    typeId = json['type_id'];
    origin = json['origin'];
    featureId = json['feature_id'];
    like = json['like'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumnail'] = this.thumnail;
    data['content'] = this.content;
    data['author'] = this.author;
    data['sub_cateogry_id'] = this.subCateogryId;
    data['category_id'] = this.categoryId;
    data['tag_id'] = this.tagId;
    data['type_id'] = this.typeId;
    data['origin'] = this.origin;
    data['feature_id'] = this.featureId;
    data['like'] = this.like;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
