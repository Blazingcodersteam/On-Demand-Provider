class Notificationcountmodel {
  bool? status;
  String? msg;
  int? notificationCount;

  Notificationcountmodel({this.status, this.msg, this.notificationCount});

  Notificationcountmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    notificationCount = json['notification_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['notification_count'] = this.notificationCount;
    return data;
  }
}
