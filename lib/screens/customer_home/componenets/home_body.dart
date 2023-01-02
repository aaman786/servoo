// import 'package:flutter/material.dart';
// import 'package:servoo/global/constants.dart';

// import 'provider_home_header.dart';

// class ProviderHomeBody extends StatelessWidget {
//   const ProviderHomeBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             kSizedBoxOfH05,
//             const Padding(
//               padding: EdgeInsets.only(left: 18.0, right: 8.0),
//               child: Text(
//                 "Search for Services",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.start,
//               ),
//             ),
//             kSizedBoxOfH10,
//             const ProviderHomeHeader(),
//             kSizedBoxOfH10,
//             kSizedBoxOfH05,
//             const Divider(
//               thickness: 1,
//               color: kTextColorSecondary,
//               height: 2.0,
//             ),
//             kSizedBoxOfH10,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 const Padding(
//                   padding: EdgeInsets.only(left: 18.0, right: 8.0),
//                   child: Text(
//                     "Services",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.start,
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     // Navigator.pushNamed(context, AllServicesScreen.routeName);
//                   },
//                   child: const Padding(
//                     padding: EdgeInsets.only(left: 8.0, right: 18.0),
//                     child: Text(
//                       "See All",
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                           color: kPrimaryColor),
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             // const HomeServices(),
//             kSizedBoxOfH10,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 const Padding(
//                   padding: EdgeInsets.only(left: 18.0, right: 8.0),
//                   child: Text(
//                     "Most Popular Services",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.start,
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     // Navigator.pushNamed(
//                     //     context, ViewProviderMapScreen.routeName);
//                   },
//                   child: const Padding(
//                     padding: EdgeInsets.only(left: 8.0, right: 18.0),
//                     child: Text(
//                       "Map View",
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                           color: kPrimaryColor),
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             // const HomeFilterChips(),
//             kSizedBoxOfH05,
//             // const HomeServiceList(),

//             kSizedBoxOfH20,
//             kSizedBoxOfH05,
//           ],
//         ),
//       ),
//     );
//   }
// }
