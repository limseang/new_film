
class DeviceInfo {
  String? deviceName;
  String? deviceToken;
  String? location;
  String? fcmToken;
  String? country;
  String? ipAddress;

  DeviceInfo({this.deviceName,this.deviceToken, this.location, this.fcmToken, this.country, this.ipAddress});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_name'] = this.deviceName;
    data['device_token'] = this.deviceToken;
    data['location'] = this.location;
    data['fcm_token'] = this.fcmToken;
    data['country'] = this.country;
    data['ip_address'] = this.ipAddress;
    return data;
  }
}
