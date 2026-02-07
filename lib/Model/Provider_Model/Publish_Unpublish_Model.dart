

class PublishUnpublishmodel {
  bool? status;
  String? msg;

  PublishUnpublishmodel({
   status,
    msg,
  });

 PublishUnpublishmodel.fromJson(Map<String, dynamic> json){
   status= json["status"];
   msg= json["msg"];
 }

  Map<String, dynamic> toJson()  {
    final provider =<String,dynamic>{};
    provider["status"]= status;
    provider["msg"]= msg;
    return provider;

  }
}
