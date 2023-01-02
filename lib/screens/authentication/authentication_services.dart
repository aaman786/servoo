import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:servoo/screens/provider/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../global/server_error_handling.dart';
import '../../global/utils.dart';
import '../../state_management/user_provider.dart';
import 'model/user_model.dart';

class AuthenticationServices {
  void signUpUser(
      {required String email,
      required BuildContext context,
      required String name,
      required String address,
      required String phone,
      required String password}) async {
    try {
      print("signup");
      User user = User(
        name: name,
        email: email,
        phone: phone,
        id: '',
        password: password,
        identity: '',
        address: address,
        token: '',
      );
      http.Response response = await http.post(Uri.parse("$uri/api/signup"),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      httpErrorHandling(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Account Created Successfully");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser(
      {required String email,
      required BuildContext context,
      required String password}) async {
    try {
      void navigatorAndSetData(http.Response response) {
        Provider.of<UserProvider>(context, listen: false)
            .setUser(response.body);

        Navigator.pushNamedAndRemoveUntil(
            context, ProviderHomeScreen.routeName, (route) => false);
      }

      http.Response response = await http.post(Uri.parse("$uri/api/signin"),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      httpErrorHandling(
          response: response,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();

            await prefs.setString(
                'x-auth-token', jsonDecode(response.body)['token']);

            navigatorAndSetData(response);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // getting user Data
  void getUserData({
    required BuildContext context,
  }) async {
    try {
      void settingDataInProvider(http.Response response) {
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(response.body);
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      http.Response tokenRes = await http.post(Uri.parse('$uri/tokenIsValid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          });

      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        http.Response userResponse = await http.get(Uri.parse('$uri/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token
            });
        settingDataInProvider(userResponse);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
