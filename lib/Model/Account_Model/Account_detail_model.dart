

class Accountdetailmodel {
  bool? status;
  Data ?data;
  String? imagePath;
  String? msg;

  Accountdetailmodel({
    status,
  data,
    imagePath,
    msg,
  });

   Accountdetailmodel.fromJson(Map<String, dynamic> json) {
     status= json["status"];
     data= Data.fromJson(json["data"]);
     imagePath= json["image_path"];
     msg= json["msg"];
   }


  Map<String, dynamic> toJson()  {
  final provider =<String,dynamic>{};
  provider["status"]= status;
  provider["data"]= data!.toJson();
  provider["image_path"]= imagePath;
  provider["msg"]= msg;
  return provider;
  }
}

class Data {
  String userId;
  String firstname;
  String lastname;
  String email;
  String password;
  String mobileno;
  String userAvatar;
  String userAvatarBlob;
  String userBio;
  String role;
  dynamic agree;
  String active;
  dynamic deviceId;
  String trainerApprove;
  String created;
  dynamic updated;
  String isDelete;

  Data({
    required this.userId,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.mobileno,
    required this.userAvatar,
    required this.userAvatarBlob,
    required this.userBio,
    required this.role,
    required this.agree,
    required this.active,
    required this.deviceId,
    required this.trainerApprove,
    required this.created,
    required this.updated,
    required this.isDelete,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    password: json["password"],
    mobileno: json["mobileno"],
    userAvatar: json["user_avatar"],
    userAvatarBlob: json["user_avatar_blob"],
    userBio: json["user_bio"],
    role: json["role"],
    agree: json["agree"],
    active: json["active"],
    deviceId: json["device_id"],
    trainerApprove: json["trainer_approve"],
    created: json["created"],
    updated: json["updated"],
    isDelete: json["is_delete"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "password": password,
    "mobileno": mobileno,
    "user_avatar": userAvatar,
    "user_avatar_blob": userAvatarBlob,
    "user_bio": userBio,
    "role": role,
    "agree": agree,
    "active": active,
    "device_id": deviceId,
    "trainer_approve": trainerApprove,
    "created": created,
    "updated": updated,
    "is_delete": isDelete,
  };
}
