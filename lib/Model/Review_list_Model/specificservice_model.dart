class Specificservicereviewmodel {
  bool? status;
  String? msg;
  Data? data;

  Specificservicereviewmodel({this.status, this.msg, this.data});

  Specificservicereviewmodel.fromJson(Map<String, dynamic> json) {
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
  ReviewStatusDynamic? reviewStatusDynamic;
  String? serviceId;
  String? providerId;
  ServiceReviews? serviceReviews;

  Data(
      {this.reviewStatusDynamic,
        this.serviceId,
        this.providerId,
        this.serviceReviews});

  Data.fromJson(Map<String, dynamic> json) {
    reviewStatusDynamic = json['review_status_dynamic'] != null
        ? ReviewStatusDynamic.fromJson(json['review_status_dynamic'])
        : null;
    serviceId = json['service_id'];
    providerId = json['provider_id'];
    serviceReviews = json['service_reviews'] != null
        ? ServiceReviews.fromJson(json['service_reviews'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reviewStatusDynamic != null) {
      data['review_status_dynamic'] = reviewStatusDynamic!.toJson();
    }
    data['service_id'] = serviceId;
    data['provider_id'] = providerId;
    if (serviceReviews != null) {
      data['service_reviews'] = serviceReviews!.toJson();
    }
    return data;
  }
}

class ReviewStatusDynamic {
  String? veryBad;
  String? bad;
  String? good;
  String? veryGood;
  String? excellent;
  String? all;

  ReviewStatusDynamic(
      {this.veryBad,
        this.bad,
        this.good,
        this.veryGood,
        this.excellent,
        this.all});

  ReviewStatusDynamic.fromJson(Map<String, dynamic> json) {
    veryBad = json['Very Bad'];
    bad = json['Bad'];
    good = json['Good'];
    veryGood = json['Very good'];
    excellent = json['Excellent'];
    all = json['All'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Very Bad'] = veryBad;
    data['Bad'] = bad;
    data['Good'] = good;
    data['Very good'] = veryGood;
    data['Excellent'] = excellent;
    data['All'] = all;
    return data;
  }
}

class ServiceReviews {
  int? rating;
  int? reviewCount;
  List<AllReviwers>? allReviwers;

  ServiceReviews({this.rating, this.reviewCount, this.allReviwers});

  ServiceReviews.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    reviewCount = json['review_count'];
    if (json['all_reviwers'] != null) {
      allReviwers = <AllReviwers>[];
      json['all_reviwers'].forEach((v) {
        allReviwers!.add(AllReviwers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['review_count'] = reviewCount;
    if (allReviwers != null) {
      data['all_reviwers'] = allReviwers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllReviwers {
  String? userName;
  String? userCmt;
  String? userImage;
  String? rated;
  String? reviewId;
  String? provider_reply;

  AllReviwers(
      {this.userName, this.userCmt, this.userImage, this.rated, this.reviewId,this.provider_reply});

  AllReviwers.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    userCmt = json['user_cmt'];
    userImage = json['user_image'];
    rated = json['rated'];
    reviewId = json['review_id'];
    provider_reply = json['provider_reply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_name'] = userName;
    data['user_cmt'] = userCmt;
    data['user_image'] = userImage;
    data['rated'] = rated;
    data['review_id'] = reviewId;
    data['provider_reply'] = provider_reply;
    return data;
  }
}
