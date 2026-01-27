// To parse this JSON data, do
//
//     final addressaddModel = addressaddModelFromJson(jsonString);



class AddressaddModel {
  bool? status;
  Data? data;
  String? msg;

  AddressaddModel({
    status,
    data,
   msg,
  });

   AddressaddModel.fromJson(Map<String, dynamic> json) {
     status=json["status"];
     data= Data.fromJson(json["data"]);
     msg= json["msg"];
   }


  Map<String, dynamic> toJson()  {
    final provider =<String,dynamic>{};
    provider["status"]= status;
    provider["data"]=data!.toJson();
    provider["msg"]=msg;
    return provider;
  }
}

class Data {
  String adDescription;
  String adAddresses;
  String adLatitude;
  String adLongitude;
  String adArea;
  String adCity;
  String adDistrict;
  String adState;
  String adPincode;
  String userLogId;


  Data({
    required this.adDescription,
    required this.adAddresses,
    required this.adLatitude,
    required this.adLongitude,
    required this.adArea,
    required this.adCity,
    required this.adDistrict,
    required this.adState,
    required this.adPincode,
    required this.userLogId,

  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    adDescription: json["ad_description"],
    adAddresses: json["ad_addresses"],
    adLatitude: json["ad_latitude"],
    adLongitude: json["ad_longitude"],
    adArea: json["ad_area"],
    adCity: json["ad_city"],
    adDistrict: json["ad_district"],
    adState: json["ad_state"],
    adPincode: json["ad_pincode"],
    userLogId: json["user_log_id"],

  );

  Map<String, dynamic> toJson() => {
    "ad_description": adDescription,
    "ad_addresses": adAddresses,
    "ad_latitude": adLatitude,
    "ad_longitude": adLongitude,
    "ad_area": adArea,
    "ad_city": adCity,
    "ad_district": adDistrict,
    "ad_state": adState,
    "ad_pincode": adPincode,
    "user_log_id": userLogId,

  };
}
