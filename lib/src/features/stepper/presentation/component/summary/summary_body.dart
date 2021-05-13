import 'package:flutter/material.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/submit_entity.dart';
import 'package:stepper/src/features/stepper/presentation/component/summary/summary_field.dart';
import 'package:stepper/src/features/stepper/presentation/page/stepper_page.dart';

class SummaryBody extends StatefulWidget {
  const SummaryBody({
    Key? key,
    required this.submitEntity,
  }) : super(key: key);

  final SubmitEntity submitEntity;

  @override
  _SummaryBodyState createState() => _SummaryBodyState();
}

class _SummaryBodyState extends State<SummaryBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            children: [
              for (final field in widget.submitEntity.fields)
                SummaryField(
                  submitFieldEntity: field,
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: ElevatedButton.icon(
            onPressed: _onPressed,
            icon: Icon(Icons.replay),
            label: Text(
              'Run again',
            ),
          ),
        ),
      ],
    );
  }

  void _onPressed() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const StepperPage(),
      ),
    );
  }
}
