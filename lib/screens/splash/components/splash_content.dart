import 'package:flutter/material.dart';

import '../../../global/constants.dart';
import '../../../global/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.heading,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, heading, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
        const Spacer(),
        Text(
          heading,
          style: const TextStyle(
            fontSize: 24,
            color: kTextColor,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: kTextColorSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
