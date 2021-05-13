import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stepper/src/features/stepper/bloc/form_builder/form_builder_bloc.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/form_builder_component_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/field/submit_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/submit_entity.dart';
import 'package:stepper/src/features/stepper/domain/repository/form/form_repository.dart';
import 'package:test/test.dart';

import '../../domain/repository/form/form_repository.dart';

void main() {
  late FormRepository _formRepository;
  late SubmitFieldEntity _submitFieldEntity;
  late FormBuilderComponentEntity _formBuilderComponentEntity;
  late SubmitEntity _submitEntity;
  late int _index;

  setUp(() {
    _formRepository = MockFormRepository();
    _formBuilderComponentEntity =
        FormBuilderComponentEntity(id: 'id', fields: []);
    _submitFieldEntity =
        SubmitFieldEntity(key: 'key', label: 'label', required: true);
    _submitEntity = SubmitEntity(
      fields: [
        _submitFieldEntity,
      ],
    );
    _index = 2;
  });

  group('FormBuilderBloc', () {
    blocTest<FormBuilderBloc, FormBuilderState>(
      'emits [] when nothing is added',
      build: () => FormBuilderBloc(
        formRepository: _formRepository,
      ),
      expect: () => [],
    );

    blocTest<FormBuilderBloc, FormBuilderState>(
      'emits [FormBuilderState] when InitFormBuilderEvent is added',
      build: () {
        when(() => _formRepository.initForm(_formBuilderComponentEntity.fields))
            .thenReturn(_submitEntity);
        return FormBuilderBloc(
          formRepository: _formRepository,
        );
      },
      act: (bloc) => bloc.add(InitFormBuilderEvent(
        formBuilderComponentEntity: _formBuilderComponentEntity,
      )),
      verify: (_) {
        verify(() =>
                _formRepository.initForm(_formBuilderComponentEntity.fields))
            .called(1);
      },
      expect: () => [
        FormBuilderState(submitEntity: _submitEntity),
      ],
    );

    blocTest<FormBuilderBloc, FormBuilderState>(
      'emits [FormBuilderState] when ChangedFormBuilderEvent is added',
      build: () {
        when(() => _formRepository.onChanged(
              _index,
              _submitFieldEntity,
            )).thenReturn(_submitEntity);
        return FormBuilderBloc(
          formRepository: _formRepository,
        );
      },
      act: (bloc) => bloc.add(ChangedFormBuilderEvent(
        index: _index,
        submitFieldEntity: _submitFieldEntity,
      )),
      verify: (_) {
        verify(() => _formRepository.onChanged(
              _index,
              _submitFieldEntity,
            )).called(1);
      },
      expect: () => [
        FormBuilderState(submitEntity: _submitEntity),
      ],
    );
  });
}
