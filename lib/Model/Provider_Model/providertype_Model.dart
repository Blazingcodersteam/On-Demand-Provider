

class ProvidersTypeModel {
  bool? status;
  List<Datum>? data;
  String? msg;

  ProvidersTypeModel({
   status,
   data,
    msg,

  });

   ProvidersTypeModel.fromJson(Map<String, dynamic> json) {
     status=json["status"];
     data= List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)));
     msg= json["msg"];
   }


  Map<String, dynamic> toJson() {
    final provider =<String,dynamic>{};
    provider["status"]= status;
    provider["data"]= List<dynamic>.from(data!.map((x) => x.toJson()));
    provider["msg"]= msg;
return provider;
  }
}

class Datum {
  String typeId;
  String providertypeName;
  String providertypeCommission;
  dynamic created;
  dynamic updated;
  dynamic disable;
  dynamic userLogId;

  Datum({
    required this.typeId,
    required this.providertypeName,
    required this.providertypeCommission,
    required this.created,
    required this.updated,
    required this.disable,
    required this.userLogId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    typeId: json["type_id"],
    providertypeName: json["providertype_name"],
    providertypeCommission: json["providertype_commission"],
    created: json["created"],
    updated: json["updated"],
    disable: json["disable"],
    userLogId: json["user_log_id"],
  );

  Map<String, dynamic> toJson() => {
    "type_id": typeId,
    "providertype_name": providertypeName,
    "providertype_commission": providertypeCommission,
    "created": created,
    "updated": updated,
    "disable": disable,
    "user_log_id": userLogId,
  };
}
