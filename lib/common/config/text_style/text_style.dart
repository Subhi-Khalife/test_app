import 'package:flutter/cupertino.dart';

class FontTextStyle {
  // static TextStyle thin({required double fontSize, required Color color}) {
  //   return TextStyle(
  //     fontSize: fontSize,
  //     color: color,
  //     fontFamily: "roboto_thin",
  //     height: 1.2,
  //   );
  // }

  // static TextStyle thinItalic({required double fontSize, required Color color}) {
  //   return TextStyle(
  //     fontSize: fontSize,
  //     color: color,
  //     fontFamily: "roboto_thin_italic",
  //     height: 1.2,
  //   );
  // }

  static TextStyle regular(
      {required double fontSize, required Color color, TextDecoration? textDecoration}) {
    return TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: "SourceSansPro-Regular",
        height: 1.2,
        decoration: textDecoration ?? TextDecoration.none);
  }

  // static TextStyle meduim({required double fontSize, required Color color}) {
  //   return TextStyle(
  //     fontSize: fontSize,
  //     color: color,
  //     fontFamily: "roboto_medium",
  //     height: 1.2,
  //   );
  // }

  // static TextStyle mediumItalic({required double fontSize, required Color color}) {
  //   return TextStyle(
  //     fontSize: fontSize,
  //     color: color,
  //     fontFamily: "roboto_medium_italic",
  //     height: 1.2,
  //   );
  // }

  static TextStyle extraLight({required double fontSize, required Color color}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "SourceSansPro-ExtraLight",
      height: 1.2,
    );
  }

  static TextStyle light({required double fontSize, required Color color}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "SourceSansPro-Light",
      height: 1.2,
    );
  }

  static TextStyle lightItalic({required double fontSize, required Color color}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "SourceSansPro-LightItalic",
      height: 1.2,
    );
  }

  static TextStyle italic({required double fontSize, required Color color}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "SourceSansPro-Italic",
      height: 1.2,
    );
  }

  static TextStyle boldItalic({required double fontSize, required Color color}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "SourceSansPro-BoldItalic",
      height: 1.2,
    );
  }

  static TextStyle semiBoldItalic({required double fontSize, required Color color}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "SourceSansPro-SemiBoldItalic",
      height: 1.2,
    );
  }

  static TextStyle semiBold(
      {required double fontSize, required Color color, TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "SourceSansPro-SemiBold",
      height: 1.2,
      decoration: textDecoration,
    );
  }

  static TextStyle bold(
      {required double fontSize, required Color color, TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "SourceSansPro-Bold",
      height: 1.2,
      decoration: textDecoration,
    );
  }

  static TextStyle heavy({required double fontSize, required Color color}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "SourceSansPro-Heavy",
      height: 1.2,
    );
  }

  static TextStyle medium(
      {required double fontSize, required Color color, TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "SourceSansPro-Medium",
      height: 1.2,
      decoration: textDecoration,
    );
  }

  static TextStyle black({required double fontSize, required Color color}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "SourceSansPro-Black",
      height: 1.2,
    );
  }

  static TextStyle blackItalic({required double fontSize, required Color color}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "SourceSansPro-BlackItalic",
      height: 1.2,
    );
  }
}
