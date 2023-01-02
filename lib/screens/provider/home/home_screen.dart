import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:servoo/global/components/cus_bottom_nav_bar.dart';
import 'package:servoo/screens/models/service_model.dart';
import 'package:servoo/screens/provider/choose_service/choose_service_screen.dart';
import 'package:servoo/screens/provider/services/provider_services.dart';
import 'package:servoo/state_management/general_provider.dart';

import '../../../global/constants.dart';
import '../../../global/enum.dart';
import 'components/home_body.dart';

class ProviderHomeScreen extends StatelessWidget {
  static const String routeName = "/provider_home";
  const ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GeneralProvider userProvider =
        Provider.of<GeneralProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: kFormColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72.0),
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: kPrimaryColor,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 16, 0, 0),
                child: Text(
                  "box!.get(" "name" ")",
                  style: const TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 4, 0, 8),
                child: Text(
                  "_address",
                  // style: subheadingStyleWhite,
                ),
              ),
            ],
          ),
        ),
      ),
      body: const ProviderHomeBody(),
      floatingActionButton: userProvider.serviceFound == false
          ? FloatingActionButton.extended(
              onPressed: () async {
                // TODO :- Add service Button Provider
                Navigator.pushNamed(context, ChooseServiceScreen.routeName);
                // final ServiceModel? result =
                //     await ProviderService().getService(context: context);
                // print(result!.spName);
              },
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              icon: Image.asset(
                "assets/images/add_service.png",
                height: 40,
                width: 40,
              ),
              label: const Text(
                "Add Service",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
            )
          : null,
      bottomNavigationBar: const CusBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
