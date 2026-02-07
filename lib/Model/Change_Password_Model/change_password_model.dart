class Changepasswordmodel {
  bool? status;
  String? msg;

  Changepasswordmodel({status,msg});

  Changepasswordmodel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['msg'] = msg;
    return data;
  }
}
