import 'package:flutter_test/flutter_test.dart';
import 'package:stepper/src/common/asset/app_asset.dart';
import 'package:stepper/src/common/di/dependency_injector.dart';
import 'package:stepper/src/common/runner/app_config.dart';
import 'package:stepper/src/common/runner/app_flavor.dart';

import 'package:stepper/src/features/application/presentation/component/stepper_app.dart';

void main() {
  testWidgets('Stepper initial page test', (WidgetTester tester) async {
    final appConfig = AppConfig(
      flavor: AppFlavor.dev,
      datasource: AppAsset.devPayload,
    );
    injectDependencies(appConfig);

    // Build our app and trigger a frame.
    await tester.pumpWidget(const StepperApp());

    // Verify that Stepper page is visible.
    expect(find.text('Stepper'), findsOneWidget);
    expect(find.text('Summary'), findsNothing);
  });
}
