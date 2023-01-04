import 'package:flutter/material.dart';
import 'package:servoo/screens/provider/home/services/components/service_container.dart';

class ProviderServiceBody extends StatefulWidget {
  const ProviderServiceBody({super.key});

  @override
  State<ProviderServiceBody> createState() => _ProviderServiceBodyState();
}

class _ProviderServiceBodyState extends State<ProviderServiceBody> {
  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: <Widget>[
        ServiceContainer(),
        // PendingServices(),
      ],
    );
  }
}
