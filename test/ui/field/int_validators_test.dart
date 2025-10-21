import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_radioamatori/common/widgets/form/validators/int_validators.dart';

void main() {
  group('int validators', () {
    test('isNull - not required', () {
      const value = '1';
      final result = intValidator(value, false);
      expect(result, isNull);
    });

    test('isNull - required', () {
      const value = '1';
      final result = intValidator(value, true);
      expect(result, isNull);
    });

    test('empty - required', () {
      const value = '';
      final result = intValidator(value, true);
      expect(result, isNotNull);
    });

    test('empty - not required', () {
      const value = '';
      final result = intValidator(value, false);
      expect(result, isNull);
    });

    test('text - not required', () {
      const value = 'dedede';
      final result = intValidator(value, false);
      expect(result, isNotNull);
    });

    test('text - required', () {
      const value = 'dedede';
      final result = intValidator(value, true);
      expect(result, isNotNull);
    });

    test('number - required', () {
      const value = '02';
      final result = intValidator(value, true);
      expect(result, isNull);
    });

    test('number - not required', () {
      const value = '03';
      final result = intValidator(value, false);
      expect(result, isNull);
    });
  });
}
