import 'dart:io';

import 'package:app_template/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('svg_image_assets assets test', () {
    expect(File(SvgImageAssets.aurora).existsSync(), isTrue);
    expect(File(SvgImageAssets.barrel).existsSync(), isTrue);
    expect(File(SvgImageAssets.wood).existsSync(), isTrue);
  });
}
