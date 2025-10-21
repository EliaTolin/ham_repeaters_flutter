import 'dart:io';

import 'package:app_template/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('image_assets assets test', () {
    expect(File(ImageAssets.app_template).existsSync(), isTrue);
    expect(File(ImageAssets.battery).existsSync(), isTrue);
    expect(File(ImageAssets.misurations).existsSync(), isTrue);
    expect(File(ImageAssets.share).existsSync(), isTrue);
  });
}
