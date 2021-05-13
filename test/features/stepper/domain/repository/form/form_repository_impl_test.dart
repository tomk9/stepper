import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stepper/src/features/stepper/data/storage/form/form_storage.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/validation/validation_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/field/submit_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/submit_entity.dart';
import 'package:stepper/src/features/stepper/domain/repository/form/form_repository.dart';
import 'package:stepper/src/features/stepper/domain/repository/form/form_repository_impl.dart';

import '../../../data/storage/form/form_storage.dart';

void main() {
  late FormStorage _formStorage;
  late FormRepository _formRepository;
  late List<FieldEntity> _fields;
  late SubmitFieldEntity _submitFieldEntity;
  late SubmitEntity _submitEntity;
  late int _index;

  setUp(() {
    _formStorage = MockFormStorage();
    _formRepository = FormRepositoryImpl(formStorage: _formStorage);
    _fields = [
      FieldEntity(
        key: 'key',
        label: 'label',
        validation: ValidationEntity(required: false),
      ),
    ];
    _submitFieldEntity =
        SubmitFieldEntity(key: 'key', label: 'label', required: true);
    _submitEntity = SubmitEntity(
      fields: [
        _submitFieldEntity,
      ],
    );
    _index = 2;
  });

  group('FormRepositoryImpl', () {
    test('initForm should return submitEntity', () {
      when(() => _formStorage.init(_fields)).thenReturn(_submitEntity);
      final result = _formRepository.initForm(_fields);
      verify(() => _formStorage.init(_fields)).called(1);
      expect(result, _submitEntity);
    });

    test('onChanged should return submitEntity', () {
      when(() => _formStorage.onChange(_index, _submitFieldEntity))
          .thenReturn(_submitEntity);
      final result = _formRepository.onChanged(_index, _submitFieldEntity);
      verify(() => _formStorage.onChange(_index, _submitFieldEntity)).called(1);
      expect(result, _submitEntity);
    });
  });
}
