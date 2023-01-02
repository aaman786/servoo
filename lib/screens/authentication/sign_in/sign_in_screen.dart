import 'package:flutter/material.dart';
import 'package:servoo/screens/authentication/sign_in/components/sign_in_body.dart';
import 'package:servoo/global/size_config.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = "/sign_in";
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: SignInBody(),
    );
  }
}
