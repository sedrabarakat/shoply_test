// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commission _$CommissionFromJson(Map<String, dynamic> json) => Commission(
  type: json['type'] as String,
  value: (json['value'] as num).toDouble(),
);

Map<String, dynamic> _$CommissionToJson(Commission instance) =>
    <String, dynamic>{'type': instance.type, 'value': instance.value};
