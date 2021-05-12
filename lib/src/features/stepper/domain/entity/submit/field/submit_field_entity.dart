import 'package:equatable/equatable.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/checkbox_group_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/select_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/text_field_entity.dart';

class SubmitFieldEntity extends Equatable {
  const SubmitFieldEntity({
    required this.key,
    required this.label,
  });

  final String key;
  final String label;

  factory SubmitFieldEntity.fromField(
    FieldEntity fieldEntity,
  ) {
    if (fieldEntity is SelectFieldEntity) {
      // TODO: SelectFieldEntity
      return SubmitFieldEntity(
        key: fieldEntity.key,
        label: fieldEntity.label,
      );
    } else if (fieldEntity is TextFieldEntity) {
      // TODO: TextFieldEntity
      return SubmitFieldEntity(
        key: fieldEntity.key,
        label: fieldEntity.label,
      );
    } else if (fieldEntity is CheckboxGroupFieldEntity) {
      // TODO: CheckboxGroupFieldEntity
      return SubmitFieldEntity(
        key: fieldEntity.key,
        label: fieldEntity.label,
      );
    }
    return SubmitFieldEntity(
      key: fieldEntity.key,
      label: fieldEntity.label,
    );
  }

  @override
  List<Object?> get props => [key, label];
}
