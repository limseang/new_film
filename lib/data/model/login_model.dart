class LoginModel {
  int? status;
  String? message;
  userLogin? user;
  String? token;

  LoginModel({this.status, this.message, this.user, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new userLogin.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class userLogin {
  int? id;
  String? name;
  String? email;
  Null? avatar;
  Null? emailVerifiedAt;
  int? roleId;
  String? password;
  String? point;
  Null? googleId;
  String? createdAt;
  String? updatedAt;

  userLogin(
      {this.id,
        this.name,
        this.email,
        this.avatar,
        this.emailVerifiedAt,
        this.roleId,
        this.password,
        this.point,
        this.googleId,
        this.createdAt,
        this.updatedAt});

  userLogin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    emailVerifiedAt = json['email_verified_at'];
    roleId = json['role_id'];
    password = json['password'];
    point = json['point'];
    googleId = json['google_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role_id'] = this.roleId;
    data['password'] = this.password;
    data['point'] = this.point;
    data['google_id'] = this.googleId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
