

class CatagorieslistModel {
  bool? status;
  List<Datum>? data;
  String? msg;

  CatagorieslistModel({
    status,
    data,
   msg,
  });

   CatagorieslistModel.fromJson(Map<String, dynamic> json) {
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
  String categoryId;
  String categoryName;
  String slug;
  String categoryDescription;
  String categoryImage;
  String isHome;

  Datum({
    required this.categoryId,
    required this.categoryName,
    required this.slug,
    required this.categoryDescription,
    required this.categoryImage,
    required this.isHome,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    slug: json["slug"],
    categoryDescription: json["category_description"],
    categoryImage: json["category_image"],
    isHome: json["is_home"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "slug": slug,
    "category_description": categoryDescription,
    "category_image": categoryImage,
    "is_home": isHome,
  };
}
