import 'dart:math';

import 'package:flex_color_scheme/flex_color_scheme.dart';

extension RandomFlexScheme on FlexScheme{
  static FlexScheme random() {
    const List<FlexScheme> schemes = FlexScheme.values;
    return schemes[Random().nextInt(schemes.length)];
  }
}