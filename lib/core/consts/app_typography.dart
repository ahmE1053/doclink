import 'package:flutter/material.dart';

class AppTypography {
  static TextStyle headlineSize(BuildContext context) => TextStyle(
      fontSize: MediaQuery.of(context).size.width * 0.08,
      fontWeight: FontWeight.w800);

  static TextStyle semiHeadlineSize(BuildContext context, [Color? color]) =>
      TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.065,
          fontWeight: FontWeight.w600,
          color: color ?? Colors.black);

  static TextStyle bodySize(BuildContext context, [Color? color]) => TextStyle(
      fontSize: MediaQuery.of(context).size.width * 0.05,
      color: color ?? Colors.black);

  static TextStyle smallSize(BuildContext context) => TextStyle(
      fontSize: MediaQuery.of(context).size.width * 0.03,
      fontWeight: FontWeight.w300);
}
