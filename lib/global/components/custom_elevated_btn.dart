import 'package:flutter/material.dart';
import 'package:servoo/global/size_config.dart';

import '../constants.dart';

class CustElevatedBtn extends StatelessWidget {
  const CustElevatedBtn({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(48),
      child: ElevatedButton(
        onPressed: () {
          press();
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          primary: kPrimaryColor,
          onPrimary: kSecondaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
