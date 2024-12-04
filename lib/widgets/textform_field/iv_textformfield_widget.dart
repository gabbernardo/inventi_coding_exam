import 'package:flutter/material.dart';
import 'package:inventi_coding_exam/utils/color/color_constants.dart';
import 'package:inventi_coding_exam/utils/text_style/text_style.dart';

enum TextFieldType { text, password }

class IvTextFormFieldWidget extends StatefulWidget {
  const IvTextFormFieldWidget(
      {super.key,
      required this.textEditingController,
      required this.labelText,
      required this.hintText,
      this.obscureText = false,
      this.onPressedObscure,
      required this.type});

  final TextEditingController textEditingController;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final void Function()? onPressedObscure;
  final TextFieldType type;

  @override
  State<IvTextFormFieldWidget> createState() => _IvTextFormFieldWidgetState();
}

class _IvTextFormFieldWidgetState extends State<IvTextFormFieldWidget> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.textEditingController.addListener(_onTextChanged);
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    widget.textEditingController.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case TextFieldType.text:
        return _textFieldText();
      case TextFieldType.password:
        return _textFieldPassword();
    }
  }

  Widget _textFieldText() {
    return Container(
      height: 50,
      width: 345,
      decoration: BoxDecoration(
        color: colorNeutral25,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: _isFocused ? colorBrand500 : colorNeutral300,
          // Dynamic border color
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: TextFormField(
          controller: widget.textEditingController,
          style: appStyle(
              type: Styles.bodyTextRegular, textColor: colorNeutral900),
          focusNode: _focusNode,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: widget.hintText,
              labelText: widget.labelText,
              hintStyle: appStyle(
                  type: Styles.bodyTextRegular, textColor: colorNeutral500),
              labelStyle: appStyle(
                  type: Styles.bodyTextRegular,
                  textColor: _isFocused ? colorBrand500 : colorNeutral500),
              border: InputBorder.none,
              suffixIcon: widget.textEditingController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.textEditingController.text.isNotEmpty) {
                            widget.textEditingController.clear();
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: colorNeutral500,
                      ),
                    )
                  : const SizedBox()),
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      height: 50,
      width: 345,
      decoration: BoxDecoration(
        color: colorNeutral25,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: _isFocused ? colorBrand500 : colorNeutral300,
          // Dynamic border color
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: TextFormField(
          controller: widget.textEditingController,
          obscureText: widget.obscureText,
          style: appStyle(
              type: Styles.bodyTextRegular, textColor: colorNeutral900),
          focusNode: _focusNode,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: widget.hintText,
              labelText: widget.labelText,
              hintStyle: appStyle(
                  type: Styles.bodyTextRegular, textColor: colorNeutral500),
              labelStyle: appStyle(
                  type: Styles.bodyTextRegular,
                  textColor: _isFocused ? colorBrand500 : colorNeutral500),
              border: InputBorder.none,
              suffixIcon: IconButton(
                  onPressed: widget.onPressedObscure,
                  icon: widget.obscureText
                      ? const Icon(
                          Icons.visibility,
                          color: colorNeutral500,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          color: colorNeutral500,
                        ))),
        ),
      ),
    );
  }
}
