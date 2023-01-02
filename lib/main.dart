import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servoo/global/utils.dart';
import 'package:servoo/routes.dart';
import 'package:servoo/screens/authentication/authentication_services.dart';
import 'package:servoo/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:servoo/screens/authentication/sign_up/sign_up.dart';
import 'package:servoo/screens/provider/home/home_screen.dart';
import 'package:servoo/screens/splash/splash.dart';
import 'package:servoo/state_management/general_provider.dart';
import 'package:servoo/state_management/user_provider.dart';
import 'package:servoo/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => GeneralProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? firstStart;

  Future<void> checkStart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    firstStart = prefs.getString("startFirstTime");
    setState(() {});
  }

  AuthenticationServices authenticationServices = AuthenticationServices();
  @override
  void initState() {
    super.initState();
    // checkStart();
    authenticationServices.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: messangerKey,
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: theme(),
      onGenerateRoute: (((settings) => generateRoute(settings))),
      // home: firstStart == "false" ? SignUpScreen() : SplashScreen(),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.identity == "provider"
              ? const ProviderHomeScreen()
              : const SplashScreen()
          : const SignInScreen(),
    );
  }
}
