import 'package:stepper/src/features/stepper/data/storage/form/form_storage.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/field/submit_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/submit_entity.dart';

class FormStorageMemory implements FormStorage {
  SubmitEntity _submitEntity = SubmitEntity(fields: []);

  @override
  SubmitEntity getSubmitEntity() {
    return _submitEntity;
  }

  @override
  SubmitEntity init(List<FieldEntity> fields) {
    _submitEntity = SubmitEntity(
      fields: fields
          .map(
            (e) => SubmitFieldEntity.fromFieldAndValue(e, null),
          )
          .toList(),
    );
    return _submitEntity;
  }

  @override
  SubmitEntity onChange(int index, SubmitFieldEntity submitFieldEntity) {
    final fields = _submitEntity.fields;
    fields[index] = submitFieldEntity;
    _submitEntity = SubmitEntity(fields: fields);
    return _submitEntity;
  }
}
