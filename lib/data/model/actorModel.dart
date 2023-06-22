class ActorModel {
  String? status;
  String? message;
  List<ActorModelList>? data;

  ActorModel({this.status, this.message, this.data});

  ActorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ActorModelList>[];
      json['data'].forEach((v) {
        data!.add(new ActorModelList.fromJson(v));
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

class ActorModelList {
  int? id;
  String? firstName;
  String? lastName;
  String? gender;
  Null? alsoKnowAs;
  String? placeOfBirth;
  Null? categoryArtistId;
  String? dob;
  Null? dod;
  String? profile;
  String? bio;
  String? countryCode;
  Null? history;
  String? cover;
  Null? facebook;
  Null? twitter;
  Null? instagram;
  Null? youtube;
  Null? website;
  String? createdAt;
  String? updatedAt;

  ActorModelList(
      {this.id,
        this.firstName,
        this.lastName,
        this.gender,
        this.alsoKnowAs,
        this.placeOfBirth,
        this.categoryArtistId,
        this.dob,
        this.dod,
        this.profile,
        this.bio,
        this.countryCode,
        this.history,
        this.cover,
        this.facebook,
        this.twitter,
        this.instagram,
        this.youtube,
        this.website,
        this.createdAt,
        this.updatedAt});

  ActorModelList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    alsoKnowAs = json['also_know_as'];
    placeOfBirth = json['place_of_birth'];
    categoryArtistId = json['category_artist_id'];
    dob = json['dob'];
    dod = json['dod'];
    profile = json['profile'];
    bio = json['bio'];
    countryCode = json['country_code'];
    history = json['history'];
    cover = json['cover'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    youtube = json['youtube'];
    website = json['website'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['also_know_as'] = this.alsoKnowAs;
    data['place_of_birth'] = this.placeOfBirth;
    data['category_artist_id'] = this.categoryArtistId;
    data['dob'] = this.dob;
    data['dod'] = this.dod;
    data['profile'] = this.profile;
    data['bio'] = this.bio;
    data['country_code'] = this.countryCode;
    data['history'] = this.history;
    data['cover'] = this.cover;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['instagram'] = this.instagram;
    data['youtube'] = this.youtube;
    data['website'] = this.website;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
