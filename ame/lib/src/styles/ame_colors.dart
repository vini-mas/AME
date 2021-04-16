import 'dart:ui';

class AmeColors {
  static const Color primaryBlue = Color(0xff4361ee);
  static const Color primaryPurple = Color(0xff9d4edd);
  static const Color primarySalmon = Color(0xffff6584);
  static const Color primaryGreen = Color(0xff65ae28);

  static const Color rateGreen = Color(0xff89cf4e);
  static const Color rateYellow = Color(0xffffb843);
  static const Color rateRed = Color(0xfffe2e55);

  static const Color white = Color(0xffffffff);
  static const Color lightGray = Color(0xff7E7E7E);

  static Color getRatingColor(String rate) {
    if (double.parse(rate) >= 4.0) return AmeColors.rateGreen;
    if (double.parse(rate) >= 2.0) return AmeColors.rateYellow;
    return AmeColors.rateRed;
  }
}
