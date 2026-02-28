// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minimum_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinimumOrder _$MinimumOrderFromJson(Map<String, dynamic> json) => MinimumOrder(
  amount: (json['amount'] as num).toDouble(),
  currency: json['currency'] as String,
);

Map<String, dynamic> _$MinimumOrderToJson(MinimumOrder instance) =>
    <String, dynamic>{'amount': instance.amount, 'currency': instance.currency};
