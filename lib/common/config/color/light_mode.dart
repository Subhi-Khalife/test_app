import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'main_colors.dart';

// ignore: must_be_immutable
class LightModeTheme extends Equatable implements MainColors {
  static const int _primaryPrimaryValue = 0xffDF0909;
  static const int _naturalPrimaryValue = 0xff9e9e9e;
  static const int _secondaryPrimaryValue = 0xfff2ba49;
  static const int _wrongPrimaryValue = 0xfff2ca79;
  static const int _semanticSecondaryPrimaryValue = 0xff35b23e;
  @override
  MaterialColor danger = const MaterialColor(
    0xffd12a2a,
    <int, Color>{
      50: Color(0xfffbe9e9),
      100: Color(0xffd12a2a),
      200: Color(0xff7d1919),
    },
  );

  @override
  MaterialColor natural = const MaterialColor(
    _naturalPrimaryValue,
    <int, Color>{
      50: Color(0xffffffff),
      100: Color(0xfff5f5f5),
      200: Color(0xffF9F9F9),
      300: Color(0xffe0e0e0),
      500: Color(0xffBEBEC0),
      600: Color(0xffE8E8E8),
      700: Color(0xff9D999B),
      800: Color(0xff2A2526),
      900: Color(0xff1D1D1D),
    },
  );

  @override
  MaterialColor primary = const MaterialColor(
    _primaryPrimaryValue,
    <int, Color>{
      100: Color(0xffF05148),
      200: Color(0xffFC7F78),
      300: Color(0xff132F56),
      400: Color(0xffC7C7C7),
      700: Color(_primaryPrimaryValue),
      800: Color(0xff48C8F0),
      900: Color(0xff0a1933),
    },
  );
  @override
  MaterialColor secondary = const MaterialColor(
    _secondaryPrimaryValue,
    <int, Color>{
      100: Color(0xffE0E0E0),
      400: Color(0xfffae569),
      700: Color(_secondaryPrimaryValue),
      900: Color(0xffbf923a),
    },
  );

  @override
  MaterialColor semanticSecondary = const MaterialColor(
    _semanticSecondaryPrimaryValue,
    <int, Color>{
      50: Color(0xffeaf7eb),
      100: Color(_semanticSecondaryPrimaryValue),
      200: Color(0xff1f6b25),
    },
  );

  @override
  MaterialColor wrong = const MaterialColor(
    _wrongPrimaryValue,
    <int, Color>{
      50: Color(0xfffff7e6),
      100: Color(_wrongPrimaryValue),
      200: Color(0xff917948),
    },
  );

  @override
  Color scaffoldBlackColor = const Color(_primaryPrimaryValue);

  @override
  Color scaffoldWhiteColor = const Color(0xfff5f5f5);

  @override
  Color ratingColor = Color(0xffF6AC00);

  @override
  Color successColor = Color(0xff00C570);

  @override
  Color dangerColor = Color(0xffD50000);

  @override
  // TODO: implement props
  List<Object?> get props => [
        dangerColor,
        successColor,
        ratingColor,
        scaffoldWhiteColor,
        scaffoldBlackColor,
        wrong,
        semanticSecondary,
        secondary,
        primary,
        natural,
        danger,
      ];

  // @override
  // Color textFieldsBorderColor = Color(0xffE0E0E0);
}
