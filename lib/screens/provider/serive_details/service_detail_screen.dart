import 'package:flutter/material.dart';
import 'package:servoo/global/size_config.dart';
import 'package:servoo/screens/models/service_model.dart';
import 'package:servoo/screens/provider/serive_details/components/service_detail_body.dart';

class ProviderServiceDetailScreen extends StatelessWidget {
  static const String routeName = "/service_details";
  const ProviderServiceDetailScreen({super.key, required this.serviceData});
  final ServiceModel serviceData;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ProviderServiceDetailBody(serviceData: serviceData),
    );
  }
}
