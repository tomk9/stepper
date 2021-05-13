import 'package:stepper/src/features/stepper/data/storage/stepper/stepper_storage.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/submit_entity.dart';

class StepperStorageMemory implements StepperStorage {
  SubmitEntity _submitEntity = SubmitEntity(
    fields: [],
  );

  @override
  SubmitEntity getFormResult() {
    return _submitEntity;
  }

  @override
  void saveFormResult(SubmitEntity submitEntity) {
    _submitEntity = submitEntity;
  }
}
