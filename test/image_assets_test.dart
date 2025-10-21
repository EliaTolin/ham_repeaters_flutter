import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_radioamatori/resources/resources.dart';

void main() {
  test('image_assets assets test', () {
    expect(File(ImageAssets.quiz_radioamatori).existsSync(), isTrue);
    expect(File(ImageAssets.battery).existsSync(), isTrue);
    expect(File(ImageAssets.misurations).existsSync(), isTrue);
    expect(File(ImageAssets.share).existsSync(), isTrue);
  });
}
