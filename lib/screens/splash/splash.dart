import 'package:flutter/material.dart';
import 'package:servoo/screens/splash/components/splash_body.dart';
import '../../global/size_config.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/splash";

  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return const Scaffold(
      // backgroundColor: kPrimaryBGColor,
      body: SplashBody(),
    );
  }
}
