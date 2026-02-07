class Servicerangelistmodel {
  bool? status;
  String? msg;
  List<Data>? data;

  Servicerangelistmodel({status, msg,data});

  Servicerangelistmodel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
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
    data['Status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? serviceRangeId;
  String? serviceRange;
  String? serviceRangeUserId;
  String? createAt;

  Data(
      {this.serviceRangeId,
        this.serviceRange,
        this.serviceRangeUserId,
        this.createAt});

  Data.fromJson(Map<String, dynamic> json) {
    serviceRangeId = json['service_range_id'];
    serviceRange = json['service_range'];
    serviceRangeUserId = json['service_range_user_id'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_range_id'] = this.serviceRangeId;
    data['service_range'] = this.serviceRange;
    data['service_range_user_id'] = this.serviceRangeUserId;
    data['create_at'] = this.createAt;
    return data;
  }
}
