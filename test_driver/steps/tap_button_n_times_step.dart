import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class GivenCounterIsSetTo extends Given1WithWorld<String, FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r"the counter is set to {string}");

  Future<void> executeStep(String expectedCounter) async {
    await tapButton(world, timeout!, "increment", int.parse(expectedCounter));
    final locator = find.byValueKey("counter");
    final actualCount =
        await FlutterDriverUtils.getText(world.driver!, locator);
    expectMatch(actualCount, expectedCounter);
  }
}

class TapButtonNTimesStep extends When2WithWorld<String, int, FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r"I tap the {string} button {int} time(?:s|)");

  @override
  Future<void> executeStep(String buttonKey, int amount) async {
    await tapButton(world, timeout!, buttonKey, amount);
  }
}

Future<void> tapButton(
    FlutterWorld world, Duration timeout, String buttonKey, int amount) async {
  final locator = find.byValueKey(buttonKey);
  for (var i = 0; i < amount; i += 1) {
    await FlutterDriverUtils.tap(world.driver, locator, timeout: timeout);
  }
}
