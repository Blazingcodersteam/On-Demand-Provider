class Reviewlistmodel {
  bool? status;
  String? msg;
  Data? data;

  Reviewlistmodel({status, msg, data});

  Reviewlistmodel.fromJson(Map<String, dynamic> json) {
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
  List<ReviewData>? reviewData;
  ReviewAnalytics? reviewAnalytics;

  Data({this.reviewData, this.reviewAnalytics});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['review_data'] != null) {
      reviewData = <ReviewData>[];
      json['review_data'].forEach((v) {
        reviewData!.add(new ReviewData.fromJson(v));
      });
    }
    reviewAnalytics = json['review_analytics'] != null
        ? new ReviewAnalytics.fromJson(json['review_analytics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reviewData != null) {
      data['review_data'] = this.reviewData!.map((v) => v.toJson()).toList();
    }
    if (this.reviewAnalytics != null) {
      data['review_analytics'] = this.reviewAnalytics!.toJson();
    }
    return data;
  }
}

class ReviewData {
  String? reviewId;
  String? customerId;
  String? providerId;
  String? serviceId;
  String? description;
  String? rating;
  String? customerImage;
  String? customerName;
  String? serviceName;
  String? serviceImage;
  String? address;
  String? createDate;

  ReviewData(
      {this.reviewId,
        this.customerId,
        this.providerId,
        this.serviceId,
        this.description,
        this.rating,
        this.customerImage,
        this.customerName,
        this.serviceName,
        this.serviceImage,
        this.address,
        this.createDate});

  ReviewData.fromJson(Map<String, dynamic> json) {
    reviewId = json['review_id'];
    customerId = json['customer_id'];
    providerId = json['provider_id'];
    serviceId = json['service_id'];
    description = json['description'];
    rating = json['rating'];
    customerImage = json['customer_image'];
    customerName = json['customer_name'];
    serviceName = json['service_name'];
    serviceImage = json['service_image'];
    address = json['address'];
    createDate = json['create_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['review_id'] = this.reviewId;
    data['customer_id'] = this.customerId;
    data['provider_id'] = this.providerId;
    data['service_id'] = this.serviceId;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['customer_image'] = this.customerImage;
    data['customer_name'] = this.customerName;
    data['service_name'] = this.serviceName;
    data['service_image'] = this.serviceImage;
    data['address'] = this.address;
    data['create_date'] = this.createDate;
    return data;
  }
}

class ReviewAnalytics {
  int? totalReview;
  int? reviewPercentage;

  ReviewAnalytics({this.totalReview, this.reviewPercentage});

  ReviewAnalytics.fromJson(Map<String, dynamic> json) {
    totalReview = json['total_review'];
    reviewPercentage = json['review_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_review'] = this.totalReview;
    data['review_percentage'] = this.reviewPercentage;
    return data;
  }
}
