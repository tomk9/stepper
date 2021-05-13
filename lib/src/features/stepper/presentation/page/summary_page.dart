import 'package:flutter/material.dart';
import 'package:stepper/src/features/stepper/presentation/component/summary/summary_body.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Summary',
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SummaryBody(),
      ),
    );
  }
}
