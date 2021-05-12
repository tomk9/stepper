import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/src/features/stepper/bloc/stepper_bloc.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/stepper_page_view.dart';
import 'package:stepper/src/features/stepper/presentation/page/summary_page.dart';

class StepperPage extends StatefulWidget {
  const StepperPage({
    Key? key,
  }) : super(key: key);

  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  @override
  void initState() {
    super.initState();
    context.read<StepperBloc>().add(const GotStepperEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StepperBloc, StepperState>(
      listener: _stepperBlocListener,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Stepper',
          ),
        ),
        body: BlocBuilder<StepperBloc, StepperState>(
          builder: (context, state) {
            if (state is GotStepperState) {
              return StepperPageView(
                componentList: state.componentList,
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  void _stepperBlocListener(BuildContext context, StepperState state) {
    if (state is SubmittedStepperState) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SummaryPage(),
        ),
      );
    }
  }
}
