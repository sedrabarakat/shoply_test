// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaModel _$MetaModelFromJson(Map<String, dynamic> json) => MetaModel(
  currentPage: (json['current_page'] as num?)?.toInt(),
  from: (json['from'] as num?)?.toInt(),
  path: json['path'] as String?,
  perPage: (json['per_page'] as num?)?.toInt(),
  to: (json['to'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$MetaModelToJson(MetaModel instance) => <String, dynamic>{
  'current_page': instance.currentPage,
  'from': instance.from,
  'path': instance.path,
  'per_page': instance.perPage,
  'to': instance.to,
  'total': instance.total,
};
