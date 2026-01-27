class Homemodel {
  bool? status;
  String? msg;
  Data? data;

  Homemodel({status,msg,data});

  Homemodel.fromJson(Map<String, dynamic> json) {
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
  CalculationDatas? calculationDatas;
  AdvertisementData? advertisementData;
  List<HomeFilterData>? homeFilterData;

  Data({this.calculationDatas, this.advertisementData, this.homeFilterData});

  Data.fromJson(Map<String, dynamic> json) {
    calculationDatas = json['calculation_datas'] != null
        ? new CalculationDatas.fromJson(json['calculation_datas'])
        : null;
    advertisementData = json['advertisement_data'] != null
        ? new AdvertisementData.fromJson(json['advertisement_data'])
        : null;
    if (json['home_filter_data'] != null) {
      homeFilterData = <HomeFilterData>[];
      json['home_filter_data'].forEach((v) {
        homeFilterData!.add(new HomeFilterData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.calculationDatas != null) {
      data['calculation_datas'] = this.calculationDatas!.toJson();
    }
    if (this.advertisementData != null) {
      data['advertisement_data'] = this.advertisementData!.toJson();
    }
    if (this.homeFilterData != null) {
      data['home_filter_data'] =
          this.homeFilterData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CalculationDatas {
  int? totalEarnings;
  int? totalBookings;
  int? providersTeams;

  CalculationDatas(
      {this.totalEarnings, this.totalBookings, this.providersTeams});

  CalculationDatas.fromJson(Map<String, dynamic> json) {
    totalEarnings = json['total_earnings'];
    totalBookings = json['total_bookings'];
    providersTeams = json['providers_teams'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_earnings'] = this.totalEarnings;
    data['total_bookings'] = this.totalBookings;
    data['providers_teams'] = this.providersTeams;
    return data;
  }
}

class AdvertisementData {
  String? id;
  String? description1;
  String? description2;
  String? image;

  AdvertisementData(
      {this.id, this.description1, this.description2, this.image});

  AdvertisementData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description1 = json['description1'];
    description2 = json['description2'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description1'] = this.description1;
    data['description2'] = this.description2;
    data['image'] = this.image;
    return data;
  }
}

class HomeFilterData {
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

  HomeFilterData(
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

  HomeFilterData.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provider_id'] = this.providerId;
    data['service_id'] = this.serviceId;
    data['service_name'] = this.serviceName;
    data['service_image'] = this.serviceImage;
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['customer_image'] = this.customerImage;
    data['booking_id'] = this.bookingId;
    data['address'] = this.address;
    data['booking_time'] = this.bookingTime;
    data['booking_day'] = this.bookingDay;
    data['booking_date'] = this.bookingDate;
    data['booked_date'] = this.bookedDate;
    data['payment_status'] = this.paymentStatus;
    data['total_amount'] = this.totalAmount;
    return data;
  }
}
