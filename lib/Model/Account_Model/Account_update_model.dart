

class Accountupdatemodel {
  bool? status;
  Data? data;
  String? userId;
  String? msg;

  Accountupdatemodel({
    status,
    data,
    userId,
    msg,
  });

   Accountupdatemodel.fromJson(Map<String, dynamic> json) {
     status=json["status"];
     data= Data.fromJson(json["data"]);
     userId= json["user_id"];
     msg= json["msg"];
   }

  Map<String, dynamic> toJson()  {
    final provider =<String,dynamic>{};
    provider["status"] = status;
    provider["data"] = data!.toJson();
    provider["user_id"] = userId;
    provider["msg"] = msg;
return provider;
  }
}

class Data {
  String firstname;
  String lastname;
  String email;
  String mobileno;
  String userAvatar;
  String userAvatarBlob;
  String userBio;
  int role;
  dynamic deviceId;

  Data({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.mobileno,
    required this.userAvatar,
    required this.userAvatarBlob,
    required this.userBio,
    required this.role,
    required this.deviceId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    mobileno: json["mobileno"],
    userAvatar: json["user_avatar"],
    userAvatarBlob: json["user_avatar_blob"],
    userBio: json["user_bio"],
    role: json["role"],
    deviceId: json["device_id"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "mobileno": mobileno,
    "user_avatar": userAvatar,
    "user_avatar_blob": userAvatarBlob,
    "user_bio": userBio,
    "role": role,
    "device_id": deviceId,
  };
}
