import 'package:flutter/material.dart';
import 'package:servoo/global/components/cus_bottom_nav_bar.dart';
import 'package:servoo/screens/provider/home/services/components/service_body.dart';

import '../../../../global/constants.dart';
import '../../../../global/enum.dart';

class ProviderServiceScreen extends StatelessWidget {
  static const String nameRoute = "/provider_service";
  const ProviderServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          centerTitle: false,
          title: const Text(
            "My Services",
            style: TextStyle(color: kTextColor),
          ),
          bottom: const TabBar(
              labelColor: kPrimaryLightColor,
              unselectedLabelColor: kTextColorSecondary,
              indicatorColor: kPrimaryColor,
              tabs: [
                Tab(text: 'My Services'),
                // Tab(text: 'Pending'),
              ]),
        ),
        body: const ProviderServiceBody(),
        bottomNavigationBar:
            const CusBottomNavBar(selectedMenu: MenuState.services),
      ),
    );
  }
}
