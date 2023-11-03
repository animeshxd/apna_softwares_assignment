class UnitDetailModel {
  String? id;
  String? unitName;
  dynamic storeId;
  num? unit;
  String? createdAt;
  String? updatedAt;

  UnitDetailModel({
    this.id,
    this.unitName,
    this.storeId,
    this.unit,
    this.createdAt,
    this.updatedAt,
  });

  UnitDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unitName = json['unit_name'];
    storeId = json['storeId'];
    unit = json['unit'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['unit_name'] = unitName;
    data['storeId'] = storeId;
    data['unit'] = unit;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
