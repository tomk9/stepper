import 'package:stepper/src/features/stepper/data/storage/form/form_storage.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/field/field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/field/submit_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/submit_entity.dart';
import 'package:stepper/src/features/stepper/domain/repository/form/form_repository.dart';

class FormRepositoryImpl implements FormRepository {
  const FormRepositoryImpl({
    required this.formStorage,
  });

  final FormStorage formStorage;

  @override
  SubmitEntity initForm(List<FieldEntity> fields) {
    final submitEntity = formStorage.init(fields);
    return submitEntity;
  }

  @override
  SubmitEntity onChanged(int index, SubmitFieldEntity submitFieldEntity) {
    final submitEntity = formStorage.onChange(index, submitFieldEntity);
    return submitEntity;
  }
}
