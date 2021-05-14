// @dart=2.9
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:stepper/main.dart' as app;
import 'package:stepper/src/features/stepper/presentation/component/stepper/component/form/form_checkbox_group_field.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/component/form/form_text_field.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/component/form_builder_component.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/component/static_component.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/component/submit_component.dart';
import 'package:stepper/src/features/stepper/presentation/component/stepper/component/text_component.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('happy path', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(
      find.byWidgetPredicate(
        (Widget widget) => widget is Text && widget.data == 'Stepper',
      ),
      findsOneWidget,
    );
    await tester.pump(Duration(seconds: 1));

    expect(
      find.byKey(
        Key(StaticComponentKey.flutterLogo),
      ),
      findsOneWidget,
    );

    await tester.tap(find.byKey(Key(StaticComponentKey.forwardButton)));
    await tester.pumpAndSettle(Duration(seconds: 1));

    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is Text && widget.data == 'text which should i see in app',
      ),
      findsOneWidget,
    );

    await tester.tap(find.byKey(Key(TextComponentKey.forwardButton)));
    await tester.pumpAndSettle(Duration(seconds: 1));

    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is Text && widget.data == 'text which should i see in app',
      ),
      findsNothing,
    );

    await tester.tap(find.byKey(Key(TextComponentKey.forwardButton)));
    await tester.pumpAndSettle(Duration(seconds: 1));

    await tester.tap(find.byKey(Key(
      '${FormCheckboxGroupFieldKey.checkboxListTile}_Niebieski',
    )));
    await tester.pumpAndSettle();

    await tester.enterText(
        find.byKey(Key(FormTextFieldKey.textFormField)), 'Tomek');
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(Key(FormBuilderComponentKey.forwardButton)));
    await tester.pumpAndSettle(Duration(seconds: 1));

    await tester.tap(find.byKey(Key(SubmitComponentKey.submitButton)));
    await tester.pumpAndSettle(Duration(seconds: 1));

    expect(
      find.byWidgetPredicate(
        (Widget widget) => widget is Text && widget.data == 'Summary',
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is Text && widget.data == 'Jakie kolory lubisz? : Niebieski',
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is Text && widget.data == 'Jak masz na imię ?: Tomek',
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (Widget widget) => widget is Text && widget.data == 'Płeć:',
      ),
      findsOneWidget,
    );
  });
}
