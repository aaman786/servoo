import 'package:flutter/material.dart';
import 'package:servoo/screens/authentication/sign_in/components/sign_in_form.dart';
import 'package:servoo/screens/authentication/sign_up/sign_up.dart';
import '../../../../global/components/no_acc_text.dart';
import '../../../../global/constants.dart';
import '../../../../global/size_config.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(0)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: SizeConfig.screenHeight * 0.4,
                  decoration: const BoxDecoration(
                    gradient: kPrimaryGradientColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
                    child: Container(
                      alignment: Alignment.center, // use aligment
                      margin: const EdgeInsets.only(right: 8),
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18.0),
                        child: const Image(
                          width: 96,
                          height: 96,
                          fit: BoxFit.contain,
                          image: AssetImage(
                            'assets/images/logo.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(36.0, 250.0, 36.0, 36.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: kSecondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8.0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Welcome Back",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontSize: getProportionateScreenWidth(20),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Signing in as User.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: kTextColorSecondary,
                                    fontSize: getProportionateScreenWidth(14),
                                  ),
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(4)),
                                const SignInForm(),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            NoAccountText(
                a: "Provider",
                b: " Sign In",
                press: () {
                  // Navigator.of(context).pushNamedAndRemoveUntil(
                  //     ProviderSignInScreen.routeName, (route) => false);
                }),
            SizedBox(height: getProportionateScreenHeight(148)),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: NoAccountText(
                  a: "Don’t have an account?",
                  b: " Sign Up",
                  press: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        SignUpScreen.routeName, (route) => false);
                  }),
            ),
            SizedBox(height: getProportionateScreenHeight(48)),
          ],
        ),
      ),
    );
  }
}
