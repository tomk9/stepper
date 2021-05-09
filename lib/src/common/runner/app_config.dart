import 'package:flutter/foundation.dart';
import 'package:stepper/src/common/runner/app_flavor.dart';

@immutable
class AppConfig {
  const AppConfig({
    required this.flavor,
    required this.datasource,
  });

  final AppFlavor flavor;
  final String datasource;
}
