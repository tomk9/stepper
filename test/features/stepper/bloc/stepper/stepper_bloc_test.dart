import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/foundation.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stepper/src/features/stepper/bloc/stepper/stepper_bloc.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/component_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/submit_entity.dart';
import 'package:stepper/src/features/stepper/domain/repository/stepper_repository.dart';
import 'package:test/test.dart';

import '../../domain/repository/stepper_repository.dart';

void main() {
  late StepperRepository _stepperRepository;
  late List<ComponentEntity> _componentList;
  late Object _error;
  late SubmitEntity _submitEntity;
  setUp(() {
    _stepperRepository = MockStepperRepository();
    _componentList = [ComponentEntity(id: 'id')];
    _error = FlutterError('Unable to load asset');
    _submitEntity = SubmitEntity(fields: []);
  });
  group('StepperBloc', () {
    blocTest<StepperBloc, StepperState>(
      'emits [] when nothing is added',
      build: () => StepperBloc(
        stepperRepository: _stepperRepository,
      ),
      expect: () => [],
    );

    blocTest<StepperBloc, StepperState>(
      'emits [GettingStepperState, GotStepperState] when GotStepperEvent is added',
      build: () {
        when(() => _stepperRepository.getComponentList())
            .thenAnswer((invocation) async => _componentList);
        return StepperBloc(
          stepperRepository: _stepperRepository,
        );
      },
      act: (bloc) => bloc.add(GotStepperEvent()),
      verify: (_) {
        verify(() => _stepperRepository.getComponentList()).called(1);
      },
      expect: () => [
        GettingStepperState(),
        GotStepperState(componentList: _componentList),
      ],
    );

    blocTest<StepperBloc, StepperState>(
      'emits [GettingStepperState, GettingErrorStepperState] when GotStepperEvent is added and throws error',
      build: () {
        when(() => _stepperRepository.getComponentList()).thenThrow(_error);
        return StepperBloc(
          stepperRepository: _stepperRepository,
        );
      },
      act: (bloc) => bloc.add(GotStepperEvent()),
      verify: (_) {
        verify(() => _stepperRepository.getComponentList()).called(1);
      },
      expect: () => [
        GettingStepperState(),
        GettingErrorStepperState(
          error: _error,
        ),
      ],
    );

    blocTest<StepperBloc, StepperState>(
      'emits [] when SavedStepperEvent is added',
      build: () {
        return StepperBloc(
          stepperRepository: _stepperRepository,
        );
      },
      act: (bloc) => bloc.add(SavedStepperEvent(
        submitEntity: _submitEntity,
      )),
      verify: (_) {
        verify(() => _stepperRepository.saveForm(_submitEntity)).called(1);
      },
      expect: () => [],
    );

    blocTest<StepperBloc, StepperState>(
      'emits [SubmittingStepperState, SubmittedStepperState] when SubmittedStepperEvent is added',
      build: () {
        when(() => _stepperRepository.submit()).thenReturn(_submitEntity);
        return StepperBloc(
          stepperRepository: _stepperRepository,
        );
      },
      act: (bloc) => bloc.add(SubmittedStepperEvent()),
      verify: (_) {
        verify(() => _stepperRepository.submit()).called(1);
      },
      expect: () => [
        SubmittingStepperState(),
        SubmittedStepperState(submitEntity: _submitEntity),
      ],
    );
  });
}
