import 'package:flutter/material.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/submit_entity.dart';
import 'package:stepper/src/features/stepper/presentation/component/summary/summary_body.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({
    Key? key,
    required this.submitEntity,
  }) : super(key: key);

  final SubmitEntity submitEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Summary',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SummaryBody(
          submitEntity: submitEntity,
        ),
      ),
    );
  }
}
