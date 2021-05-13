import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/form_builder_component_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/field/submit_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/submit_entity.dart';
import 'package:stepper/src/features/stepper/domain/repository/form/form_repository.dart';

part 'form_builder_event.dart';

part 'form_builder_state.dart';

class FormBuilderBloc extends Bloc<FormBuilderEvent, FormBuilderState> {
  FormBuilderBloc({
    required this.formRepository,
  }) : super(FormBuilderState(
          submitEntity: SubmitEntity(
            fields: [],
          ),
        ));

  final FormRepository formRepository;

  @override
  Stream<FormBuilderState> mapEventToState(
    FormBuilderEvent event,
  ) async* {
    if (event is InitFormBuilderEvent) {
      yield* _mapInitFormBuilderEventToState(event);
    } else if (event is ChangedFormBuilderEvent) {
      yield* _mapChangedFormBuilderEventToState(event);
    }
  }

  Stream<FormBuilderState> _mapInitFormBuilderEventToState(
      InitFormBuilderEvent event) async* {
    final submitEntity =
        formRepository.initForm(event.formBuilderComponentEntity.fields);
    yield FormBuilderState(
      submitEntity: submitEntity,
    );
  }

  Stream<FormBuilderState> _mapChangedFormBuilderEventToState(
      ChangedFormBuilderEvent event) async* {
    final submitEntity =
        formRepository.onChanged(event.index, event.submitFieldEntity);
    yield FormBuilderState(
      submitEntity: submitEntity,
    );
  }
}
