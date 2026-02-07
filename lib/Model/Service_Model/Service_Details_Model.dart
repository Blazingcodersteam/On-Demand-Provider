// To parse this JSON data, do
//


class Servicedetailsmodel {
  bool? status;
  Map<String, String?>? data;
  int? review;
  String? serviceImgPath;
  String? reviwer_name;
  String? reviwer_image;
  String? reviwer_msg;
  String? categoryImgPath;
  String? msg;
  Servicedetailsmodel({
    status,
    data,
    review,
    serviceImgPath,
    reviwer_name,
    reviwer_image,
    reviwer_msg,
    categoryImgPath,
    msg,
  });
  Servicedetailsmodel.fromJson(Map<String, dynamic> json){
    status=json["status"];
    data= Map.from(json["data"]).map((k, v) => MapEntry<String, String?>(k, v));
    review= json["review"];
    reviwer_name= json["reviwer_name"];
    reviwer_image= json["reviwer_image"];
    reviwer_msg= json["reviwer_msg"];
    serviceImgPath= json["service_img_path"];
    categoryImgPath= json["category_img_path"];
    msg= json["msg"];
  }
  Map<String, dynamic> toJson() {
  final provider =<String,dynamic>{};
  provider["status"]= status;
  provider["data"]= Map.from(data!).map((k, v) => MapEntry<String, dynamic>(k, v));
  provider["review"]= review;
  provider["reviwer_image"]= reviwer_image;
  provider["reviwer_name"]= reviwer_name;
  provider["reviwer_msg"]= reviwer_msg;
  provider["service_img_path"]= serviceImgPath;
  provider["category_img_path"]= categoryImgPath;
  provider["msg"]= msg;
  return provider;
  }
}
