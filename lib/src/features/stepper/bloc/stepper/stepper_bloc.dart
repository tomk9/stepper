import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/component_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/submit_entity.dart';
import 'package:stepper/src/features/stepper/domain/repository/stepper_repository.dart';

part 'stepper_event.dart';

part 'stepper_state.dart';

class StepperBloc extends Bloc<StepperEvent, StepperState> {
  StepperBloc({
    required this.stepperRepository,
  }) : super(const StepperInitial());

  StepperRepository stepperRepository;

  @override
  Stream<StepperState> mapEventToState(
    StepperEvent event,
  ) async* {
    if (event is GotStepperEvent) {
      yield* _mapGotStepperEventToState(event);
    } else if (event is SavedStepperEvent) {
      yield* _mapSavedStepperEventToState(event);
    } else if (event is SubmittedStepperEvent) {
      yield* _mapSubmittedStepperEventToState(event);
    }
  }

  Stream<StepperState> _mapGotStepperEventToState(
      GotStepperEvent event) async* {
    yield const GettingStepperState();
    try {
      final componentList = await stepperRepository.getComponentList();
      yield GotStepperState(componentList: componentList);
    } catch (e) {
      yield GettingErrorStepperState(
        error: e,
      );
    }
  }

  Stream<StepperState> _mapSavedStepperEventToState(
      SavedStepperEvent event) async* {
    stepperRepository.saveForm(event.submitEntity);
  }

  Stream<StepperState> _mapSubmittedStepperEventToState(
      SubmittedStepperEvent event) async* {
    yield const SubmittingStepperState();
    final submittedResult = stepperRepository.submit();
    yield SubmittedStepperState(
      submitEntity: submittedResult,
    );
  }
}
