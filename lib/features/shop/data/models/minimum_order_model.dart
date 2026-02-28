import 'package:json_annotation/json_annotation.dart';

part 'minimum_order_model.g.dart';

@JsonSerializable()
class MinimumOrder {
  final double amount;
  final String currency;

  MinimumOrder({required this.amount, required this.currency});

  factory MinimumOrder.fromJson(Map<String, dynamic> json) => _$MinimumOrderFromJson(json);
  Map<String, dynamic> toJson() => _$MinimumOrderToJson(this);
}