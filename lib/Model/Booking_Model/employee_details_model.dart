class EmployeeDetailsModel {
  bool? status;
  String? msg;
  List<Data>? data;

  EmployeeDetailsModel({this.status, this.msg, this.data});

  EmployeeDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? userId;
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? mobileno;
  String? userAvatar;
  String? userAvatarBlob;
  String? userBio;
  String? role;
  Null? agree;
  String? active;
  String? deviceId;
  String? userLogId;
  String? created;
  Null? updated;
  String? isDelete;
  Null? trainerApprove;
  String? employeeProsId;
  String? employeeStatus;

  Data(
      {this.userId,
        this.firstname,
        this.lastname,
        this.email,
        this.password,
        this.mobileno,
        this.userAvatar,
        this.userAvatarBlob,
        this.userBio,
        this.role,
        this.agree,
        this.active,
        this.deviceId,
        this.userLogId,
        this.created,
        this.updated,
        this.isDelete,
        this.trainerApprove,
        this.employeeProsId,
        this.employeeStatus});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
    mobileno = json['mobileno'];
    userAvatar = json['user_avatar'];
    userAvatarBlob = json['user_avatar_blob'];
    userBio = json['user_bio'];
    role = json['role'];
    agree = json['agree'];
    active = json['active'];
    deviceId = json['device_id'];
    userLogId = json['user_log_id'];
    created = json['created'];
    updated = json['updated'];
    isDelete = json['is_delete'];
    trainerApprove = json['trainer_approve'];
    employeeProsId = json['employee_pros_id'];
    employeeStatus = json['employee_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['password'] = this.password;
    data['mobileno'] = this.mobileno;
    data['user_avatar'] = this.userAvatar;
    data['user_avatar_blob'] = this.userAvatarBlob;
    data['user_bio'] = this.userBio;
    data['role'] = this.role;
    data['agree'] = this.agree;
    data['active'] = this.active;
    data['device_id'] = this.deviceId;
    data['user_log_id'] = this.userLogId;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['is_delete'] = this.isDelete;
    data['trainer_approve'] = this.trainerApprove;
    data['employee_pros_id'] = this.employeeProsId;
    data['employee_status'] = this.employeeStatus;
    return data;
  }
}
