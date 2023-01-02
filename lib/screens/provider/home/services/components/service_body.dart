import 'package:flutter/material.dart';
import 'package:servoo/screens/provider/home/services/components/approved.dart';

class ProviderServiceBody extends StatefulWidget {
  const ProviderServiceBody({super.key});

  @override
  State<ProviderServiceBody> createState() => _ProviderServiceBodyState();
}

class _ProviderServiceBodyState extends State<ProviderServiceBody> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        ProviderApprovedService(),
        // PendingServices(),
      ],
    );
  }
}
