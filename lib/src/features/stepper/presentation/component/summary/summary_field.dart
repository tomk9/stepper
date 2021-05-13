import 'package:flutter/material.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/field/submit_field_entity.dart';

class SummaryField extends StatelessWidget {
  const SummaryField({
    Key? key,
    required this.submitFieldEntity,
  }) : super(key: key);

  final SubmitFieldEntity submitFieldEntity;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${submitFieldEntity.label}: ${submitFieldEntity.value}',
    );
  }
}
