import 'package:flutter/material.dart';
import 'size_config.dart';

//const kPrimaryBGColor = Color(0xFFF5F5F5);
Color kScaffoldBGclr = const Color.fromRGBO(246, 176, 176, 1).withOpacity(0.7);
Color kAppBarBGclr = const Color.fromRGBO(246, 176, 176, 1).withOpacity(0.1);
const kPrimaryBGColor = Color(0xFFFFFCFC);
const kPrimaryColor = Color.fromARGB(255, 118, 32, 238);
const kPrimaryLightColor = Color.fromARGB(255, 170, 113, 250);
const kFormColor = Color(0xFFF6F6F6);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color.fromARGB(255, 118, 32, 238),
    Color.fromARGB(255, 170, 113, 250)
  ],
);

// CONTAINER BG COLOR
Color containerBGclr = Colors.amberAccent.withOpacity(0.2);

// TEXT COLORS
Color textClr1 = const Color(0xFF949494).withGreen(45);
Color textClrBlueGreyB157 = const Color(0xFF607D8B).withBlue(157);
const kSecondaryColor = Color(0xFFFFFFFF);
const kTextColor = Color(0xFF000000);
const kTextColorSecondary = Color(0xFF949494);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(20),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final headingStyleWhite = TextStyle(
  fontSize: getProportionateScreenWidth(20),
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
final secondaryTextStyle12 = TextStyle(
  fontSize: getProportionateScreenWidth(12),
  color: kTextColorSecondary,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kCodeNullError = "Please Enter Postal Code";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kConfirmPasswordError = "Please Enter your address";
const String kConfirmCniC = "Please Enter your CNIC";

final otpInputDecoration = InputDecoration(
  filled: true,
  fillColor: kFormColor,
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide.none,
  );
}

// sized Boxs HEIGHT
SizedBox kSizedBoxOfH20 = SizedBox(height: getProportionateScreenHeight(20));
SizedBox kSizedBoxOfH10 = SizedBox(height: getProportionateScreenHeight(10));
SizedBox kSizedBoxOfH05 = SizedBox(height: getProportionateScreenHeight(05));

// sized Boxs WIDTH
SizedBox kSizedBoxOfW20 = SizedBox(width: getProportionateScreenHeight(20));
SizedBox kSizedBoxOfW05 = SizedBox(width: getProportionateScreenHeight(05));
SizedBox kSizedBoxOfW10 = SizedBox(width: getProportionateScreenHeight(10));

List<Map<String, String>> iconData = [
  {"name": "Appliance", "icon": "assets/icons/appliances.png"},
  {"name": "Car Wash", "icon": "assets/icons/car_wash.png"},
  {"name": "Carpenter", "icon": "assets/icons/carpenter.png"},
  {"name": "Cleaning", "icon": "assets/icons/cleaning.png"},
  {"name": "Electrician", "icon": "assets/icons/electrician.png"},
  {"name": "Laundry", "icon": "assets/icons/laundry.png"},
  {"name": "Painting", "icon": "assets/icons/painting.png"},
  {"name": "Plumbing", "icon": "assets/icons/plumbing.png"},
  {"name": "Repairing", "icon": "assets/icons/repairing.png"},
  {"name": "Salon", "icon": "assets/icons/salon.png"},
  {"name": "Shifting", "icon": "assets/icons/shifting.png"},
];
