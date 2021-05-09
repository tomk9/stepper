import 'package:json_annotation/json_annotation.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_props/field/field_props/field_props_model.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_props/field/field_type/field_type.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_props/field/validation/validation_model.dart';

part 'field_model.g.dart';

@JsonSerializable()
class FieldModel {
  const FieldModel({
    required this.key,
    required this.type,
    required this.label,
    required this.validation,
    this.props,
    this.value,
  });

  final String key;
  final FieldType type;
  final String label;
  final ValidationModel validation;
  final FieldPropsModel? props;
  final String? value;

  factory FieldModel.fromJson(Map<String, dynamic> json) =>
      _$FieldModelFromJson(json);

  Map<String, dynamic> toJson() => _$FieldModelToJson(this);
}
