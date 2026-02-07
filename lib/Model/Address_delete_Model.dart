
class Addressdeletemodel {
  bool? status;
  Data? data;
  String? msg;
  Addressdeletemodel({
 status,
 data,
 msg,
  });
  Addressdeletemodel.fromJson(Map<String, dynamic> json) {
     status= json["status"];
     data= Data.fromJson(json["data"]);
     msg= json["msg"];
   }
  Map<String, dynamic> toJson()  {
    final provider =<String,dynamic>{};
    provider["status"]= status;
    provider["data"]= data!.toJson();
    provider["msg"]= msg;
    return provider;
  }
}
class Data {
  int isDelete;
  String userLogId;

  Data({
    required this.isDelete,
    required this.userLogId,
  });
  factory Data.fromJson(Map<String, dynamic> json) => Data(
    isDelete: json["is_delete"],
    userLogId: json["user_log_id"],
  );
  Map<String, dynamic> toJson() => {
    "is_delete": isDelete,
    "user_log_id": userLogId,
  };
}
