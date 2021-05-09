import 'package:json_annotation/json_annotation.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_props/field/field_model.dart';

part 'component_props_model.g.dart';

@JsonSerializable()
class ComponentPropsModel {
  const ComponentPropsModel({
    this.fields,
    this.text,
  });

  final List<FieldModel>? fields;
  final String? text;

  factory ComponentPropsModel.fromJson(Map<String, dynamic> json) =>
      _$ComponentPropsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentPropsModelToJson(this);
}
