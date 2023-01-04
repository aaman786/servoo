import 'package:flutter/material.dart';
import 'package:servoo/screens/models/service_model.dart';
import 'package:servoo/screens/provider/serive_details/service_detail_screen.dart';
import 'package:servoo/screens/provider/services/provider_services.dart';

import '../../../../../global/constants.dart';

class ServiceContainer extends StatelessWidget {
  const ServiceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderService providerService = ProviderService();
    final ScrollController _controller = ScrollController();

    return FutureBuilder(
      future: providerService.getService(context: context),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: Text("You had not added Service yet!"));
        } else {
          ServiceModel serviceData = snapshot.data!;
          return ListView.builder(
            controller: _controller,
            shrinkWrap: true,
            itemCount: snapshot.hasData ? 1 : null,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {},
                child: Card(
                  elevation: 8,
                  margin: const EdgeInsets.only(left: 24, right: 24, top: 16),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          width: 96,
                          height: 96,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(18.0),
                              child: Image.asset("assets/icons/car_wash.png")),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(height: 4),
                              Text(
                                // "data[index]['service_title']",
                                serviceData.title,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: kTextColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                serviceData.spName,
                                // "data[index]['service_provider_name']",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: kTextColorSecondary,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                serviceData.subTitle,
                                // "data[index]['rate']",
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: true,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,
                                  ProviderServiceDetailScreen.routeName,
                                  arguments: serviceData);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Details",
                              style: TextStyle(
                                  fontSize: 12, color: kSecondaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
