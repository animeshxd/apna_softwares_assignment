import 'product_category.dart';
import 'unit_detail.dart';
import 'variant.dart';
import '../../domain/entities/product.dart';

class ProductModel extends Product {
  final int id;
  final String name;
  final String? description;
  final String? productImage;
  final num? productCategoryId;
  final dynamic status;
  final int mrp;
  final int? price;
  final num? unit;
  final String? unitId;
  final String? taxRate;
  final String? taxRateId;
  final String? hsnCode;
  final bool? haveVariant;
  final String? storeId;
  final num? sortOrder;
  final bool? isOutOfStock;
  final bool? sampleProduct;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final num? currentStockCount;
  final ProductCategoryModel? productCategory;
  final UnitDetailModel? unitDetail;
  final String? gst;
  final List<VariantModel>? variants;

  const ProductModel({
    required this.id,
    required this.name,
    this.description,
    this.productImage,
    this.productCategoryId,
    this.status,
    required this.mrp,
    this.price,
    this.unit,
    this.unitId,
    this.taxRate,
    this.taxRateId,
    this.hsnCode,
    this.haveVariant,
    this.storeId,
    this.sortOrder,
    this.isOutOfStock,
    this.sampleProduct,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.currentStockCount,
    this.productCategory,
    this.unitDetail,
    this.gst,
    this.variants,
  }) : super(id: id, name: name, createdAt: createdAt, mrp: mrp);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name']!,
      description: json['description'],
      productImage: json['productImage'],
      productCategoryId: json['productCategoryId'],
      status: json['status'],
      mrp: json['mrp'],
      price: json['price'],
      unit: json['unit'],
      unitId: json['unitId'],
      taxRate: json['taxRate'],
      taxRateId: json['taxRateId'],
      hsnCode: json['hsnCode'],
      haveVariant: json['haveVariant'],
      storeId: json['storeId'],
      sortOrder: json['sortOrder'],
      isOutOfStock: json['isOutOfStock'],
      sampleProduct: json['sampleProduct'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
      currentStockCount: json['currentStockCount'],
      productCategory: json['productCategory'] != null
          ? ProductCategoryModel.fromJson(json['productCategory'])
          : null,
      unitDetail: json['unitDetail'] != null
          ? UnitDetailModel.fromJson(json['unitDetail'])
          : null,
      gst: json['gst'],
      variants: List<VariantModel>.from(
        (json['variants'] ?? []).map((e) => VariantModel.fromJson(e)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['productImage'] = productImage;
    data['productCategoryId'] = productCategoryId;
    data['status'] = status;
    data['mrp'] = mrp;
    data['price'] = price;
    data['unit'] = unit;
    data['unitId'] = unitId;
    data['taxRate'] = taxRate;
    data['taxRateId'] = taxRateId;
    data['hsnCode'] = hsnCode;
    data['haveVariant'] = haveVariant;
    data['storeId'] = storeId;
    data['sortOrder'] = sortOrder;
    data['isOutOfStock'] = isOutOfStock;
    data['sampleProduct'] = sampleProduct;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['currentStockCount'] = currentStockCount;
    if (productCategory != null) {
      data['productCategory'] = productCategory!.toJson();
    }
    if (unitDetail != null) {
      data['unitDetail'] = unitDetail!.toJson();
    }
    data['gst'] = gst;
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
