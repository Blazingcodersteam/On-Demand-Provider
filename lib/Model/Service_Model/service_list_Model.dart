
class Servicelistmodel {
  bool? status;
  List<Map<String, String?>>? data;
  String? serviceImgPath;
  int? service_insert_status;
  String ?msg;
  int? review;

  Servicelistmodel({
    status,
    data,
    serviceImgPath,
    service_insert_status,
    msg,
    review,
  });

   Servicelistmodel.fromJson(Map<String, dynamic> json) {
     status=json["status"];
     data= (json["data"]!=null)?List<Map<String, String?>>.from(json["data"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))):[];
     serviceImgPath= json["service_img_path"];
     msg= json["msg"];
     review= json["review"];
     service_insert_status= json["service_insert_status"];

   }


  Map<String, dynamic> toJson()  {
    final provider =<String,dynamic>{};
    provider["status"]= status;
    provider["data"]= List<dynamic>.from(data!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v))));
    provider["service_img_path"]= serviceImgPath;
    provider["msg"]= msg;
    provider["review"]= review;
    provider["service_insert_status"]= service_insert_status;
    return provider;
  }
}
