import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inventi_coding_exam/screens/splash_screen/splash_screen.dart';
import 'package:inventi_coding_exam/utils/color/color_constants.dart';
import 'package:inventi_coding_exam/utils/route/route_constants.dart';
import 'package:inventi_coding_exam/widgets/button/iv_button_widget.dart';
import 'package:inventi_coding_exam/widgets/text/text_widget.dart';
import 'package:inventi_coding_exam/widgets/textform_field/iv_textformfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailAddController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;

  void _validateTextFields(BuildContext context) {
    if (_emailAddController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      context.goNamed(routeHomepage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/img_login_background.png'),
            colorFilter: ColorFilter.mode(
              colorOverlayInImage,
              BlendMode.srcOver,
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitlePageText(text: 'Sign In'),
              const SizedBox(
                height: 24.0,
              ),
              IvTextFormFieldWidget(
                textEditingController: _emailAddController,
                labelText: 'Email Address',
                hintText: 'Enter your email address',
                type: TextFieldType.text,
              ),
              const SizedBox(
                height: 24.0,
              ),
              IvTextFormFieldWidget(
                textEditingController: _passwordController,
                labelText: 'Password',
                hintText: 'Enter your password',
                type: TextFieldType.password,
                obscureText: !_showPassword,
                onPressedObscure: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              ),
              const SizedBox(
                height: 32.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ButtonRegularText(text: 'Forgot Password?'),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              IvButtonWidget(
                  type: ButtonType.primary,
                  onPressed: () => _validateTextFields(context),
                  buttonLabel: 'Login'),
              const SizedBox(
                height: 32.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ButtonRegularText(text: 'Don\'t have an account?'),
                  SizedBox(
                    width: 12.0,
                  ),
                  ButtonRegularText(text: 'Sign up here'),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              Image.asset(
                'assets/images/img_powered_by_inventi.png',
                height: 43.56,
                width: 113.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
