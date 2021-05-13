import 'package:flutter_test/flutter_test.dart';
import 'package:stepper/src/features/stepper/data/storage/form/form_storage.dart';
import 'package:stepper/src/features/stepper/data/storage/form/form_storage_memory.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/validation/validation_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/field/submit_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/submit_entity.dart';

void main() {
  late FormStorage _formStorage;
  late List<FieldEntity> _fields;
  late SubmitFieldEntity _submitFieldEntity;
  late SubmitEntity _submitEntity;
  late int _index;
  late SubmitFieldEntity _changedSubmitFieldEntity;
  late SubmitEntity _changedSubmitEntity;

  setUp(() {
    _formStorage = FormStorageMemory();
    _fields = [
      FieldEntity(
        key: 'key',
        label: 'label',
        validation: ValidationEntity(required: false),
      ),
    ];
    _submitFieldEntity =
        SubmitFieldEntity(key: 'key', label: 'label', required: false);
    _submitEntity = SubmitEntity(
      fields: [
        _submitFieldEntity,
      ],
    );
    _index = 0;
    _changedSubmitFieldEntity = SubmitFieldEntity(
        key: 'key', label: 'label', required: false, value: {'value'});
    _changedSubmitEntity = SubmitEntity(
      fields: [
        _changedSubmitFieldEntity,
      ],
    );
  });

  group('FormStorageMemory', () {
    test('init should return submitEntity', () {
      final result = _formStorage.init(_fields);
      expect(result, _submitEntity);
    });

    test('onChange should return submitEntity', () {
      final result = _formStorage.init(_fields);
      expect(result, _submitEntity);
      final changedResult =
          _formStorage.onChange(_index, _changedSubmitFieldEntity);
      expect(changedResult, _changedSubmitEntity);
    });

    test('getSubmitEntity should return submitEntity', () {
      final result = _formStorage.init(_fields);
      expect(result, _submitEntity);
      final gotResult = _formStorage.getSubmitEntity();
      expect(gotResult, _submitEntity);
    });
  });
}
