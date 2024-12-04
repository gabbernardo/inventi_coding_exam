import 'package:flutter/material.dart';
import 'package:inventi_coding_exam/utils/color/color_constants.dart';

/// Font Styles
enum Styles {
  /// titlePageBold 20px
  titlePageBold,

  /// bodyTextRegular 12px
  bodyTextRegular,

  /// bodyTextMedium 12px
  bodyTextMedium,

  /// buttonRegular 14px
  buttonRegular,

  /// innerPageBold 16px
  innerPageBold,
}

const String robotoRegular = 'Roboto-Regular';
const String robotoMedium = 'Roboto-Medium';
const String robotoBold = 'Roboto-Bold';

TextStyle appStyle(
    {Styles type = Styles.bodyTextRegular,
      Color textColor = colorSecondary,
      TextDecoration decoration = TextDecoration.none,
      TextOverflow overflow = TextOverflow.ellipsis,
      FontStyle? fontStyle}) {
  String fontFamily = robotoRegular;
  double fontSize = 12;
  double? height;
  switch (type) {
    case Styles.titlePageBold:
      fontSize = 20;
      fontFamily = robotoBold;
    case Styles.bodyTextRegular:
      fontSize = 12;
      fontFamily = robotoRegular;
    case Styles.bodyTextMedium:
      fontSize = 12;
      fontFamily = robotoMedium;
    case Styles.buttonRegular:
      fontSize = 14;
      fontFamily = robotoRegular;
    case Styles.innerPageBold:
      fontSize = 16;
      fontFamily = robotoBold;
  }

  return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: textColor,
      height: height,
      decoration: decoration,
      decorationColor: textColor,
      overflow: overflow,
      fontStyle: fontStyle);
}
