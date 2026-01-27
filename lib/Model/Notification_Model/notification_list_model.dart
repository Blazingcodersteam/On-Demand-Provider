class Notificationlistmodel {
  bool? status;
  String? msg;
  List<Data>? data;

  Notificationlistmodel({this.status, this.msg, this.data});

  Notificationlistmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? notificationId;
  String? notificationType;
  String? bookingId;
  String? reviewId;
  String? serviceId;
  String? providerId;
  String? message;
  String? senderUserId;
  String? senderUserName;
  String? senderProfilePic;
  String? receiverUserId;
  String? receiverUserName;
  String? receiverProfilePic;

  Data(
      {this.notificationId,
        this.notificationType,
        this.bookingId,
        this.reviewId,
        this.serviceId,
        this.providerId,
        this.message,
        this.senderUserId,
        this.senderUserName,
        this.senderProfilePic,
        this.receiverUserId,
        this.receiverUserName,
        this.receiverProfilePic});

  Data.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationType = json['notification_type'];
    bookingId = json['booking_id'];
    reviewId = json['review_id'];
    serviceId = json['service_id'];
    providerId = json['provider_id'];
    message = json['message'];
    senderUserId = json['sender_user_id'];
    senderUserName = json['sender_user_name'];
    senderProfilePic = json['sender_profile_pic'];
    receiverUserId = json['receiver_user_id'];
    receiverUserName = json['receiver_user_name'];
    receiverProfilePic = json['receiver_profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['notification_type'] = this.notificationType;
    data['booking_id'] = this.bookingId;
    data['review_id'] = this.reviewId;
    data['service_id'] = this.serviceId;
    data['provider_id'] = this.providerId;
    data['message'] = this.message;
    data['sender_user_id'] = this.senderUserId;
    data['sender_user_name'] = this.senderUserName;
    data['sender_profile_pic'] = this.senderProfilePic;
    data['receiver_user_id'] = this.receiverUserId;
    data['receiver_user_name'] = this.receiverUserName;
    data['receiver_profile_pic'] = this.receiverProfilePic;
    return data;
  }
}
