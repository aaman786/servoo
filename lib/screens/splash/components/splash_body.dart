import 'package:flutter/material.dart';
import 'package:servoo/screens/authentication/sign_up/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../global/components/custom_elevated_btn.dart';
import '../../../global/components/custom_secondry_btn.dart';
import '../../../global/constants.dart';
import '../../../global/size_config.dart';
import 'splash_content.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "heading": "Choose from our best Services",
      "text": "Pick your desired Services with in clicks.",
      "image": "assets/images/splash_1.png"
    },
    {
      "heading": "Find nearby handy services",
      "text":
          "Choose anything from daily essential to handy services \nand get your work done",
      "image": "assets/images/splash_2.png"
    },
    {
      "heading": "Fast Service",
      "text": "Fast service to your home, office and\nany where you are.",
      "image": "assets/images/splash_3.png"
    },
  ];

// void initState() {
  //   super.initState();
  //   if (box!.containsKey("login")) {
  //     Future.delayed(Duration.zero, () {
  //       Navigator.of(context)
  //           .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
  //     });
  //   } else if (box!.containsKey("provider_login")) {
  //     Future.delayed(Duration.zero, () {
  //       Navigator.of(context).pushNamedAndRemoveUntil(
  //           ProviderHomeScreen.routeName, (route) => false);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"]!,
                  text: splashData[index]['text']!,
                  heading: splashData[index]['heading']!,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 2),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
                      child: CustElevatedBtn(
                        text: "Login",
                        press: () async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          print(pref.get("startFirstTime"));
                          // Navigator.of(context).pushNamedAndRemoveUntil(
                          //     SignInScreen.routeName, (route) => false);
                        },
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
                      child: SecondaryButton(
                        text: "Create Account",
                        press: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              SignUpScreen.routeName, (route) => false);
                        },
                      ),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      width: 8,
      //width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
