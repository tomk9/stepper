import 'package:stepper/src/features/stepper/data/datasource/stepper_datasource.dart';
import 'package:stepper/src/features/stepper/data/storage/stepper/stepper_storage.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/component_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/submit_entity.dart';
import 'package:stepper/src/features/stepper/domain/repository/stepper/stepper_repository.dart';

class StepperRepositoryImpl implements StepperRepository {
  const StepperRepositoryImpl({
    required this.stepperDatasource,
    required this.stepperStorage,
  });

  final StepperDatasource stepperDatasource;
  final StepperStorage stepperStorage;

  @override
  Future<List<ComponentEntity>> getComponentList() async {
    final componentList = await stepperDatasource.getComponentList();
    final componentEntityList =
        componentList.map((e) => ComponentEntity.fromModel(e)).toList();
    return componentEntityList;
  }

  @override
  SubmitEntity submit() {
    final submitEntity = stepperStorage.getFormResult();
    return submitEntity;
  }

  @override
  void saveForm(SubmitEntity submitEntity) {
    stepperStorage.saveFormResult(submitEntity);
  }
}
