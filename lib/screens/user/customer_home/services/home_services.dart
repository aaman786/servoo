import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:servoo/screens/models/service_model.dart';

import '../../../../global/server_error_handling.dart';
import '../../../../global/utils.dart';
import '../../../../state_management/user_provider.dart';

class HomeService {
  Future<List<ServiceModel>> searchService(
      {required BuildContext context,
      required String cityName,
      required serviceName}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<ServiceModel> servicesList = [];
    try {
      http.Response response = await http.get(
        Uri.parse("$uri/api/service/serach/$cityName/$serviceName"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandling(
          response: response,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(response.body).length; i++) {
              servicesList.add(
                ServiceModel.fromJson(
                  jsonEncode(jsonDecode(response.body)[i]),
                ),
              );
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return servicesList;
  }

  Future<List<ServiceModel>> getNerbyServices({
    required BuildContext context,
    required String cityName,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<ServiceModel> servicesList = [];
    try {
      http.Response response = await http.get(
        Uri.parse("$uri/api/service/all-nearby?cityName=$cityName"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandling(
          response: response,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(response.body).length; i++) {
              servicesList.add(
                ServiceModel.fromJson(
                  jsonEncode(jsonDecode(response.body)[i]),
                ),
              );
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return servicesList;
  }
}
