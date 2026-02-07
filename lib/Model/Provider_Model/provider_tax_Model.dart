

class ProvidertaxModel {
  bool ?status;
  List<Datum>? data;
  String ?msg;

  ProvidertaxModel({
   status,
    data,
   msg,
  });

   ProvidertaxModel.fromJson(Map<String, dynamic> json) {
     status=json["status"];
     data= List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)));
     msg= json["msg"];
   }


  Map<String, dynamic> toJson() {
    final provider =<String,dynamic>{};
    provider["status"]=status;
    provider["data"]=List<dynamic>.from(data!.map((x) => x.toJson()));
    provider["msg"]=msg;
    return provider;

  }
}

class Datum {
  String taxesId;
  String taxesName;
  String taxesValue;
  String taxesType;
  DateTime created;
  dynamic updated;

  Datum({
    required this.taxesId,
    required this.taxesName,
    required this.taxesValue,
    required this.taxesType,
    required this.created,
    required this.updated,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    taxesId: json["taxes_id"],
    taxesName: json["taxes_name"],
    taxesValue: json["taxes_value"],
    taxesType: json["taxes_type"],
    created: DateTime.parse(json["created"]),
    updated: json["updated"],
  );

  Map<String, dynamic> toJson() => {
    "taxes_id": taxesId,
    "taxes_name": taxesName,
    "taxes_value": taxesValue,
    "taxes_type": taxesType,
    "created": created.toIso8601String(),
    "updated": updated,
  };
}
