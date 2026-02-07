

import 'dart:convert';

class ProviderdetailsModel {
  bool? status;
  String? msg;
  Data? data;
  List<Address>? address;
  int? review;
  String ?imagePath;

  ProviderdetailsModel({
    status,
    msg,
    data,
    address,
    review,
    imagePath,
  });

   ProviderdetailsModel.fromJson(Map<String, dynamic> json) {
     status=json["status"];
     msg= json["msg"];
     data=Data.fromJson(json["data"]);
     address=List<Address>.from(json["address"].map((x) => Address.fromJson(x)));
     review= json["review"];
     imagePath= json["image_path"];
   }


  Map<String, dynamic> toJson()  {
    final provider =<String,dynamic>{};
    provider["status"]= status;
    provider["msg"]= msg;
    provider["data"]= data!.toJson();
    provider["address"]=List<dynamic>.from(address!.map((x) => x.toJson()));
    provider["review"]=review;
    provider["image_path"]=imagePath;
    return provider;

  }
}

class Address {
  String adId;
  String adDescription;
  String adAddresses;
  String adLatitude;
  String adLongitude;
  DateTime created;
  dynamic updated;
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

class Data {
  String prosId;
  String prosName;
  String prosType;
  String prosEmployee;
  String prosPhone;
  String prosMobile;
  String prosAddress;
  String prosAvailRange;
  String prosTaxes;
  String prosDescription;
  String prosAccepted;
  String prosAvailable;
  String prosFeatured;
  String prosImage;
  String prosFiles;
  dynamic prosCreated;
  String prosUpdated;
  dynamic userLogId;
  var prosTime;
  dynamic checkallday;
  dynamic isDelete;
  String typeId;
  String providertypeName;
  String providertypeCommission;
  dynamic created;
  dynamic updated;
  dynamic disable;
  String taxesId;
  String taxesName;
  String taxesValue;
  String taxesType;

  Data({
    required this.prosId,
    required this.prosName,
    required this.prosType,
    required this.prosEmployee,
    required this.prosPhone,
    required this.prosMobile,
    required this.prosAddress,
    required this.prosAvailRange,
    required this.prosTaxes,
    required this.prosDescription,
    required this.prosAccepted,
    required this.prosAvailable,
    required this.prosFeatured,
    required this.prosImage,
    required this.prosFiles,
    required this.prosCreated,
    required this.prosUpdated,
    required this.userLogId,
    required this.prosTime,
    required this.checkallday,
    required this.isDelete,
    required this.typeId,
    required this.providertypeName,
    required this.providertypeCommission,
    required this.created,
    required this.updated,
    required this.disable,
    required this.taxesId,
    required this.taxesName,
    required this.taxesValue,
    required this.taxesType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    prosId: json["pros_id"],
    prosName: json["pros_name"],
    prosType: json["pros_type"],
    prosEmployee: json["pros_employee"],
    prosPhone: json["pros_phone"],
    prosMobile: json["pros_mobile"],
    prosAddress: json["pros_address"],
    prosAvailRange: json["pros_avail_range"],
    prosTaxes: json["pros_taxes"],
    prosDescription: json["pros_description"],
    prosAccepted: json["pros_accepted"],
    prosAvailable: json["pros_available"],
    prosFeatured: json["pros_featured"],
    prosImage: json["pros_image"],
    prosFiles: json["pros_files"],
    prosCreated: json["pros_created"],
    prosUpdated: json["pros_updated"],
    userLogId: json["user_log_id"],
    prosTime: jsonDecode(json["pros_time"]),
    checkallday: json["checkallday"],
    isDelete: json["is_delete"],
    typeId: json["type_id"],
    providertypeName: json["providertype_name"],
    providertypeCommission: json["providertype_commission"],
    created: json["created"],
    updated: json["updated"],
    disable: json["disable"],
    taxesId: json["taxes_id"],
    taxesName: json["taxes_name"],
    taxesValue: json["taxes_value"],
    taxesType: json["taxes_type"],
  );

  Map<String, dynamic> toJson() => {
    "pros_id": prosId,
    "pros_name": prosName,
    "pros_type": prosType,
    "pros_employee": prosEmployee,
    "pros_phone": prosPhone,
    "pros_mobile": prosMobile,
    "pros_address": prosAddress,
    "pros_avail_range": prosAvailRange,
    "pros_taxes": prosTaxes,
    "pros_description": prosDescription,
    "pros_accepted": prosAccepted,
    "pros_available": prosAvailable,
    "pros_featured": prosFeatured,
    "pros_image": prosImage,
    "pros_files": prosFiles,
    "pros_created": prosCreated,
    "pros_updated": prosUpdated,
    "user_log_id": userLogId,
    "pros_time": prosTime,
    "checkallday": checkallday,
    "is_delete": isDelete,
    "type_id": typeId,
    "providertype_name": providertypeName,
    "providertype_commission": providertypeCommission,
    "created": created,
    "updated": updated,
    "disable": disable,
    "taxes_id": taxesId,
    "taxes_name": taxesName,
    "taxes_value": taxesValue,
    "taxes_type": taxesType,
  };
}
