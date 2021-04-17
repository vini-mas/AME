import 'package:flutter/cupertino.dart';

class AmeSize {
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getSideSpacing(BuildContext context) {
    final _width = getWidth(context);
    return _width / 6 <= 36 ? _width / 6 : 36;
  }
}
