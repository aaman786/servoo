import 'package:flutter/material.dart';
import 'package:servoo/global/components/custom_elevated_btn.dart';
import 'package:servoo/screens/authentication/authentication_services.dart';

import '../../../../global/constants.dart';
import '../../../../global/size_config.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  // Initially password is obscure
  bool _obscureText = true;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  TextEditingController emailctrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();

  @override
  void dispose() {
    emailctrl.dispose();
    passwordctrl.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   // error = false;
  //   // sending = false;
  //   // success = false;
  //   // msg = "";
  //   // if (box!.containsKey("login")) {
  //   //   Future.delayed(Duration.zero, () {
  //   //     Navigator.of(context)
  //   //         .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
  //   //   });

  //   //   isLogin = true;
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(8)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(12)),
          // Row(
          //   children: [
          //     Checkbox(
          //       value: remember,
          //       activeColor: kPrimaryColor,
          //       onChanged: (value) {
          //         setState(() {
          //           remember = value!;
          //         });
          //       },
          //     ),
          //     const Text(
          //       "Remember me",
          //       style: TextStyle(fontSize: 12, color: kTextColorSecondary),
          //     ),
          //     Spacer(),
          //     GestureDetector(
          //       onTap: () => Navigator.pushNamed(
          //           context, ForgotPasswordScreen.routeName),
          //       child: const Text(
          //         "Forgot Password",
          //         style: TextStyle(
          //             decoration: TextDecoration.none,
          //             fontSize: 12,
          //             color: kPrimaryColor),
          //       ),
          //     )
          //   ],
          // ),
          //FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 12),
            child: CustElevatedBtn(
              text: "Login",
              press: () {
                signIn();
              },
            ),
          ),
        ],
      ),
    );
  }

//Functions

  signIn() async {
    AuthenticationServices authenticationServices = AuthenticationServices();

    authenticationServices.signInUser(
        email: "satvilkar123@gmail.com", context: context, password: "aman123");

    // if (_formKey.currentState!.validate()) {
    //   _formKey.currentState!.save();
    //   setState(() {
    //     sending = true;
    //   });

    //   sendData();
    // }
    // if (_formKey.currentState!.validate()) {
    //   KeyboardUtil.hideKeyboard(context);
    // }
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordctrl,
      autocorrect: false,
      obscureText: _obscureText,
      enableSuggestions: false,
      cursorColor: kPrimaryColor,
      validator: (value) {
        if (value!.isEmpty) {
          //addError(error: kPassNullError);

          return kPassNullError;
        } else if (value.length < 8) {
          //addError(error: kShortPassError);
          return kShortPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        hintText: "Enter your password",
        fillColor: kFormColor,
        filled: true,
        labelStyle: const TextStyle(color: kPrimaryColor),
        suffixIcon: GestureDetector(
          onTap: _toggle,
          child: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: kTextColorSecondary,
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailctrl,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          //addError(error: kEmailNullError);
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          // addError(error: kInvalidEmailError);
          return kInvalidEmailError;
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        labelStyle: const TextStyle(color: kPrimaryColor),
        focusColor: kPrimaryColor,
        hintText: "Enter your email",
        fillColor: kFormColor,
        filled: true,
      ),
    );
  }
}
