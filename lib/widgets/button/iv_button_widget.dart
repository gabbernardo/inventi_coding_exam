import 'package:flutter/material.dart';
import 'package:inventi_coding_exam/utils/color/color_constants.dart';
import 'package:inventi_coding_exam/widgets/text/text_widget.dart';

enum ButtonType {primary, secondary}

class IvButtonWidget extends StatefulWidget {
  const IvButtonWidget({super.key, required this.type, required this.onPressed, required this.buttonLabel, this.icon});

  final ButtonType type;
  final void Function()? onPressed;
  final String buttonLabel;
  final IconData? icon;

  @override
  State<IvButtonWidget> createState() => _IvButtonWidgetState();
}

class _IvButtonWidgetState extends State<IvButtonWidget> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case ButtonType.primary:
        return _primaryButton();
      case ButtonType.secondary:
        return _secondaryButton();
    }
  }

  Widget _primaryButton () {
    return SizedBox(
      width: 345,
      height: 50,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          backgroundColor: colorButton
        ),
        child: ButtonRegularText(text: widget.buttonLabel),
      ),
    );

  }

  Widget _secondaryButton () {
    return SizedBox(
      width: 345,
      height: 36,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          backgroundColor: colorBrand25
        ),
        child: InnerPageBoldText(text: widget.buttonLabel, color: colorBrand900,)
      ),
    );

  }
}
