class SubCatogoriesListModel {
  bool? status;
  String? msg;
  Data? data;

  SubCatogoriesListModel({this.status, this.msg, this.data});

  SubCatogoriesListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<CategoryData>? categoryData;
  List<SubCategoryData>? subCategoryData;
  List<ChildCategoryData>? childCategoryData;

  Data({this.categoryData, this.subCategoryData, this.childCategoryData});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['category_data'] != null) {
      categoryData = <CategoryData>[];
      json['category_data'].forEach((v) {
        categoryData!.add(CategoryData.fromJson(v));
      });
    }
    if (json['sub_category_data'] != null) {
      subCategoryData = <SubCategoryData>[];
      json['sub_category_data'].forEach((v) {
        subCategoryData!.add(SubCategoryData.fromJson(v));
      });
    }
    if (json['child_category_data'] != null) {
      childCategoryData = <ChildCategoryData>[];
      json['child_category_data'].forEach((v) {
        childCategoryData!.add(ChildCategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categoryData != null) {
      data['category_data'] =
          categoryData!.map((v) => v.toJson()).toList();
    }
    if (subCategoryData != null) {
      data['sub_category_data'] =
          subCategoryData!.map((v) => v.toJson()).toList();
    }
    if (childCategoryData != null) {
      data['child_category_data'] =
          childCategoryData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryData {
  String? categoryId;
  String? categoryName;
  String? categoryDescription;
  String? categoryImage;
  String? isHome;
  String? isDelete;
  String? userLogId;
  String? created;
  String? updated;

  CategoryData(
      {this.categoryId,
        this.categoryName,
        this.categoryDescription,
        this.categoryImage,
        this.isHome,
        this.isDelete,
        this.userLogId,
        this.created,
        this.updated});

  CategoryData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryDescription = json['category_description'];
    categoryImage = json['category_image'];
    isHome = json['is_home'];
    isDelete = json['is_delete'];
    userLogId = json['user_log_id'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_description'] = categoryDescription;
    data['category_image'] = categoryImage;
    data['is_home'] = isHome;
    data['is_delete'] = isDelete;
    data['user_log_id'] = userLogId;
    data['created'] = created;
    data['updated'] = updated;
    return data;
  }
}

class SubCategoryData {
  String? subCatId;
  String? categoryId;
  String? subCatName;
  String? subCatDescription;
  String? subCatImage;
  String? isDelete;
  String? created;
  String? updated;

  SubCategoryData(
      {this.subCatId,
        this.categoryId,
        this.subCatName,
        this.subCatDescription,
        this.subCatImage,
        this.isDelete,
        this.created,
        this.updated});

  SubCategoryData.fromJson(Map<String, dynamic> json) {
    subCatId = json['sub_cat_id'];
    categoryId = json['category_id'];
    subCatName = json['sub_cat_name'];
    subCatDescription = json['sub_cat_description'];
    subCatImage = json['sub_cat_image'];
    isDelete = json['is_delete'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_cat_id'] = subCatId;
    data['category_id'] = categoryId;
    data['sub_cat_name'] = subCatName;
    data['sub_cat_description'] = subCatDescription;
    data['sub_cat_image'] = subCatImage;
    data['is_delete'] = isDelete;
    data['created'] = created;
    data['updated'] = updated;
    return data;
  }
}

class ChildCategoryData {
  String? childCatId;
  String? catId;
  String? subCatId;
  String? childCatName;
  String? childCatDescription;
  String? childCatImage;
  String? isDelete;
  String? created;
  String? updated;

  ChildCategoryData(
      {this.childCatId,
        this.catId,
        this.subCatId,
        this.childCatName,
        this.childCatDescription,
        this.childCatImage,
        this.isDelete,
        this.created,
        this.updated});

  ChildCategoryData.fromJson(Map<String, dynamic> json) {
    childCatId = json['child_cat_id'];
    catId = json['cat_id'];
    subCatId = json['sub_cat_id'];
    childCatName = json['child_cat_name'];
    childCatDescription = json['child_cat_description'];
    childCatImage = json['child_cat_image'];
    isDelete = json['is_delete'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['child_cat_id'] = childCatId;
    data['cat_id'] = catId;
    data['sub_cat_id'] = subCatId;
    data['child_cat_name'] = childCatName;
    data['child_cat_description'] = childCatDescription;
    data['child_cat_image'] = childCatImage;
    data['is_delete'] = isDelete;
    data['created'] = created;
    data['updated'] = updated;
    return data;
  }
}
