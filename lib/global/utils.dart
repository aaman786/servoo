import 'package:flutter/material.dart';

String uri = "http://192.168.189.244:3000";

final messangerKey = GlobalKey<ScaffoldMessengerState>();
void showSnackBar(BuildContext context, String text) {
  messangerKey.currentState!.showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(
  //     content: Text(text),
  //   ),
  // );
}
