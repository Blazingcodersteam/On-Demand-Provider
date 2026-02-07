class Bookingmodel {
  bool? status;
  String? msg;
  List<Data>? data;

  Bookingmodel({status,msg,data});

  Bookingmodel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? providerId;
  String? serviceId;
  String? serviceName;
  String? serviceImage;
  String? customerId;
  String? customerName;
  String? customerImage;
  String? bookingId;
  String? address;
  String? bookingTime;
  String? bookingDay;
  String? bookingDate;
  String? bookedDate;
  String? paymentStatus;
  String? totalAmount;

  Data(
      {this.providerId,
        this.serviceId,
        this.serviceName,
        this.serviceImage,
        this.customerId,
        this.customerName,
        this.customerImage,
        this.bookingId,
        this.address,
        this.bookingTime,
        this.bookingDay,
        this.bookingDate,
        this.bookedDate,
        this.paymentStatus,
        this.totalAmount});

  Data.fromJson(Map<String, dynamic> json) {
    providerId = json['provider_id'];
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    serviceImage = json['service_image'];
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    customerImage = json['customer_image'];
    bookingId = json['booking_id'];
    address = json['address'];
    bookingTime = json['booking_time'];
    bookingDay = json['booking_day'];
    bookingDate = json['booking_date'];
    bookedDate = json['booked_date'];
    paymentStatus = json['payment_status'];
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['provider_id'] = providerId;
    data['service_id'] = serviceId;
    data['service_name'] = serviceName;
    data['service_image'] = serviceImage;
    data['customer_id'] = customerId;
    data['customer_name'] = customerName;
    data['customer_image'] = customerImage;
    data['booking_id'] = bookingId;
    data['address'] = address;
    data['booking_time'] = bookingTime;
    data['booking_day'] = bookingDay;
    data['booking_date'] = bookingDate;
    data['booked_date'] = bookedDate;
    data['payment_status'] = paymentStatus;
    data['total_amount'] = totalAmount;
    return data;
  }
}
