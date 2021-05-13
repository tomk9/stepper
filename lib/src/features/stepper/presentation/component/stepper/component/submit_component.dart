import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/src/features/stepper/bloc/stepper/stepper_bloc.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/submit_component_entity.dart';

class SubmitComponent extends StatefulWidget {
  const SubmitComponent({
    Key? key,
    required this.submitComponentEntity,
  }) : super(key: key);

  final SubmitComponentEntity submitComponentEntity;

  @override
  _SubmitComponentState createState() => _SubmitComponentState();
}

class _SubmitComponentState extends State<SubmitComponent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _onSubmitPressed,
        child: Text('Submit'),
      ),
    );
  }

  void _onSubmitPressed() {
    context.read<StepperBloc>().add(const SubmittedStepperEvent());
  }
}
