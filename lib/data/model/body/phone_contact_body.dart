

class PhoneContact {
  String? phone;
  String? phoneCode;

  PhoneContact({this.phone,this.phoneCode});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['phone_code'] = this.phoneCode;
    return data;
  }
}
