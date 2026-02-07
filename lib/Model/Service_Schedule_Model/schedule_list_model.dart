class Scedulelistmodel {
  bool? status;
  String? msg;
  List<Data>? data;
  Scedulelistmodel({this.status, this.msg, this.data});
  Scedulelistmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Data {
  String? scheduleId;
  String? serviceId;
  String? scheduleDate;
  String? startTime;
  String? endTime;
  String? bookingSchedule;
  String? userLogId;
  String? created;
  String? isDelete;
  String? servicename;
  String? serviceimage;
  String? serviceprice;
  Data(
      {this.scheduleId,
        this.serviceId,
        this.servicename,
        this.serviceimage,
        this.serviceprice,
        this.scheduleDate,
        this.startTime,
        this.endTime,
        this.bookingSchedule,
        this.userLogId,
        this.created,
        this.isDelete});
  Data.fromJson(Map<String, dynamic> json) {
    scheduleId = json['schedule_id'];
    servicename = json['service_name'];
    serviceimage = json['service_image'];
    serviceprice = json['service_price'];
    scheduleDate = json['schedule_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    bookingSchedule = json['booking_schedule'];
    userLogId = json['user_log_id'];
    created = json['created'];
    isDelete = json['is_delete'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['schedule_id'] = scheduleId;
    data['service_name'] = servicename;
    data['service_image'] = serviceprice;
    data['service_price'] = scheduleDate;
    data['service_id'] = serviceId;
    data['schedule_date'] = scheduleDate;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['booking_schedule'] = bookingSchedule;
    data['user_log_id'] = userLogId;
    data['created'] = created;
    data['is_delete'] = isDelete;
    return data;
  }
}
