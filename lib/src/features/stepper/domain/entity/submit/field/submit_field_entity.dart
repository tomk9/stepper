import 'package:equatable/equatable.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/checkbox_group_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/select_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/text_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/field/checkbox_group_submit_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/field/select_submit_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/field/text_submit_field_entity.dart';

class SubmitFieldEntity extends Equatable {
  const SubmitFieldEntity({
    required this.key,
    required this.label,
    required this.required,
    this.value,
  });

  final String key;
  final String label;
  final bool required;
  final Set<String?>? value;

  factory SubmitFieldEntity.fromFieldAndValue(
    FieldEntity fieldEntity,
    Set<String>? value,
  ) {
    if (fieldEntity is SelectFieldEntity) {
      return SelectSubmitFieldEntity(
        key: fieldEntity.key,
        label: fieldEntity.label,
        required: fieldEntity.validation.required,
        textValue: value?.first,
      );
    } else if (fieldEntity is TextFieldEntity) {
      return TextSubmitFieldEntity(
        key: fieldEntity.key,
        label: fieldEntity.label,
        required: fieldEntity.validation.required,
        textValue: value?.first ?? fieldEntity.value,
      );
    } else if (fieldEntity is CheckboxGroupFieldEntity) {
      return CheckboxGroupSubmitFieldEntity(
        key: fieldEntity.key,
        label: fieldEntity.label,
        required: fieldEntity.validation.required,
        value: value,
      );
    }
    return SubmitFieldEntity(
      key: fieldEntity.key,
      label: fieldEntity.label,
      required: fieldEntity.validation.required,
      value: value,
    );
  }

  @override
  List<Object?> get props => [key, label, required, value];
}
