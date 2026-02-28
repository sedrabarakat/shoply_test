import 'package:json_annotation/json_annotation.dart';
part 'meta_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MetaModel {
  @JsonKey(name: "current_page")
  int? currentPage;
  @JsonKey(name: "from")
  int? from;
  @JsonKey(name: "path")
  String? path;
  @JsonKey(name: "per_page")
  int? perPage;
  int? to;
  int? total;

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return _$MetaModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MetaModelToJson(this);

  MetaModel({
    this.currentPage,
    this.from,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });
}

