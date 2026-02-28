import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';
@JsonSerializable()
class Address {
  final String city;
  final String country;
  final String otherDetails;
  final String state;
  final String street;

  Address({
    required this.city,
    required this.country,
    required this.otherDetails,
    required this.state,
    required this.street,
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  String get fullAddress {
    final parts = [
      street,
      otherDetails,
      city,
      state,
      country,
    ].where((part) => part.isNotEmpty).toList();
    return parts.join(', ');
  }
}
