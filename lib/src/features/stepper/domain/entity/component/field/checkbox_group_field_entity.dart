import 'package:stepper/src/features/stepper/data/model/component/component_props/field/field_model.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/field_option/field_option_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/validation/validation_entity.dart';

class CheckboxGroupFieldEntity extends FieldEntity {
  const CheckboxGroupFieldEntity({
    required this.key,
    required this.label,
    required this.validation,
    required this.fields,
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
  final List<FieldOptionEntity> fields;

  CheckboxGroupFieldEntity.fromModel(
    FieldModel fieldModel,
  ) : this(
          key: fieldModel.key,
          label: fieldModel.label,
          validation: ValidationEntity.fromModel(fieldModel.validation),
          fields: fieldModel.fieldProps?.options
                  ?.map(
                    (e) => FieldOptionEntity.fromModel(e),
                  )
                  .toList() ??
              [],
        );

  @override
  List<Object?> get props => [key, label, validation, fields];
}
