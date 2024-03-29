import 'package:get_it/get_it.dart';
import 'package:stepper/src/common/runner/app_config.dart';
import 'package:stepper/src/features/stepper/data/datasource/stepper_datasource.dart';
import 'package:stepper/src/features/stepper/data/datasource/stepper_datasource_asset.dart';
import 'package:stepper/src/features/stepper/data/storage/form/form_storage.dart';
import 'package:stepper/src/features/stepper/data/storage/form/form_storage_memory.dart';
import 'package:stepper/src/features/stepper/data/storage/stepper/stepper_storage.dart';
import 'package:stepper/src/features/stepper/data/storage/stepper/stepper_storage_memory.dart';
import 'package:stepper/src/features/stepper/domain/repository/form/form_repository.dart';
import 'package:stepper/src/features/stepper/domain/repository/form/form_repository_impl.dart';
import 'package:stepper/src/features/stepper/domain/repository/stepper/stepper_repository.dart';
import 'package:stepper/src/features/stepper/domain/repository/stepper/stepper_repository_impl.dart';

final getIt = GetIt.instance;

void injectDependencies(
  AppConfig appConfig, {
  StepperDatasource? stepperDatasource,
  StepperStorage? stepperStorage,
  StepperRepository? stepperRepository,
  FormStorage? formStorage,
  FormRepository? formRepository,
}) {
  getIt.registerSingleton<AppConfig>(appConfig);
  getIt.registerSingleton<StepperDatasource>(
    stepperDatasource ??
        StepperDatasourceAsset(
          assetName: getIt.get<AppConfig>().datasource,
        ),
  );
  getIt.registerSingleton<StepperStorage>(
    stepperStorage ?? StepperStorageMemory(),
  );
  getIt.registerSingleton<StepperRepository>(
    stepperRepository ??
        StepperRepositoryImpl(
          stepperDatasource: getIt.get<StepperDatasource>(),
          stepperStorage: getIt.get<StepperStorage>(),
        ),
  );
  getIt.registerSingleton<FormStorage>(
    formStorage ?? FormStorageMemory(),
  );
  getIt.registerSingleton<FormRepository>(
    formRepository ??
        FormRepositoryImpl(
          formStorage: getIt.get<FormStorage>(),
        ),
  );
}
