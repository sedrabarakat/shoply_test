// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
  city: json['city'] as String,
  country: json['country'] as String,
  otherDetails: json['otherDetails'] as String,
  state: json['state'] as String,
  street: json['street'] as String,
);

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  'city': instance.city,
  'country': instance.country,
  'otherDetails': instance.otherDetails,
  'state': instance.state,
  'street': instance.street,
};
