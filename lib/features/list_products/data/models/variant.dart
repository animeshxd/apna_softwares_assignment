class VariantModel {
  num? id;
  String? name;
  dynamic description;
  int? productId;
  dynamic status;
  num? price;
  num? mrp;
  num? unit;
  dynamic unitId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic unitDetail;

  VariantModel({
    this.id,
    this.name,
    this.description,
    this.productId,
    this.status,
    this.price,
    this.mrp,
    this.unit,
    this.unitId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.unitDetail,
  });

  VariantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    productId = json['productId'];
    status = json['status'];
    price = json['price']?.toDouble();
    mrp = json['mrp'];
    unit = json['unit'];
    unitId = json['unitId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    unitDetail = json['unitDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['productId'] = productId;
    data['status'] = status;
    data['price'] = price;
    data['mrp'] = mrp;
    data['unit'] = unit;
    data['unitId'] = unitId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['unitDetail'] = unitDetail;
    return data;
  }
}
