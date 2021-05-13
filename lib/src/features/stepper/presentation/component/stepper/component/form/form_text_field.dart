import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/src/features/stepper/bloc/form/form_bloc.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/text_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/field/submit_field_entity.dart';

class FormTextField extends StatefulWidget {
  const FormTextField({
    Key? key,
    required this.index,
    required this.fieldEntity,
  }) : super(key: key);

  final int index;
  final TextFieldEntity fieldEntity;

  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(
      text: widget.fieldEntity.value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.fieldEntity.label),
        TextFormField(
          controller: _textEditingController,
          onChanged: _onChanged,
        ),
      ],
    );
  }

  void _onChanged(String value) {
    context.read<FormBloc>().add(
          ChangedFormEvent(
            index: widget.index,
            submitFieldEntity: SubmitFieldEntity.fromFieldAndValue(
              widget.fieldEntity,
              {value},
            ),
          ),
        );
  }
}
