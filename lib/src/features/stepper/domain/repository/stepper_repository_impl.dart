import 'package:stepper/src/features/stepper/data/datasource/stepper_datasource.dart';
import 'package:stepper/src/features/stepper/domain/entity/component/component_entity.dart';
import 'package:stepper/src/features/stepper/domain/repository/stepper_repository.dart';

class StepperRepositoryImpl implements StepperRepository {
  const StepperRepositoryImpl({
    required this.stepperDatasource,
  });

  final StepperDatasource stepperDatasource;

  @override
  Future<List<ComponentEntity>> getComponentList() async {
    final componentList = await stepperDatasource.getComponentList();
    return componentList.map((e) => ComponentEntity.fromModel(e)).toList();
  }
}
