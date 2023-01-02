import 'package:flutter/material.dart';
import 'package:servoo/screens/models/service_model.dart';

import '../../../../global/constants.dart';

class ProviderServiceDetailsAboutSection extends StatefulWidget {
  const ProviderServiceDetailsAboutSection(
      {super.key, required this.serviceData});
  final ServiceModel serviceData;

  @override
  State<ProviderServiceDetailsAboutSection> createState() =>
      _ProviderServiceDetailsAboutSectionState();
}

class _ProviderServiceDetailsAboutSectionState
    extends State<ProviderServiceDetailsAboutSection> {
  bool isAdmin = false;

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   if (box!.containsKey("admin_login")) {
  //     setState(() {
  //       isAdmin = true;
  //     });
  //   } else {
  //     setState(() {
  //       isAdmin = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final ServiceModel serviceData = widget.serviceData;

    return Container(
      color: containerBGclr,
      padding: const EdgeInsets.only(left: 24, right: 16, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                "About Service",
                style: TextStyle(
                    fontSize: 18,
                    color: kTextColor,
                    fontWeight: FontWeight.w500),
              ),
              InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, ProviderProfileScreen.routeName);
                },
                child: const Text(
                  "",
                  style: TextStyle(
                      fontSize: 12,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          kSizedBoxOfH05,
          Text(
            serviceData.description,
            maxLines: 7,
            style: TextStyle(
                fontSize: 14,
                color: textClrBlueGreyB157,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis),
          ),
          kSizedBoxOfH10,
          Text(
            serviceData.note,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 14,
                color: Colors.brown,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
