import 'package:flutter/material.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/checkbox_group_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/select_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/text_field_entity.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/component/form/form_checkbox_group_field.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/component/form/form_select_field.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/component/form/form_text_field.dart';

class FormBuilderField extends StatelessWidget {
  const FormBuilderField({
    Key? key,
    required this.index,
    required this.fieldEntity,
  }) : super(key: key);

  final int index;
  final FieldEntity fieldEntity;

  @override
  Widget build(BuildContext context) {
    if (fieldEntity is SelectFieldEntity) {
      return FormSelectField(
        index: index,
        selectFieldEntity: fieldEntity as SelectFieldEntity,
      );
    } else if (fieldEntity is TextFieldEntity) {
      return FormTextField(
        index: index,
        fieldEntity: fieldEntity as TextFieldEntity,
      );
    } else if (fieldEntity is CheckboxGroupFieldEntity) {
      return FormCheckboxGroupField(
        index: index,
        fieldEntity: fieldEntity as CheckboxGroupFieldEntity,
      );
    }
    return Container();
  }
}
