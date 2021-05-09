import 'package:json_annotation/json_annotation.dart';

part 'field_option_model.g.dart';

@JsonSerializable()
class FieldOptionModel {
  const FieldOptionModel({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  factory FieldOptionModel.fromJson(Map<String, dynamic> json) =>
      _$FieldOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$FieldOptionModelToJson(this);
}
