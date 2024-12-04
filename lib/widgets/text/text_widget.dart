import 'package:flutter/material.dart';
import 'package:inventi_coding_exam/utils/color/color_constants.dart';
import 'package:inventi_coding_exam/utils/text_style/text_style.dart';


abstract class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
        required this.text,
        this.color = colorSecondary,
        this.textAlign = TextAlign.left,
        this.maxLines = 1,
        this.overflow = TextOverflow.ellipsis,
        this.decoration = TextDecoration.none,
        this.fontStyle,
        required this.style});

  final String text;
  final Color color;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final TextDecoration decoration;
  final FontStyle? fontStyle;

  final Styles style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: appStyle(
        type: style,
        textColor: color,
        decoration: decoration,
        overflow: overflow,
        fontStyle: fontStyle,
      ),
    );
  }
}

/// TitlePageText 20px
class TitlePageText extends TextWidget {
  const TitlePageText(
      {super.key,
        required super.text,
        super.color = colorSecondary,
        super.textAlign = TextAlign.left,
        super.maxLines = 1,
        super.overflow = TextOverflow.ellipsis,
        super.decoration = TextDecoration.none})
      : super(style: Styles.titlePageBold);
}

/// BodyText 12px
class BodyText extends TextWidget {
  const BodyText(
      {super.key,
        required super.text,
        super.color = colorSecondary,
        super.textAlign = TextAlign.left,
        super.maxLines = 1,
        super.overflow = TextOverflow.ellipsis,
        super.decoration = TextDecoration.none})
      : super(style: Styles.bodyTextRegular);
}

/// BodyTextMedium 14px
class BodyTextMedium extends TextWidget {
  const BodyTextMedium(
      {super.key,
        required super.text,
        super.color = colorSecondary,
        super.textAlign = TextAlign.left,
        super.maxLines = 1,
        super.overflow = TextOverflow.ellipsis,
        super.decoration = TextDecoration.none})
      : super(style: Styles.bodyTextMedium);
}

/// ButtonRegularText 14px
class ButtonRegularText extends TextWidget {
  const ButtonRegularText(
      {super.key,
        required super.text,
        super.color = colorSecondary,
        super.textAlign = TextAlign.left,
        super.maxLines = 1,
        super.overflow = TextOverflow.ellipsis,
        super.decoration = TextDecoration.none})
      : super(style: Styles.buttonRegular);
}

/// InnerPageBoldText 16px
class InnerPageBoldText extends TextWidget {
  const InnerPageBoldText(
      {super.key,
        required super.text,
        super.color = colorSecondary,
        super.textAlign = TextAlign.left,
        super.maxLines = 1,
        super.overflow = TextOverflow.ellipsis,
        super.decoration = TextDecoration.none})
      : super(style: Styles.innerPageBold);
}
