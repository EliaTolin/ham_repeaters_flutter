import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_radioamatori/resources/resources.dart';

void main() {
  test('svg_image_assets assets test', () {
    expect(File(SvgImageAssets.aurora).existsSync(), isTrue);
    expect(File(SvgImageAssets.barrel).existsSync(), isTrue);
    expect(File(SvgImageAssets.wood).existsSync(), isTrue);
  });
}
