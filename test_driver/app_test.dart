// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Tipping Calculator App', () {
    FlutterDriver driver;

    // Counter number finder
    final counterNumberFinder = find.byValueKey('counter-num-text');

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('counter is at 0 at the start of the app', () async {
      // Expect the counter number to be '0'
      expect(await driver.getText(counterNumberFinder), '0');
    });
  });
}
