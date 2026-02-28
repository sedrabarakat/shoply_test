// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopModel _$ShopModelFromJson(Map<String, dynamic> json) => ShopModel(
  id: json['_id'] as String,
  shopName: Map<String, String>.from(json['shopName'] as Map),
  description: Map<String, String>.from(json['description'] as Map),
  minimumOrder: MinimumOrder.fromJson(
    json['minimumOrder'] as Map<String, dynamic>,
  ),
  address: Address.fromJson(json['address'] as Map<String, dynamic>),
  commission: json['commission'] == null
      ? null
      : Commission.fromJson(json['commission'] as Map<String, dynamic>),
  contactInfo: (json['contactInfo'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  estimatedDeliveryTime: json['estimatedDeliveryTime'] as String,
  deliveryRegions: (json['deliveryRegions'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  paymentMethod: (json['paymentMethod'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  ownerFullName: json['ownerFullName'] as String,
  profilePhoto: json['profilePhoto'] as String,
  coverPhoto: json['coverPhoto'] as String,
  menu: json['menu'] as String,
  operation: json['operation'] as String,
  review: json['review'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  categoryType: json['categoryType'] as String,
  deliveryFeeType: json['deliveryFeeType'] as String,
  deliveryFeeTag: json['deliveryFeeTag'] as String?,
  enable: json['enable'] as bool,
  badgeTag: json['badgeTag'] as String?,
  availability: json['availability'] as bool,
);

Map<String, dynamic> _$ShopModelToJson(ShopModel instance) => <String, dynamic>{
  '_id': instance.id,
  'shopName': instance.shopName,
  'description': instance.description,
  'minimumOrder': instance.minimumOrder.toJson(),
  'address': instance.address.toJson(),
  'commission': instance.commission?.toJson(),
  'contactInfo': instance.contactInfo,
  'estimatedDeliveryTime': instance.estimatedDeliveryTime,
  'deliveryRegions': instance.deliveryRegions,
  'paymentMethod': instance.paymentMethod,
  'ownerFullName': instance.ownerFullName,
  'profilePhoto': instance.profilePhoto,
  'coverPhoto': instance.coverPhoto,
  'menu': instance.menu,
  'operation': instance.operation,
  'review': instance.review,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'categoryType': instance.categoryType,
  'deliveryFeeType': instance.deliveryFeeType,
  'deliveryFeeTag': instance.deliveryFeeTag,
  'enable': instance.enable,
  'badgeTag': instance.badgeTag,
  'availability': instance.availability,
};
