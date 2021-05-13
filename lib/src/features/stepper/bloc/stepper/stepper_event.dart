part of 'stepper_bloc.dart';

abstract class StepperEvent extends Equatable {
  const StepperEvent();
}

class GotStepperEvent extends StepperEvent {
  const GotStepperEvent();

  @override
  List<Object?> get props => [];
}

class SavedStepperEvent extends StepperEvent {
  const SavedStepperEvent({
    required this.submitEntity,
  });

  final SubmitEntity submitEntity;

  @override
  List<Object?> get props => [submitEntity];
}

class SubmittedStepperEvent extends StepperEvent {
  const SubmittedStepperEvent();

  @override
  List<Object?> get props => [];
}
