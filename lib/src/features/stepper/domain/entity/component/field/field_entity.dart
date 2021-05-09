import 'package:stepper/src/features/stepper/data/model/component/component_props/field/field_model.dart';
import 'package:stepper/src/features/stepper/data/model/component/component_props/field/field_type/field_type.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/checkbox_group_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/select_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/text_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/validation/validation_entity.dart';

class FieldEntity {
  const FieldEntity({
    required this.key,
    required this.label,
    required this.validation,
  });

  final String key;
  final String label;
  final ValidationEntity validation;

  factory FieldEntity.fromModel(
    FieldModel fieldModel,
  ) {
    switch (fieldModel.type) {
      case FieldType.select:
        return SelectFieldEntity.fromModel(fieldModel);
      case FieldType.text:
        return TextFieldEntity.fromModel(fieldModel);
      case FieldType.checkboxGroup:
        return CheckboxGroupFieldEntity.fromModel(fieldModel);
    }
  }
}
