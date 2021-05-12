import 'package:flutter/material.dart';
import 'package:stepper/src/common/di/dependency_injector.dart';
import 'package:stepper/src/common/runner/app_config.dart';
import 'package:stepper/src/features/application/presentation/component/stepper_app.dart';

void runApplication(
  AppConfig appConfig,
) {
  injectDependencies(
    appConfig,
  );
  runApp(
    const StepperApp(),
  );
}
