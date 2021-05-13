import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_props/field/field_props/field_option/field_option_model.dart';

part 'field_props_model.g.dart';

@JsonSerializable()
class FieldPropsModel extends Equatable {
  const FieldPropsModel({
    this.options,
  });

  final List<FieldOptionModel>? options;

  factory FieldPropsModel.fromJson(Map<String, dynamic> json) =>
      _$FieldPropsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FieldPropsModelToJson(this);

  @override
  List<Object?> get props => [options];
}
