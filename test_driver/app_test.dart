// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Tipping Calculator App', () {
    FlutterDriver driver;

    // Initialize finders
    final tipAmountTextFinder = find.byValueKey('tip-text');
    final textFormFieldFinder = find.byValueKey('textformfield');
    final firstButtonFinder = find.byValueKey('15-button');
    final secondButtonFinder = find.byValueKey('20-button');
    final thirdButtonFinder = find.byValueKey('25-button');

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

    test('On input 50 expect 15% to be 7.5', () async {
      // When I input 50
      driver.tap(textFormFieldFinder);
      driver.enterText('50');

      // and I tap 15%, I see "Tip amount: 7.5"
      driver.tap(firstButtonFinder);
      expect(await driver.getText(tipAmountTextFinder), "Tip amount: 7.5");
    });

    test('On input 50 expect 20% to be 10.0', () async {
      // When I input 50
      driver.tap(textFormFieldFinder);
      driver.enterText('50');

      // and I tap 20%, I see "Tip amount: 10.0"
      driver.tap(secondButtonFinder);
      expect(await driver.getText(tipAmountTextFinder), "Tip amount: 10.0");
    });

    test('On input 50 expect 25% to be 12.5', () async {
      // When I input 50
      driver.tap(textFormFieldFinder);
      driver.enterText('50');

      // and I tap 25%, I see "Tip amount: 12.5"
      driver.tap(thirdButtonFinder);
      expect(await driver.getText(tipAmountTextFinder), "Tip amount: 12.5");
    });
  });
}
