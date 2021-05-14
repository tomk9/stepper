import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/src/features/stepper/bloc/form_builder/form_builder_bloc.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/checkbox_group_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/field_option/field_option_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/field/submit_field_entity.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/component/form/asterisk.dart';

class FormCheckboxGroupField extends StatefulWidget {
  const FormCheckboxGroupField({
    Key? key,
    required this.index,
    required this.fieldEntity,
  }) : super(key: key);

  final int index;
  final CheckboxGroupFieldEntity fieldEntity;

  @override
  _FormCheckboxGroupFieldState createState() => _FormCheckboxGroupFieldState();
}

class _FormCheckboxGroupFieldState extends State<FormCheckboxGroupField> {
  final _selectedValues = <String>{};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                widget.fieldEntity.label,
              ),
            ),
            if (widget.fieldEntity.validation.required) Asterisk(),
          ],
        ),
        for (final field in widget.fieldEntity.fields)
          CheckboxListTile(
            key: Key(
              '${FormCheckboxGroupFieldKey.checkboxListTile}_${field.label}',
            ),
            value: _selectedValues.contains(
              field.label,
            ),
            title: Text(field.label),
            onChanged: (value) => _onChanged(value, field),
          ),
      ],
    );
  }

  void _onChanged(bool? value, FieldOptionEntity fieldOption) {
    setState(() {
      value == true
          ? _selectedValues.add(fieldOption.label)
          : _selectedValues.remove(fieldOption.label);
    });
    context.read<FormBuilderBloc>().add(
          ChangedFormBuilderEvent(
            index: widget.index,
            submitFieldEntity: SubmitFieldEntity.fromFieldAndValue(
              widget.fieldEntity,
              _selectedValues,
            ),
          ),
        );
  }
}

abstract class FormCheckboxGroupFieldKey {
  static const checkboxListTile = 'CHECKBOX_LIST_TILE';
}
