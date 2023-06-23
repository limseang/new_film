class FilmModel {
  String? status;
  String? message;
  List<FilmModelList>? data;

  FilmModel({this.status, this.message, this.data});

  FilmModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <FilmModelList>[];
      json['data'].forEach((v) {
        data!.add(new FilmModelList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FilmModelList {
  int? id;
  String? title;
  String? overview;
  String? releaseDate;
  String? country;
  String? language;
  String? genre;
  String? poster;
  String? coverMovie;
  String? runningTime;
  String? trailer;
  Null? link;
  double? rateId;
  Null? likeId;
  String? createdAt;
  String? updatedAt;
  String? featureId;
  int? peopleRate;
  List<Actor>? actor;

  FilmModelList(
      {this.id,
        this.title,
        this.overview,
        this.releaseDate,
        this.country,
        this.language,
        this.genre,
        this.poster,
        this.coverMovie,
        this.runningTime,
        this.trailer,
        this.link,
        this.rateId,
        this.likeId,
        this.createdAt,
        this.updatedAt,
        this.featureId,
        this.peopleRate,
        this.actor});

  FilmModelList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    country = json['country'];
    language = json['language'];
    genre = json['genre'];
    poster = json['poster'];
    coverMovie = json['cover_movie'];
    runningTime = json['running_time'];
    trailer = json['trailer'];
    link = json['link'];
    rateId = json['rate_id'];
    likeId = json['like_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    featureId = json['feature_id'];
    peopleRate = json['people_rate'];
    if (json['actor'] != null) {
      actor = <Actor>[];
      json['actor'].forEach((v) {
        actor!.add(new Actor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['country'] = this.country;
    data['language'] = this.language;
    data['genre'] = this.genre;
    data['poster'] = this.poster;
    data['cover_movie'] = this.coverMovie;
    data['running_time'] = this.runningTime;
    data['trailer'] = this.trailer;
    data['link'] = this.link;
    data['rate_id'] = this.rateId;
    data['like_id'] = this.likeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['feature_id'] = this.featureId;
    data['people_rate'] = this.peopleRate;
    if (this.actor != null) {
      data['actor'] = this.actor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Actor {
  int? id;
  String? filmId;
  String? actorId;
  String? role;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  Actor(
      {this.id,
        this.filmId,
        this.actorId,
        this.role,
        this.name,
        this.image,
        this.createdAt,
        this.updatedAt});

  Actor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filmId = json['film_id'];
    actorId = json['actor_id'];
    role = json['role'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['film_id'] = this.filmId;
    data['actor_id'] = this.actorId;
    data['role'] = this.role;
    data['name'] = this.name;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
