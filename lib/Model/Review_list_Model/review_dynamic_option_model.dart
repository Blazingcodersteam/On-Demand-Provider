class Reviewdynamicoption {
  bool? status;
  String? msg;
  List<DynamicOption>? dynamicOption;

  Reviewdynamicoption({this.status, this.msg, this.dynamicOption});

  Reviewdynamicoption.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['dynamic_option'] != null) {
      dynamicOption = <DynamicOption>[];
      json['dynamic_option'].forEach((v) {
        dynamicOption!.add(DynamicOption.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['msg'] = msg;
    if (dynamicOption != null) {
      data['dynamic_option'] =
          dynamicOption!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DynamicOption {
  String? reviewStatusId;
  String? reviewStatus;
  String? reviewStatusCreated;

  DynamicOption(
      {this.reviewStatusId, this.reviewStatus, this.reviewStatusCreated});

  DynamicOption.fromJson(Map<String, dynamic> json) {
    reviewStatusId = json['review_status_id'];
    reviewStatus = json['review_status'];
    reviewStatusCreated = json['review_status_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['review_status_id'] = reviewStatusId;
    data['review_status'] = reviewStatus;
    data['review_status_created'] = reviewStatusCreated;
    return data;
  }
}
