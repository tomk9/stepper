import 'package:stepper/src/features/stepper/data/datasource/stepper_datasource.dart';
import 'package:stepper/src/features/stepper/data/storage/form_storage.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/component_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/field/submit_field_entity.dart';
import 'package:stepper/src/features/stepper/domain/entity/submit/submit_entity.dart';
import 'package:stepper/src/features/stepper/domain/repository/stepper_repository.dart';

class StepperRepositoryImpl implements StepperRepository {
  const StepperRepositoryImpl({
    required this.stepperDatasource,
  });

  final StepperDatasource stepperDatasource;

  @override
  Future<List<ComponentEntity>> getComponentList() async {
    final componentList = await stepperDatasource.getComponentList();
    final componentEntityList =
        componentList.map((e) => ComponentEntity.fromModel(e)).toList();
    return componentEntityList;
  }

  // @override
  // Future<SubmitEntity> submit() async {
  //   final submitEntity = formStorage.getSubmitEntity();
  //   return submitEntity;
  // }
  //
  // @override
  // Future<SubmitEntity> onChanged(
  //   int index,
  //   SubmitFieldEntity submitFieldEntity,
  // ) async {
  //   final submitEntity = formStorage.onChange(index, submitFieldEntity);
  //   return submitEntity;
  // }
}
