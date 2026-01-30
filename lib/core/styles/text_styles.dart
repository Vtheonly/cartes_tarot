import 'package:flutter/material.dart';

import 'font_sizes.dart';
import 'fonts.dart';

/// TextStyles - All the core text styles for the app should be declared here.
/// Don't try and create every variant in existence here, just the high level ones.
/// More specific variants can be created on the fly using `style.copyWith()`
/// `newStyle = TextStyles.body1.copyWith(lineHeight: 2, color: Colors.red)`
class TextStyles {
  /// Declare a base style for each Family
  static const TextStyle plusJakarta = TextStyle(
      fontFamily: Fonts.plusJakarta, fontWeight: FontWeight.w400, height: 1);

  static TextStyle get h1 => plusJakarta.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: FontSizes.s48,
      letterSpacing: -1,
      height: 1.17);
  static TextStyle get h2 =>
      h1.copyWith(fontSize: FontSizes.s24, letterSpacing: -.5, height: 1.16);
  static TextStyle get h3 =>
      h1.copyWith(fontSize: FontSizes.s14, letterSpacing: -.05, height: 1.29);
  static TextStyle get title1 => plusJakarta.copyWith(
      fontWeight: FontWeight.bold, fontSize: FontSizes.s16, height: 1.31);
  static TextStyle get title2 => title1.copyWith(
      fontWeight: FontWeight.w500, fontSize: FontSizes.s14, height: 1.36);
  static TextStyle get body1 => plusJakarta.copyWith(
      fontWeight: FontWeight.normal, fontSize: FontSizes.s14, height: 1.71);
  static TextStyle get body2 =>
      body1.copyWith(fontSize: FontSizes.s12, height: 1.5, letterSpacing: .2);
  static TextStyle get body3 => body1.copyWith(
      fontSize: FontSizes.s12, height: 1.5, fontWeight: FontWeight.bold);
  static TextStyle get callout1 => plusJakarta.copyWith(
      fontWeight: FontWeight.w800,
      fontSize: FontSizes.s12,
      height: 1.17,
      letterSpacing: .5);
  static TextStyle get callout2 =>
      callout1.copyWith(fontSize: FontSizes.s10, height: 1, letterSpacing: .25);
  static TextStyle get caption => plusJakarta.copyWith(
      fontWeight: FontWeight.w500, fontSize: FontSizes.s11, height: 1.36);
}
