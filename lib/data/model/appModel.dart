class appModel {
  String? message;
  Appversion? appversion;

  appModel({this.message, this.appversion});

  appModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    appversion = json['appversion'] != null
        ? new Appversion.fromJson(json['appversion'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.appversion != null) {
      data['appversion'] = this.appversion!.toJson();
    }
    return data;
  }
}

class Appversion {
  String? version;
  String? description;
  String? linkIos;
  String? linkAndroid;
  String? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  Appversion(
      {this.version,
        this.description,
        this.linkIos,
        this.linkAndroid,
        this.status,
        this.updatedAt,
        this.createdAt,
        this.id});

  Appversion.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    description = json['description'];
    linkIos = json['link_ios'];
    linkAndroid = json['link_android'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['description'] = this.description;
    data['link_ios'] = this.linkIos;
    data['link_android'] = this.linkAndroid;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
