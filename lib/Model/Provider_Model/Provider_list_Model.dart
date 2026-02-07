

class ProviderlistModel {
  bool? status;
  String? msg;
  List<Datum> ?data;
  int? provider_insert_status;

  ProviderlistModel({
    status,
    msg,
    data,
    provider_insert_status
  });

   ProviderlistModel.fromJson(Map<String, dynamic> json){
     status=json["status"];
     msg= json["msg"];
     provider_insert_status= json["provider_insert_status"];
     if(json["data"]!=null) {
       data= List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)));
     }else{
       data=[];
     }
   }

  Map<String, dynamic> toJson()  {
    final provider =<String,dynamic>{};
    provider["status"]= status;
    provider["msg"]= msg;
    provider["provider_insert_status"]= provider_insert_status;
    provider["data"]= List<dynamic>.from(data!.map((x) => x.toJson()));
    return provider;
  }
}

class Datum {
  String prosId;
  String publish_status;

  List<String> prosFiles;
  dynamic userLogId;
  String prosName;
  String prosType;
  String providertypeName;
  String providertypeCommission;
  String prosEmployee;
  String prosPhone;
  String prosMobile;
  String prosAddress;
  String prosAvailRange;
  String prosTaxes;
  String taxesName;
  String taxesValue;
  String taxesType;
  String prosDescription;
  String prosAvailable;
  String prosAccepted;
  String prosFeatured;
  DateTime prosCreated;
  String prosUpdated;
  String prosTime;
  List<Address> address;
  int review;

  Datum({
    required this.prosId,
    required this.publish_status,
    required this.prosFiles,
    required this.userLogId,
    required this.prosName,
    required this.prosType,
    required this.providertypeName,
    required this.providertypeCommission,
    required this.prosEmployee,
    required this.prosPhone,
    required this.prosMobile,
    required this.prosAddress,
    required this.prosAvailRange,
    required this.prosTaxes,
    required this.taxesName,
    required this.taxesValue,
    required this.taxesType,
    required this.prosDescription,
    required this.prosAvailable,
    required this.prosAccepted,
    required this.prosFeatured,
    required this.prosCreated,
    required this.prosUpdated,
    required this.prosTime,
    required this.address,
    required this.review,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    prosId: json["pros_id"],
    publish_status: json["publish_status"],
    prosFiles: List<String>.from(json["pros_files"].map((x) => x)),
    userLogId: json["user_log_id"],
    prosName: json["pros_name"],
    prosType: json["pros_type"],
    providertypeName: json["providertype_name"],
    providertypeCommission: json["providertype_commission"],
    prosEmployee: json["pros_employee"],
    prosPhone: json["pros_phone"],
    prosMobile: json["pros_mobile"],
    prosAddress: json["pros_address"],
    prosAvailRange: json["pros_avail_range"],
    prosTaxes: json["pros_taxes"],
    taxesName: json["taxes_name"],
    taxesValue: json["taxes_value"],
    taxesType: json["taxes_type"],
    prosDescription: json["pros_description"],
    prosAvailable: json["pros_available"],
    prosAccepted: json["pros_accepted"],
    prosFeatured: json["pros_featured"],
    prosCreated: DateTime.parse(json["pros_created"]),
    prosUpdated: json["pros_updated"],
    prosTime: json["pros_time"],
    address: List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
    review: json["review"],
  );

  Map<String, dynamic> toJson() => {
    "pros_id": prosId,
    "publish_status": publish_status,
    "pros_files": List<dynamic>.from(prosFiles.map((x) => x)),
    "user_log_id": userLogId,
    "pros_name": prosName,
    "pros_type": prosType,
    "providertype_name": providertypeName,
    "providertype_commission": providertypeCommission,
    "pros_employee": prosEmployee,
    "pros_phone": prosPhone,
    "pros_mobile": prosMobile,
    "pros_address": prosAddress,
    "pros_avail_range": prosAvailRange,
    "pros_taxes": prosTaxes,
    "taxes_name": taxesName,
    "taxes_value": taxesValue,
    "taxes_type": taxesType,
    "pros_description": prosDescription,
    "pros_available": prosAvailable,
    "pros_accepted": prosAccepted,
    "pros_featured": prosFeatured,
    "pros_created": prosCreated.toIso8601String(),
    "pros_updated": prosUpdated,
    "pros_time": prosTime,
    "address": List<dynamic>.from(address.map((x) => x.toJson())),
    "review": review,
  };
}

class Address {
  String adId;
  String adDescription;
  String adAddresses;
  String adLatitude;
  String adLongitude;
  DateTime created;
  String updated;
  String userLogId;

  Address({
    required this.adId,
    required this.adDescription,
    required this.adAddresses,
    required this.adLatitude,
    required this.adLongitude,
    required this.created,
    required this.updated,
    required this.userLogId,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    adId: json["ad_id"],
    adDescription: json["ad_description"],
    adAddresses: json["ad_addresses"],
    adLatitude: json["ad_latitude"],
    adLongitude: json["ad_longitude"],
    created: DateTime.parse(json["created"]),
    updated: json["updated"],
    userLogId: json["user_log_id"],
  );

  Map<String, dynamic> toJson() => {
    "ad_id": adId,
    "ad_description": adDescription,
    "ad_addresses": adAddresses,
    "ad_latitude": adLatitude,
    "ad_longitude": adLongitude,
    "created": created.toIso8601String(),
    "updated": updated,
    "user_log_id": userLogId,
  };
}
