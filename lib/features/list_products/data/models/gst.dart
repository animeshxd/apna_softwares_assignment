class GstModel {
  String? id;
  String? gstName;
  String? gstAltName;
  num? gstValue;
  String? createdAt;
  String? updatedAt;

  GstModel({
    this.id,
    this.gstName,
    this.gstAltName,
    this.gstValue,
    this.createdAt,
    this.updatedAt,
  });

  GstModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gstName = json['gst_name'];
    gstAltName = json['gst_alt_name'];
    gstValue = json['gst_value'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gst_name'] = gstName;
    data['gst_alt_name'] = gstAltName;
    data['gst_value'] = gstValue;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
