import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  double getWidth({double divide = 1}) {
    return MediaQuery.of(this).size.width / divide;
  }

  double getHeight({double divide = 1}) {
    return MediaQuery.of(this).size.height / divide;
  }

  double getWidthM({double divide = 1}) {
    return MediaQuery.of(this).size.width * divide;
  }

  double getHeightM({double divide = 1}) {
    return MediaQuery.of(this).size.height * divide;
  }
}
