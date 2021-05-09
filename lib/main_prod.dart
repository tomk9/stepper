import 'package:stepper/src/common/asset/app_asset.dart';
import 'package:stepper/src/common/runner/app_config.dart';
import 'package:stepper/src/common/runner/app_flavor.dart';
import 'package:stepper/src/common/runner/app_runner.dart';

void main() {
  final appConfig = AppConfig(
    flavor: AppFlavor.prod,
    datasource: AppAsset.prodPayload,
  );
  runApplication(appConfig);
}
