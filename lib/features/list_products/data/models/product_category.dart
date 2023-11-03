class ProductCategoryModel {
  num? id;
  String? name;
  String? image;
  String? storeId;
  num? sortOrder;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  ProductCategoryModel({
    this.id,
    this.name,
    this.image,
    this.storeId,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    storeId = json['storeId'];
    sortOrder = json['sortOrder'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['storeId'] = storeId;
    data['sortOrder'] = sortOrder;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
