

class Imagedeletemodel {
  bool? status;
  String? msg;

  Imagedeletemodel({
    status,
    msg,
  });

   Imagedeletemodel.fromJson(Map<String, dynamic> json){
     status=json["status"];
     msg= json["msg"];
     }
  Map<String, dynamic> toJson()  {
    final provider =<String,dynamic>{};
    provider["status"]= status;
    provider["msg"]= msg;
    return provider;
  }
}
