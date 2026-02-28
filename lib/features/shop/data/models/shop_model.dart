import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'address_model.dart';
import 'commission_model.dart';
import 'minimum_order_model.dart';

part 'shop_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ShopModel {
  @JsonKey(name: '_id')
  final String id;
  final Map<String, String> shopName;
  final Map<String, String> description;
  final MinimumOrder minimumOrder;
  final Address address;
  final Commission? commission;
  final List<String> contactInfo;
  final String estimatedDeliveryTime;
  final List<String> deliveryRegions;
  final List<String> paymentMethod;
  final String ownerFullName;
  final String profilePhoto;
  final String coverPhoto;
  final String menu;
  final String operation;
  final String review;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String categoryType;
  final String deliveryFeeType;
  final String? deliveryFeeTag;
  final bool enable;
  final String? badgeTag;
  final bool availability;

  ShopModel({
    required this.id,
    required this.shopName,
    required this.description,
    required this.minimumOrder,
    required this.address,
    required this.commission,
    required this.contactInfo,
    required this.estimatedDeliveryTime,
    required this.deliveryRegions,
    required this.paymentMethod,
    required this.ownerFullName,
    required this.profilePhoto,
    required this.coverPhoto,
    required this.menu,
    required this.operation,
    required this.review,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryType,
    required this.deliveryFeeType,
    this.deliveryFeeTag,
    required this.enable,
    required this.badgeTag,
    required this.availability,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) =>
      _$ShopModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopModelToJson(this);


  static List<ShopModel>getList(List list){
    return list.map((e) => ShopModel.fromJson(e)).toList();
  }
}


