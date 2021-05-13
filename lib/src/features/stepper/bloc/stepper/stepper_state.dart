part of 'stepper_bloc.dart';

abstract class StepperState extends Equatable {
  const StepperState();
}

class StepperInitial extends StepperState {
  const StepperInitial();

  @override
  List<Object> get props => [];
}

class GettingStepperState extends StepperState {
  const GettingStepperState();

  @override
  List<Object> get props => [];
}

class GotStepperState extends StepperState {
  const GotStepperState({
    required this.componentList,
  });

  final List<ComponentEntity> componentList;

  @override
  List<Object> get props => [componentList];
}

class GettingErrorStepperState extends StepperState {
  const GettingErrorStepperState({
    required this.error,
  });

  final Object error;

  @override
  List<Object> get props => [error];
}

class SubmittingStepperState extends StepperState {
  const SubmittingStepperState();

  @override
  List<Object> get props => [];
}

class SubmittedStepperState extends StepperState {
  const SubmittedStepperState({
    required this.submitEntity,
  });

  final SubmitEntity submitEntity;

  @override
  List<Object> get props => [submitEntity];
}
