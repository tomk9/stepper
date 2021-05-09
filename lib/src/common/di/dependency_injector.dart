import 'package:get_it/get_it.dart';
import 'package:stepper/src/common/runner/app_config.dart';

final getIt = GetIt.instance;

void injectDependencies(AppConfig appConfig) {
  getIt.registerSingleton<AppConfig>(appConfig);
}
