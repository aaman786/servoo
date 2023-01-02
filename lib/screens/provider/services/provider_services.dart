import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:servoo/screens/models/service_model.dart';
import 'package:servoo/screens/provider/home/home_screen.dart';
import 'package:servoo/state_management/general_provider.dart';

import '../../../global/server_error_handling.dart';
import '../../../global/utils.dart';
import '../../../state_management/user_provider.dart';

class ProviderService {
  // ADD A PRODUCT
  Future<void> addService({
    required BuildContext context,
    required String title,
    required String subTitle,
    required String description,
    required String note,
    required String cityName,
    required String pinCode,
    required String dateTime,

    // required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      // final cloudy = Cloudinary.unsignedConfig(cloudName: "aman0980");

      // List<ImagesModel> imageUrls = [];

      // for (var i = 0; i < images.length; i++) {
      //   final response = await cloudy.unsignedUpload(
      //       uploadPreset: "kmatym3q", folder: name, file: images[i].path);

      //   String url = response.secureUrl!;
      //   String publicId = response.publicId!;

      //   ImagesModel imagesModel =
      //       ImagesModel(imageUrl: url, publicId: publicId);
      //   imageUrls.add(imagesModel);
      // }

      ServiceModel serviceModel = ServiceModel(
          id: userProvider.user.id,
          spName: userProvider.user.name,
          address: userProvider.user.address,
          title: title,
          subTitle: subTitle,
          description: description,
          note: note,
          cityName: cityName,
          pinCode: pinCode,
          dateTime: dateTime);

      http.Response response = await http.post(
        Uri.parse('$uri/provider/add-service'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: serviceModel.toJson(),
      );

      httpErrorHandling(
          response: response,
          context: context,
          onSuccess: () {
            final GeneralProvider generalProvider =
                Provider.of<GeneralProvider>(context, listen: false);
            generalProvider.setServiceFound(true);
            showSnackBar(context, "Service Added Successfully...");
            Navigator.pushNamedAndRemoveUntil(
                context, ProviderHomeScreen.routeName, (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<ServiceModel?> getService({required BuildContext context}) async {
    final generalProvider =
        Provider.of<GeneralProvider>(context, listen: false);
    ServiceModel? service;

    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);

      http.Response response = await http.get(
        Uri.parse("$uri/provider/added-service"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandling(
          response: response,
          context: context,
          onSuccess: () {
            var body = jsonDecode(response.body);
            if (body == false) {
              print("Body is false");
              bool responseIsBool = body;
              generalProvider.setServiceFound(responseIsBool);
            } else {
              service = ServiceModel.fromJson(jsonEncode(body));
              print(service);
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return service;
  }
}
