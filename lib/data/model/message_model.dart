class MessageData {
  String? msgText, userid, type;
  String? msg;
  String? date;
  int? toUserId;
  String? time;
  int? isMe;
  MessageData(
      {this.msgText,
      this.userid,
      this.isMe,
      this.msg,
      this.toUserId,
      this.date,
      this.time,
      this.type = "text"});

  MessageData.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    date = json['date'];
    time = json['time'];
    isMe = json['isMe'];
    toUserId = json['toUserId'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['date'] = this.date;
    data['time'] = this.time;
    data['toUserId'] = this.toUserId;
    return data;
  }
}
