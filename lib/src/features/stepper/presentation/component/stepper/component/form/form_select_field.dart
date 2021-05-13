import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/src/features/stepper/bloc/form_builder/form_builder_bloc.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/field_option/field_option_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/select_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/field/submit_field_entity.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/component/form/asterisk.dart';

class FormSelectField extends StatefulWidget {
  const FormSelectField({
    Key? key,
    required this.index,
    required this.fieldEntity,
  }) : super(key: key);

  final int index;
  final SelectFieldEntity fieldEntity;

  @override
  _FormSelectFieldState createState() => _FormSelectFieldState();
}

class _FormSelectFieldState extends State<FormSelectField> {
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
        DropdownButtonFormField(
          onChanged: _onChanged,
          items: widget.fieldEntity.fields
              .map<DropdownMenuItem<FieldOptionEntity>>(
                (fieldOptionEntity) => DropdownMenuItem(
                  value: fieldOptionEntity,
                  child: Text(
                    fieldOptionEntity.label,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  void _onChanged(FieldOptionEntity? value) {
    context.read<FormBuilderBloc>().add(
          ChangedFormBuilderEvent(
            index: widget.index,
            submitFieldEntity: SubmitFieldEntity.fromFieldAndValue(
              widget.fieldEntity,
              {value?.value ?? ''},
            ),
          ),
        );
  }
}
