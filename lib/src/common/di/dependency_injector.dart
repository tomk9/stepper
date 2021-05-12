import 'package:get_it/get_it.dart';
import 'package:stepper/src/common/runner/app_config.dart';
import 'package:stepper/src/features/stepper/data/datasource/stepper_datasource.dart';
import 'package:stepper/src/features/stepper/data/datasource/stepper_datasource_asset.dart';
import 'package:stepper/src/features/stepper/domain/repository/stepper_repository.dart';
import 'package:stepper/src/features/stepper/domain/repository/stepper_repository_impl.dart';

final getIt = GetIt.instance;

void injectDependencies(
  AppConfig appConfig, {
  StepperDatasource? stepperDatasource,
  StepperRepository? stepperRepository,
}) {
  getIt.registerSingleton<AppConfig>(appConfig);
  getIt.registerSingleton<StepperDatasource>(
    stepperDatasource ??
        StepperDatasourceAsset(
          assetName: getIt.get<AppConfig>().datasource,
        ),
  );
  getIt.registerSingleton<StepperRepository>(
    stepperRepository ??
        StepperRepositoryImpl(
          stepperDatasource: getIt.get<StepperDatasource>(),
        ),
  );
}
