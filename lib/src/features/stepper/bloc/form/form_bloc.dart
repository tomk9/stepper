import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stepper/src/features/stepper/bloc/stepper/stepper_bloc.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/form_builder_component_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/field/submit_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/submit_entity.dart';
import 'package:stepper/src/features/stepper/domain/repository/form/form_repository.dart';

part 'form_event.dart';

part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc({
    required this.stepperBloc,
    required this.formRepository,
  }) : super(FormState(
          submitEntity: SubmitEntity(
            fields: [],
          ),
        ));

  final StepperBloc stepperBloc;
  final FormRepository formRepository;

  @override
  Stream<FormState> mapEventToState(
    FormEvent event,
  ) async* {
    if (event is InitFormEvent) {
      yield* _mapInitFormEventToState(event);
    } else if (event is ChangedFormEvent) {
      yield* _mapChangedFormEventToState(event);
    }
  }

  Stream<FormState> _mapInitFormEventToState(InitFormEvent event) async* {
    final submitEntity =
        formRepository.initForm(event.formBuilderComponentEntity.fields);
    yield FormState(
      submitEntity: submitEntity,
    );
  }

  Stream<FormState> _mapChangedFormEventToState(ChangedFormEvent event) async* {
    final submitEntity =
        formRepository.onChanged(event.index, event.submitFieldEntity);
    yield FormState(
      submitEntity: submitEntity,
    );
  }
}
