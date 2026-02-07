

class ProviderdeleteModel {
  bool? status;
  String? msg;

  ProviderdeleteModel({
    status,
    msg,
  });

   ProviderdeleteModel.fromJson(Map<String, dynamic> json){
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
