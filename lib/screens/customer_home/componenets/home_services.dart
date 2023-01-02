

// import 'package:flutter/material.dart';

// class HomeServices extends StatefulWidget {
//   const HomeServices({super.key});

//   @override
//   State<HomeServices> createState() => _HomeServicesState();
// }

// class _HomeServicesState extends State<HomeServices> {
// List<Map<String, String>> servicesData = [
//     {"text": "Cleaning", "icon": "assets/icons/cleaning.png"},
//     {"text": "Carpenter", "icon": "assets/icons/carpenter.png"},
//     {"text": "Laundry", "icon": "assets/icons/laundry.png"},
//     {"text": "Painting", "icon": "assets/icons/painting.png"},
//     {"text": "Electrician", "icon": "assets/icons/electrician.png"},
//     {"text": "Plumbing", "icon": "assets/icons/plumbing.png"},
//     {"text": "Parlour", "icon": "assets/icons/salon.png"},
//     {"text": "Car Wash", "icon": "assets/icons/car_wash.png"},
//   ];
//   final ScrollController _controller = ScrollController();


//   late List data;

//   var isLoading = false;


//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Builder(
//       builder: (context) {
//         if (isLoading == true) {
//           return GridView.builder(
//               controller: _controller,
//               itemCount: data.length,
//               shrinkWrap: true,
//               padding: const EdgeInsets.all(8.0),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4,
//                 childAspectRatio: 1.0,
//                 crossAxisSpacing: 0.0,
//                 mainAxisSpacing: 5.0,
//               ),
//               itemBuilder: (BuildContext context, int index) {
//                 return InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ServicesSubCategories(
//                             serviceName: data[index]['cat_title'] ?? '',
//                             sub1: data[index]['sub1'] ?? '',
//                             sub2: data[index]['sub2'] ?? '',
//                             sub3: data[index]['sub3'] ?? '',
//                             sub4: data[index]['sub4'] ?? '',
//                             sub5: data[index]['sub5'] ?? '',
//                           ),
//                         ));
//                   },
//                   child: CustomService(
//                     icon: data[index]['cat_image'],
//                     text: data[index]['cat_title'],
//                   ),
//                 );
//               });
//         }
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }