class Viewbookingdetailsmodel {
  bool? status;
  String? msg;
  Data? data;
  List<Address>? address;

  Viewbookingdetailsmodel({this.status, this.msg, this.data, this.address});

  Viewbookingdetailsmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    if (json['address'] != null) {
      address = <Address>[];
      json['address'].forEach((v) {
        address!.add(Address.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (address != null) {
      data['address'] = address!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  DynamicStatus? dynamicStatus;
  UsersData? usersData;
  ServiceData? serviceData;
  BookingData? bookingData;
  dynamic employeeData;

  Data(
      {this.dynamicStatus,
        this.usersData,
        this.serviceData,
        this.bookingData,
        this.employeeData});

  Data.fromJson(Map<String, dynamic> json) {
    dynamicStatus = json['dynamic_status'] != null
        ? DynamicStatus.fromJson(json['dynamic_status'])
        : null;
    usersData = json['users_data'] != null
        ? UsersData.fromJson(json['users_data'])
        : null;
    serviceData = json['service_data'] != null
        ? ServiceData.fromJson(json['service_data'])
        : null;
    bookingData = json['booking_data'] != null
        ? BookingData.fromJson(json['booking_data'])
        : null;
    employeeData = json['employee_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dynamicStatus != null) {
      data['dynamic_status'] = dynamicStatus!.toJson();
    }
    if (usersData != null) {
      data['users_data'] = usersData!.toJson();
    }
    if (serviceData != null) {
      data['service_data'] = serviceData!.toJson();
    }
    if (bookingData != null) {
      data['booking_data'] = bookingData!.toJson();
    }
    data['employee_data'] = employeeData;
    return data;
  }
}

class DynamicStatus {
  String? all;
  String? accepted;
  String? pending;
  String? rejected;
  String? userCancelled;
  String? completed;

  DynamicStatus(
      {this.all,
        this.accepted,
        this.pending,
        this.rejected,
        this.userCancelled,
        this.completed});

  DynamicStatus.fromJson(Map<String, dynamic> json) {
    all = json['All'];
    accepted = json['Accepted'];
    pending = json['Pending'];
    rejected = json['Rejected'];
    userCancelled = json['User Cancelled'];
    completed = json['Completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['All'] = all;
    data['Accepted'] = accepted;
    data['Pending'] = pending;
    data['Rejected'] = rejected;
    data['User Cancelled'] = userCancelled;
    data['Completed'] = completed;
    return data;
  }
}

class UsersData {
  String? userId;
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? mobileno;
  String? userAvatar;
  String? userAvatarBlob;
  String? userBio;
  String? role;
  dynamic agree;
  String? active;
  String? deviceId;
  String? userLogId;
  String? created;
  dynamic updated;
  String? isDelete;
  dynamic trainerApprove;
  String? employeeProsId;
  dynamic employeeStatus;

  UsersData(
      {this.userId,
        this.firstname,
        this.lastname,
        this.email,
        this.password,
        this.mobileno,
        this.userAvatar,
        this.userAvatarBlob,
        this.userBio,
        this.role,
        this.agree,
        this.active,
        this.deviceId,
        this.userLogId,
        this.created,
        this.updated,
        this.isDelete,
        this.trainerApprove,
        this.employeeProsId,
        this.employeeStatus});

  UsersData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
    mobileno = json['mobileno'];
    userAvatar = json['user_avatar'];
    userAvatarBlob = json['user_avatar_blob'];
    userBio = json['user_bio'];
    role = json['role'];
    agree = json['agree'];
    active = json['active'];
    deviceId = json['device_id'];
    userLogId = json['user_log_id'];
    created = json['created'];
    updated = json['updated'];
    isDelete = json['is_delete'];
    trainerApprove = json['trainer_approve'];
    employeeProsId = json['employee_pros_id'];
    employeeStatus = json['employee_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['password'] = password;
    data['mobileno'] = mobileno;
    data['user_avatar'] = userAvatar;
    data['user_avatar_blob'] = userAvatarBlob;
    data['user_bio'] = userBio;
    data['role'] = role;
    data['agree'] = agree;
    data['active'] = active;
    data['device_id'] = deviceId;
    data['user_log_id'] = userLogId;
    data['created'] = created;
    data['updated'] = updated;
    data['is_delete'] = isDelete;
    data['trainer_approve'] = trainerApprove;
    data['employee_pros_id'] = employeeProsId;
    data['employee_status'] = employeeStatus;
    return data;
  }
}

class ServiceData {
  String? id;
  String? trainerId;
  String? firstname;
  String? serviceProvider;
  String? serviceEnable;
  String? serviceAvailable;
  dynamic serviceFeatured;
  String? serviceTime;
  String? serviceCustom;
  String? serviceDiscount;
  String? servicePriceUnit;
  String? serviceDuration;
  dynamic lastname;
  String? email;
  dynamic mobileno;
  String? biography;
  String? price;
  dynamic clinicName;
  dynamic clinicAddress;
  String? city;
  String? state;
  String? country;
  String? postalCode;
  dynamic services;
  String? category;
  String? subCategory;
  String? childCategory;
  dynamic specialist;
  dynamic trainerProfile;
  String? serviceImage;
  String? trainerApprove;
  String? status;
  String? servicePublishStatus;
  dynamic serviceTiming;
  dynamic serviceAllday;
  String? regDate;
  String? isDelete;
  String? userLogId;
  String? favStatus;

  ServiceData(
      {this.id,
        this.trainerId,
        this.firstname,
        this.serviceProvider,
        this.serviceEnable,
        this.serviceAvailable,
        this.serviceFeatured,
        this.serviceTime,
        this.serviceCustom,
        this.serviceDiscount,
        this.servicePriceUnit,
        this.serviceDuration,
        this.lastname,
        this.email,
        this.mobileno,
        this.biography,
        this.price,
        this.clinicName,
        this.clinicAddress,
        this.city,
        this.state,
        this.country,
        this.postalCode,
        this.services,
        this.category,
        this.subCategory,
        this.childCategory,
        this.specialist,
        this.trainerProfile,
        this.serviceImage,
        this.trainerApprove,
        this.status,
        this.servicePublishStatus,
        this.serviceTiming,
        this.serviceAllday,
        this.regDate,
        this.isDelete,
        this.userLogId,
        this.favStatus});

  ServiceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trainerId = json['trainer_id'];
    firstname = json['firstname'];
    serviceProvider = json['service_provider'];
    serviceEnable = json['service_enable'];
    serviceAvailable = json['service_available'];
    serviceFeatured = json['service_featured'];
    serviceTime = json['service_time'];
    serviceCustom = json['service_custom'];
    serviceDiscount = json['service_discount'];
    servicePriceUnit = json['service_price_unit'];
    serviceDuration = json['service_duration'];
    lastname = json['lastname'];
    email = json['email'];
    mobileno = json['mobileno'];
    biography = json['biography'];
    price = json['price'];
    clinicName = json['clinic_name'];
    clinicAddress = json['clinic_address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    postalCode = json['postal_code'];
    services = json['services'];
    category = json['category'];
    subCategory = json['sub_category'];
    childCategory = json['child_category'];
    specialist = json['specialist'];
    trainerProfile = json['trainer_profile'];
    serviceImage = json['service_image'];
    trainerApprove = json['trainer_approve'];
    status = json['status'];
    servicePublishStatus = json['service_publish_status'];
    serviceTiming = json['service_timing'];
    serviceAllday = json['service_allday'];
    regDate = json['reg_date'];
    isDelete = json['is_delete'];
    userLogId = json['user_log_id'];
    favStatus = json['fav_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['trainer_id'] = trainerId;
    data['firstname'] = firstname;
    data['service_provider'] = serviceProvider;
    data['service_enable'] = serviceEnable;
    data['service_available'] = serviceAvailable;
    data['service_featured'] = serviceFeatured;
    data['service_time'] = serviceTime;
    data['service_custom'] = serviceCustom;
    data['service_discount'] = serviceDiscount;
    data['service_price_unit'] = servicePriceUnit;
    data['service_duration'] = serviceDuration;
    data['lastname'] = lastname;
    data['email'] = email;
    data['mobileno'] = mobileno;
    data['biography'] = biography;
    data['price'] = price;
    data['clinic_name'] = clinicName;
    data['clinic_address'] = clinicAddress;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['postal_code'] = postalCode;
    data['services'] = services;
    data['category'] = category;
    data['sub_category'] = subCategory;
    data['child_category'] = childCategory;
    data['specialist'] = specialist;
    data['trainer_profile'] = trainerProfile;
    data['service_image'] = serviceImage;
    data['trainer_approve'] = trainerApprove;
    data['status'] = status;
    data['service_publish_status'] = servicePublishStatus;
    data['service_timing'] = serviceTiming;
    data['service_allday'] = serviceAllday;
    data['reg_date'] = regDate;
    data['is_delete'] = isDelete;
    data['user_log_id'] = userLogId;
    data['fav_status'] = favStatus;
    return data;
  }
}

class BookingData {
  String? id;
  String? actualAmount;
  String? taxableAmount;
  String? discountAmount;
  dynamic discountType;
  dynamic couponDiscount;
  String? taxValue;
  String? totalPayableAmount;
  dynamic paidAmount;
  dynamic pendingAmount;
  String? quantity;
  String? providerId;
  String? bookingDate;
  String? bookingTime;
  String? bookingDay;
  String? customerId;
  String? serviceId;
  String? address;
  String? hint;
  String? status;
  String? paymentStatus;
  String? paymentMethod;
  String? createAt;
  String? isDelete;
  String? userLogId;
  String? updated;
  dynamic employeeId;
  String? prosId;
  String? prosName;
  String? prosType;
  dynamic prosEmployee;
  String? prosPhone;
  String? prosMobile;
  String? prosAddress;
  String? prosAvailRange;
  String? prosTaxes;
  String? prosDescription;
  String? prosAccepted;
  dynamic prosAvailable;
  dynamic prosFeatured;
  dynamic prosImage;
  String? prosFiles;
  String? prosCreated;
  String? prosUpdated;
  String? prosTime;
  String? publishStatus;
  String? checkallday;
  String? adminProsUser;
  String? employeeName;

  BookingData(
      {this.id,
        this.actualAmount,
        this.taxableAmount,
        this.discountAmount,
        this.discountType,
        this.couponDiscount,
        this.taxValue,
        this.totalPayableAmount,
        this.paidAmount,
        this.pendingAmount,
        this.quantity,
        this.providerId,
        this.bookingDate,
        this.bookingTime,
        this.bookingDay,
        this.customerId,
        this.serviceId,
        this.address,
        this.hint,
        this.status,
        this.paymentStatus,
        this.paymentMethod,
        this.createAt,
        this.isDelete,
        this.userLogId,
        this.updated,
        this.employeeId,
        this.prosId,
        this.prosName,
        this.prosType,
        this.prosEmployee,
        this.prosPhone,
        this.prosMobile,
        this.prosAddress,
        this.prosAvailRange,
        this.prosTaxes,
        this.prosDescription,
        this.prosAccepted,
        this.prosAvailable,
        this.prosFeatured,
        this.prosImage,
        this.prosFiles,
        this.prosCreated,
        this.prosUpdated,
        this.prosTime,
        this.publishStatus,
        this.checkallday,
        this.adminProsUser,
        this.employeeName});

  BookingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    actualAmount = json['actual_amount'];
    taxableAmount = json['taxable_amount'];
    discountAmount = json['discount_amount'];
    discountType = json['discount_type'];
    couponDiscount = json['coupon_discount'];
    taxValue = json['tax_value'];
    totalPayableAmount = json['total_payable_amount'];
    paidAmount = json['paid_amount'];
    pendingAmount = json['pending_amount'];
    quantity = json['quantity'];
    providerId = json['provider_id'];
    bookingDate = json['booking_date'];
    bookingTime = json['booking_time'];
    bookingDay = json['booking_day'];
    customerId = json['customer_id'];
    serviceId = json['service_id'];
    address = json['address'];
    hint = json['hint'];
    status = json['status'];
    paymentStatus = json['payment_status'];
    paymentMethod = json['payment_method'];
    createAt = json['create_at'];
    isDelete = json['is_delete'];
    userLogId = json['user_log_id'];
    updated = json['updated'];
    employeeId = json['employee_id'];
    prosId = json['pros_id'];
    prosName = json['pros_name'];
    prosType = json['pros_type'];
    prosEmployee = json['pros_employee'];
    prosPhone = json['pros_phone'];
    prosMobile = json['pros_mobile'];
    prosAddress = json['pros_address'];
    prosAvailRange = json['pros_avail_range'];
    prosTaxes = json['pros_taxes'];
    prosDescription = json['pros_description'];
    prosAccepted = json['pros_accepted'];
    prosAvailable = json['pros_available'];
    prosFeatured = json['pros_featured'];
    prosImage = json['pros_image'];
    prosFiles = json['pros_files'];
    prosCreated = json['pros_created'];
    prosUpdated = json['pros_updated'];
    prosTime = json['pros_time'];
    publishStatus = json['publish_status'];
    checkallday = json['checkallday'];
    adminProsUser = json['admin_pros_user'];
    employeeName = json['employee_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['actual_amount'] = actualAmount;
    data['taxable_amount'] = taxableAmount;
    data['discount_amount'] = discountAmount;
    data['discount_type'] = discountType;
    data['coupon_discount'] = couponDiscount;
    data['tax_value'] = taxValue;
    data['total_payable_amount'] = totalPayableAmount;
    data['paid_amount'] = paidAmount;
    data['pending_amount'] = pendingAmount;
    data['quantity'] = quantity;
    data['provider_id'] = providerId;
    data['booking_date'] = bookingDate;
    data['booking_time'] = bookingTime;
    data['booking_day'] = bookingDay;
    data['customer_id'] = customerId;
    data['service_id'] = serviceId;
    data['address'] = address;
    data['hint'] = hint;
    data['status'] = status;
    data['payment_status'] = paymentStatus;
    data['payment_method'] = paymentMethod;
    data['create_at'] = createAt;
    data['is_delete'] = isDelete;
    data['user_log_id'] = userLogId;
    data['updated'] = updated;
    data['employee_id'] = employeeId;
    data['pros_id'] = prosId;
    data['pros_name'] = prosName;
    data['pros_type'] = prosType;
    data['pros_employee'] = prosEmployee;
    data['pros_phone'] = prosPhone;
    data['pros_mobile'] = prosMobile;
    data['pros_address'] = prosAddress;
    data['pros_avail_range'] = prosAvailRange;
    data['pros_taxes'] = prosTaxes;
    data['pros_description'] = prosDescription;
    data['pros_accepted'] = prosAccepted;
    data['pros_available'] = prosAvailable;
    data['pros_featured'] = prosFeatured;
    data['pros_image'] = prosImage;
    data['pros_files'] = prosFiles;
    data['pros_created'] = prosCreated;
    data['pros_updated'] = prosUpdated;
    data['pros_time'] = prosTime;
    data['publish_status'] = publishStatus;
    data['checkallday'] = checkallday;
    data['admin_pros_user'] = adminProsUser;
    data['employee_name'] = this.employeeName;
    return data;
  }
}

class Address {
  String? adId;
  String? adDescription;
  String? adAddresses;
  String? adLatitude;
  String? adLongitude;
  String? adArea;
  String? adCity;
  dynamic adDistrict;
  String? adState;
  String? adPincode;
  String? created;
  dynamic updated;
  String? userLogId;
  String? isDelete;

  Address(
      {this.adId,
        this.adDescription,
        this.adAddresses,
        this.adLatitude,
        this.adLongitude,
        this.adArea,
        this.adCity,
        this.adDistrict,
        this.adState,
        this.adPincode,
        this.created,
        this.updated,
        this.userLogId,
        this.isDelete});

  Address.fromJson(Map<String, dynamic> json) {
    adId = json['ad_id'];
    adDescription = json['ad_description'];
    adAddresses = json['ad_addresses'];
    adLatitude = json['ad_latitude'];
    adLongitude = json['ad_longitude'];
    adArea = json['ad_area'];
    adCity = json['ad_city'];
    adDistrict = json['ad_district'];
    adState = json['ad_state'];
    adPincode = json['ad_pincode'];
    created = json['created'];
    updated = json['updated'];
    userLogId = json['user_log_id'];
    isDelete = json['is_delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ad_id'] = adId;
    data['ad_description'] = adDescription;
    data['ad_addresses'] = adAddresses;
    data['ad_latitude'] = adLatitude;
    data['ad_longitude'] = adLongitude;
    data['ad_area'] = adArea;
    data['ad_city'] = adCity;
    data['ad_district'] = adDistrict;
    data['ad_state'] = adState;
    data['ad_pincode'] = adPincode;
    data['created'] = created;
    data['updated'] = updated;
    data['user_log_id'] = userLogId;
    data['is_delete'] = isDelete;
    return data;
  }
}
