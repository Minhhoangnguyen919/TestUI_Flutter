import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:test_ui/view/my_home_view.dart';

void main() {
  ///  run test command line: flutter test --update-goldens
  ///  Test UI
  testGoldens('TestView', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
      ])
      ..addScenario(
        widget: const MyHomeView(),
        name: 'My Home',
      );
    await tester.pumpDeviceBuilder(
      builder,
      wrapper: materialAppWrapper(
        theme: ThemeData.light(),
      ),
    );
    await screenMatchesGolden(tester, 'test');
  });
}
