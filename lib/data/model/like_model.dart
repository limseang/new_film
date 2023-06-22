class LikeModel {
  List<Likes>? likes;

  LikeModel({this.likes});

  LikeModel.fromJson(Map<String, dynamic> json) {
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(new Likes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.likes != null) {
      data['likes'] = this.likes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Likes {
  int? id;
  String? userId;
  String? articalId;
  String? createdAt;
  String? updatedAt;
  Artical? artical;

  Likes(
      {this.id,
        this.userId,
        this.articalId,
        this.createdAt,
        this.updatedAt,
        this.artical});

  Likes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    articalId = json['artical_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    artical =
    json['artical'] != null ? new Artical.fromJson(json['artical']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['artical_id'] = this.articalId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.artical != null) {
      data['artical'] = this.artical!.toJson();
    }
    return data;
  }
}

class Artical {
  int? id;
  String? title;
  String? thumnail;
  String? content;
  String? author;
  String? categoryId;
  String? tagId;
  String? typeId;
  String? origin;
  int? like;
  String? createdAt;
  String? updatedAt;

  Artical(
      {this.id,
        this.title,
        this.thumnail,
        this.content,
        this.author,
        this.categoryId,
        this.tagId,
        this.typeId,
        this.origin,
        this.like,
        this.createdAt,
        this.updatedAt});

  Artical.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumnail = json['thumnail'];
    content = json['content'];
    author = json['author'];
    categoryId = json['category_id'];
    tagId = json['tag_id'];
    typeId = json['type_id'];
    origin = json['origin'];
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
    data['category_id'] = this.categoryId;
    data['tag_id'] = this.tagId;
    data['type_id'] = this.typeId;
    data['origin'] = this.origin;
    data['like'] = this.like;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
