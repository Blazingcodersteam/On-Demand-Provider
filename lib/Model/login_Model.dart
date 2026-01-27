

class LoginModel {
  bool? status;
  List<Datum>? data;
  int? providerInsertStatus;
  String? msg;

  LoginModel({
    status,
    data,
    providerInsertStatus,
    msg,
  });

   LoginModel.fromJson(Map<String, dynamic> json) {
    status= json["status"];
    if(json["data"]!=null) {
      data= List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)));
    }else{
      data=[];
    }
    providerInsertStatus= json["provider_insert_status"];
    msg= json["msg"];
  }

  Map<String, dynamic> toJson() {
    final provider =<String,dynamic>{};
    provider["status"]= status;
   if( data!=[] ) {
     provider[ "data"]= List<dynamic>.from(data!.map((x) => x.toJson()));
   }else{
     provider[ "data"]=[];
   }
    provider[ "provider_insert_status"]= providerInsertStatus;
    provider[ "msg"]= msg;

return provider;
  }
}

class Datum {
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

  Datum({
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
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
  };
}
