class Verifymailmodel {
  bool? status;
  String? msg;
  int? data;

  Verifymailmodel({this.status, this.msg, this.data});

  Verifymailmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    data['data'] = this.data;
    return data;
  }
}
