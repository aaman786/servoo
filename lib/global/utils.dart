import 'package:flutter/material.dart';
import 'package:servoo/global/constants.dart';

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

Future<dynamic> displayDialog(
    {required BuildContext context,
    required String content,
    required String title}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.only(top: 15, bottom: 0, left: 25),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          backgroundColor: kFormColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: Text(
            title,
            style: TextStyle(
                color: textClrBlueGreyB157, fontWeight: FontWeight.w700),
          ),
          content: Text(content),
          contentTextStyle: TextStyle(
              color: textClr1,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.2),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        padding: const EdgeInsets.all(8.0)
                            .copyWith(left: 20, right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.teal),
                        child: const Text(
                          "Ok",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                        ))),
              ],
            ),
          ],
          actionsPadding:
              const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 0),
        );
      });
}
