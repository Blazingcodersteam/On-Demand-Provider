class Providerlistfiltermodel {
  bool? status;
  String? msg;
  List<DynamicOption>? dynamicOption;

  Providerlistfiltermodel({status, msg,dynamicOption});

  Providerlistfiltermodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['dynamic_option'] != null) {
      dynamicOption = <DynamicOption>[];
      json['dynamic_option'].forEach((v) {
        dynamicOption!.add(new DynamicOption.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.dynamicOption != null) {
      data['dynamic_option'] =
          this.dynamicOption!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DynamicOption {
  String? mainStatusId;
  String? statusName;
  String? statusValue;
  String? created;

  DynamicOption(
      {this.mainStatusId, this.statusName, this.statusValue, this.created});

  DynamicOption.fromJson(Map<String, dynamic> json) {
    mainStatusId = json['main_status_id'];
    statusName = json['status_name'];
    statusValue = json['status_value'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['main_status_id'] = this.mainStatusId;
    data['status_name'] = this.statusName;
    data['status_value'] = this.statusValue;
    data['created'] = this.created;
    return data;
  }
}
