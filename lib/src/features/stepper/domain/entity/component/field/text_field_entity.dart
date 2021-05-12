import 'package:stepper/src/features/stepper/data/model/component/component_props/field/field_model.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/validation/validation_entity.dart';

class TextFieldEntity extends FieldEntity {
  const TextFieldEntity({
    required this.key,
    required this.label,
    required this.validation,
    this.value,
  }) : super(
          key: key,
          label: label,
          validation: validation,
        );

  @override
  final String key;
  @override
  final String label;
  @override
  final ValidationEntity validation;
  final String? value;

  TextFieldEntity.fromModel(
    FieldModel fieldModel,
  ) : this(
          key: fieldModel.key,
          label: fieldModel.label,
          validation: ValidationEntity.fromModel(fieldModel.validation),
          value: fieldModel.value,
        );

  @override
  List<Object?> get props => [key, label, validation, value];
}
