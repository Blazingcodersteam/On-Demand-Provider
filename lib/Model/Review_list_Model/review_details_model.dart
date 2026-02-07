class Reviewdetailsmodel {
  bool? status;
  String? msg;
  Data? data;

  Reviewdetailsmodel({this.status, this.msg, this.data});

  Reviewdetailsmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? reviewId;
  String? reviewCustomer;
  String? reviewService;
  String? reviewProvider;
  String? rating;
  String? reviewDesc;
  String? providerReply;
  String? createdAt;
  String? userLogId;
  String? isDelete;

  Data(
      {this.reviewId,
        this.reviewCustomer,
        this.reviewService,
        this.reviewProvider,
        this.rating,
        this.reviewDesc,
        this.providerReply,
        this.createdAt,
        this.userLogId,
        this.isDelete});

  Data.fromJson(Map<String, dynamic> json) {
    reviewId = json['review_id'];
    reviewCustomer = json['review_customer'];
    reviewService = json['review_service'];
    reviewProvider = json['review_provider'];
    rating = json['rating'];
    reviewDesc = json['review_desc'];
    providerReply = json['provider_reply'];
    createdAt = json['created_at'];
    userLogId = json['user_log_id'];
    isDelete = json['is_delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['review_id'] = this.reviewId;
    data['review_customer'] = this.reviewCustomer;
    data['review_service'] = this.reviewService;
    data['review_provider'] = this.reviewProvider;
    data['rating'] = this.rating;
    data['review_desc'] = this.reviewDesc;
    data['provider_reply'] = this.providerReply;
    data['created_at'] = this.createdAt;
    data['user_log_id'] = this.userLogId;
    data['is_delete'] = this.isDelete;
    return data;
  }
}
