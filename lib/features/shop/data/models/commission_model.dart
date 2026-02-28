import 'package:json_annotation/json_annotation.dart';

part 'commission_model.g.dart';

@JsonSerializable()
class Commission {
  final String type;
  final double value;

  Commission({required this.type, required this.value});

  factory Commission.fromJson(Map<String, dynamic> json) => _$CommissionFromJson(json);
  Map<String, dynamic> toJson() => _$CommissionToJson(this);
}