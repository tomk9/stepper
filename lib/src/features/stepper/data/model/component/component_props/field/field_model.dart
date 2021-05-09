import 'package:json_annotation/json_annotation.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_props/field/field_props/field_props_model.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_props/field/field_type/field_type.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_props/field/validation/validation_model.dart';

part 'field_model.g.dart';

@JsonSerializable()
class FieldModel {
  const FieldModel({
    this.key,
    this.type,
    this.label,
    this.props,
    this.validation,
  });

  final String? key;
  final FieldType? type;
  final String? label;
  final FieldPropsModel? props;
  final ValidationModel? validation;

  factory FieldModel.fromJson(Map<String, dynamic> json) =>
      _$FieldModelFromJson(json);

  Map<String, dynamic> toJson() => _$FieldModelToJson(this);
}
