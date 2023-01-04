import 'package:flutter/material.dart';
import 'package:servoo/global/constants.dart';
import 'package:servoo/screens/provider/choose_service/choose_service_form.dart';

class ChooseServiceScreen extends StatelessWidget {
  static const String routeName = "/choose_service";
  const ChooseServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBGclr,
      appBar: AppBar(title: const Text("Choose a Service")),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
            children: List.generate(iconData.length,
                (index) => SelectCard(choice: iconData[index]))),
      ),
    );
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({super.key, required this.choice});
  final Map<String, String> choice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ChooseServiceFormScreen(
                      serviceName: choice["name"]!,
                    )));
        // Navigator.pushNamed(context, ChooseServiceFormScreen.routeName);
      },
      child: Card(
          color: Colors.grey.shade400,
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    choice["icon"]!,
                    height: 90,
                    width: 90,
                  ),
                  Text(
                    choice["name"]!,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ]),
          )),
    );
  }
}
