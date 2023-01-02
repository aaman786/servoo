import 'package:flutter/material.dart';
import 'package:servoo/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:servoo/screens/authentication/sign_up/sign_up.dart';
import 'package:servoo/screens/models/service_model.dart';
import 'package:servoo/screens/provider/choose_service/choose_service_form.dart';
import 'package:servoo/screens/provider/choose_service/choose_service_screen.dart';
import 'package:servoo/screens/provider/home/home_screen.dart';
import 'package:servoo/screens/provider/home/services/services_screen.dart';
import 'package:servoo/screens/provider/serive_details/service_detail_screen.dart';
import 'package:servoo/screens/splash/splash.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const SplashScreen());

    case SignUpScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const SignUpScreen());

    case SignInScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const SignInScreen());

    case ChooseServiceScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ChooseServiceScreen());

    case ProviderServiceDetailScreen.routeName:
      final ServiceModel serviceData = routeSettings.arguments as ServiceModel;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) =>
              ProviderServiceDetailScreen(serviceData: serviceData));

    case ProviderHomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ProviderHomeScreen());

    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
              body: Center(child: Text("Screen does not exist!..."))));
  }
}
