import 'package:json_annotation/json_annotation.dart';

import 'meta_model.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class ApiResponse<T> {
  ApiResponse({
    required this.result,
    this.meta,
    this.statusCode,
    this.statusMessage,
  });

  final T? result;
  int? statusCode;
  String? statusMessage;
  final MetaModel? meta;


  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic itemJson) fromJsonT,
  ) {
    return _$ApiResponseFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    final Map<String, dynamic> json = _$ApiResponseToJson(this, toJsonT);
    return json;
  }
}
