import 'package:flutter/material.dart';
import 'package:servoo/global/constants.dart';
import 'package:servoo/screens/models/service_model.dart';

class SearchServiceScreen extends StatelessWidget {
  static const String routeName = "/customer-search";
  const SearchServiceScreen({super.key, required this.services});
  final List<ServiceModel> services;

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();

    return Scaffold(
        backgroundColor: kFormColor,
        appBar: AppBar(
          title: const Text("Search Result"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                        text: "Searched city : ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kPrimaryColor),
                      ),
                      TextSpan(
                        text: services[0].cityName,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey.shade600),
                      ),
                    ]),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                        text: "Searched Service : ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kPrimaryColor),
                      ),
                      TextSpan(
                        text: services[0].title,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey.shade600),
                      ),
                    ]),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.blue,
              ),
              ListView.builder(
                controller: controller,
                shrinkWrap: true,
                itemCount: services.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      elevation: 8,
                      margin:
                          const EdgeInsets.only(left: 24, right: 24, top: 16),
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
                                  child:
                                      Image.asset("assets/icons/car_wash.png")),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const SizedBox(height: 4),
                                  Text(
                                    // "data[index]['service_title']",
                                    services[index].title,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: kTextColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    services[index].spName,
                                    // "data[index]['service_provider_name']",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: kTextColorSecondary,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    services[index].subTitle,
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
                                  // Navigator.pushNamed(context,
                                  //     ProviderServiceDetailScreen.routeName,
                                  //     arguments: serviceData);
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
              ),
            ],
          ),
        ));
  }
}
