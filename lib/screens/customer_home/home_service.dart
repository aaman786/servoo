// import 'package:flutter/material.dart';
// import 'package:servoo/global/components/cus_bottom_nav_bar.dart';
// import 'package:servoo/global/size_config.dart';
// import 'package:servoo/screens/customer_home/componenets/home_body.dart';

// import '../../global/constants.dart';
// import '../../global/enum.dart';

// class ProviderHomeScrenn extends StatelessWidget {
//   const ProviderHomeScrenn({super.key});

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(72.0),
//         child: AppBar(
//           backgroundColor: kPrimaryColor,
//           title: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0.0, 16, 0, 0),
//                 child: Text(
//                   "ProviderName",
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                   style: const TextStyle(color: Colors.white60, fontSize: 12),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0.0, 4, 0, 8),
//                 child: Text(
//                   "box!.get(" "adress" ")",
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                   style: headingStyleWhite,
//                 ),
//               ),
//             ],
//           ),
//           actions: <Widget>[
//             Padding(
//               padding: const EdgeInsets.fromLTRB(0.0, 16, 0, 0),
//               child: IconButton(
//                 visualDensity:
//                     const VisualDensity(horizontal: -4.0, vertical: -4.0),
//                 icon: const Icon(
//                   Icons.favorite_border,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {
//                   // Navigator.pushNamed(context, FavouriteServices.routeName);
//                   // sendPushMessage('Noti', 'Noti', mtoken!);
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(0.0, 16, 18, 0),
//               child: IconButton(
//                 visualDensity:
//                     const VisualDensity(horizontal: -4.0, vertical: -4.0),
//                 icon: const Icon(
//                   Icons.notifications_active_outlined,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {},
//               ),
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.fromLTRB(8.0, 20, 20, 0),
//             //   child: GestureDetector(
//             //     onTap: () {},
//             //     child: const CircleAvatar(
//             //       radius: 18.0,
//             //       backgroundImage: AssetImage("assets/images/user.png"),
//             //       backgroundColor: Colors.transparent,
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//       body: const ProviderHomeBody(),
//       bottomNavigationBar: const CusBottomNavBar(selectedMenu: MenuState.home),
//     );
//   }
// }
