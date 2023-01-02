import 'package:flutter/material.dart';
import 'package:servoo/screens/authentication/sign_up/components/signup_body.dart';
import 'package:servoo/global/keyboard.dart';
import 'package:servoo/global/size_config.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "/sign_up";

  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        KeyboardUtil.hideKeyboard(context);
      },
      child: Scaffold(
        body: SignUpBody(),
      ),
    );
  }
}
