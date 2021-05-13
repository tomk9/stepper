import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/src/features/stepper/bloc/form/form_bloc.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/field_option/field_option_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/select_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/field/submit_field_entity.dart';

class FormSelectField extends StatefulWidget {
  const FormSelectField({
    Key? key,
    required this.index,
    required this.selectFieldEntity,
  }) : super(key: key);

  final int index;
  final SelectFieldEntity selectFieldEntity;

  @override
  _FormSelectFieldState createState() => _FormSelectFieldState();
}

class _FormSelectFieldState extends State<FormSelectField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.selectFieldEntity.label),
        DropdownButtonFormField(
          onChanged: _onChanged,
          items: widget.selectFieldEntity.fields
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
    context.read<FormBloc>().add(
          ChangedFormEvent(
            index: widget.index,
            submitFieldEntity: SubmitFieldEntity.fromFieldAndValue(
              widget.selectFieldEntity,
              {value?.value ?? ''},
            ),
          ),
        );
  }
}
