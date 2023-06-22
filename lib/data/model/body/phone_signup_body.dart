
class AuthModel {
  String? phone;
  // ignore: non_constant_identifier_names
  String? phone_area;
  String? password;
  String? verification_code;
  String? name;

  AuthModel({this.phone, this.phone_area, this.password, this.verification_code, this.name});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['phone_code'] = this.phone_area;
    data['password'] = this.password;
    data['verification_code'] = this.verification_code;
    data['name'] = this.name;
    return data;
  }
}

class Auth {
  String? phone;
  String? phone_area;
  String? password;
  Auth({this.phone, this.phone_area, this.password});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['phone_code'] = this.phone_area;
    data['password'] = this.password;
    return data;
  }
}