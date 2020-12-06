import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:tuto_flutter_golden_tests/main.dart';

void main() {
  testGoldens('DeviceBuilder - one scenario - default devices', (tester) async {
    final builder = DeviceBuilder()
      ..addScenario(
        widget: MyApp(),
        name: 'default page',
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'my_app_single_scenario');
  });

  testGoldens('DeviceBuilder - one scenario - override devices',
      (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(
        widget: MyApp(),
        name: 'default page',
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(
        tester, 'my_app_page_single_scenario_more_devices');
  });

  testGoldens('DeviceBuilder - multiple scenarios - with onCreate',
      (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(
        widget: MyApp(),
        name: 'default page',
      )
      ..addScenario(
        widget: MyApp(),
        name: 'tap once',
        onCreate: (scenarioWidgetKey) async {
          final finder = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byIcon(Icons.add),
          );
          expect(finder, findsOneWidget);
          await tester.tap(finder);
        },
      )
      ..addScenario(
        widget: MyApp(),
        name: 'tap five times',
        onCreate: (scenarioWidgetKey) async {
          final finder = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byIcon(Icons.add),
          );
          expect(finder, findsOneWidget);

          await tester.tap(finder);
          await tester.tap(finder);
          await tester.tap(finder);
          await tester.tap(finder);
          await tester.tap(finder);
        },
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'my_app_page_multiple_scenarios');
  });
}
