
class AddressList {
  bool? status;
  List<Datum>? data;
  String? msg;

  AddressList({
    status,
    data,
    msg,
  });

   AddressList.fromJson(Map<String, dynamic> json){
    status=json["status"];
    if(json["data"]!=[]) {
      data= List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)));
    }else{
      data=[];
    }
    msg= json["msg"];
  }


  Map<String, dynamic> toJson() {
    final provider =<String,dynamic>{};
    provider["status"]= status;
    if(data!=[]) {
      provider["data"]=List<dynamic>.from(data!.map((x) => x.toJson()));
    }else{
      provider["data"]=[];
    }
    provider["msg"]=msg;
    return provider;
  }
}

class Datum {
  String adId;
  String adDescription;
  String adAddresses;
  String adLatitude;
  String adLongitude;
  String userLogId;
  DateTime created;
  String updated;
  String isdelete;

  Datum({
    required this.adId,
    required this.adDescription,
    required this.adAddresses,
    required this.adLatitude,
    required this.adLongitude,
    required this.userLogId,
    required this.created,
    required this.updated,
    required this.isdelete,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    adId: json["ad_id"],
    adDescription: json["ad_description"],
    adAddresses: json["ad_addresses"],
    adLatitude: json["ad_latitude"],
    adLongitude: json["ad_longitude"],
    userLogId: json["user_log_id"],
    created: DateTime.parse(json["created"]),
    updated: json["updated"],
    isdelete: json["is_delete"],
  );

  Map<String, dynamic> toJson() => {
    "ad_id": adId,
    "ad_description": adDescription,
    "ad_addresses": adAddresses,
    "ad_latitude": adLatitude,
    "ad_longitude": adLongitude,
    "user_log_id": userLogId,
    "created": created.toIso8601String(),
    "updated": updated,
    "is_delete": isdelete,
  };
}
