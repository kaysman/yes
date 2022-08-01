// import 'package:flutter/material.dart';
// import 'package:yes/presentation/shared/colors.dart';

// class FilterScreen extends StatefulWidget {
//   // final Filters? filters;
//   FilterScreen({Key? key, required this.filters}) : super(key: key);

//   @override
//   State<FilterScreen> createState() => _FilterScreenState();
// }

// class _FilterScreenState extends State<FilterScreen> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Container(
//         height: 50,
//         color: kSecondaryColor,
//         child: Row(
//           children: [
//             Expanded(
//               child: InkWell(
//                 splashColor: kPrimaryColor,
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Center(
//                   child: Text('Close'),
//                 ),
//               ),
//             ),
//             VerticalDivider(
//               color: kText1Color,
//               width: .5,
//               thickness: .5,
//               indent: 10,
//               endIndent: 10,
//             ),
//             Expanded(
//               child: Center(
//                 child: Text('Apply'),
//               ),
//             ),
//           ],
//         ),
//       ),
//       appBar: AppBar(
//         elevation: 0.5,
//         centerTitle: false,
//         title: Text(
//           'Filter',
//           style: Theme.of(context).textTheme.bodyMedium,
//         ),
//         actions: [
//           TextButton(
//               onPressed: () {},
//               child: Text(
//                 'refresh all',
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodyMedium
//                     ?.copyWith(color: kPrimaryColor),
//               ))
//         ],
//         automaticallyImplyLeading: false,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     child: NavigationRail(
//                       leading: null,
//                       backgroundColor: kScaffoldBgColor,
//                       onDestinationSelected: (val) => setState(() {
//                         selectedIndex = val;
//                       }),
//                       destinations: [
//                         NavigationRailDestination(
//                           icon: Text('Colors'),
//                           label: SizedBox.shrink(),
//                           padding: EdgeInsets.zero,
//                           selectedIcon: Container(
//                             padding: const EdgeInsets.symmetric(vertical: 15),
//                             alignment: Alignment.center,
//                             width: double.infinity,
//                             height: double.infinity,
//                             color: kWhite,
//                             child: Text('Colors'),
//                           ),
//                         ),
//                         NavigationRailDestination(
//                           selectedIcon: Container(
//                             alignment: Alignment.center,
//                             width: double.infinity,
//                             height: double.infinity,
//                             color: kWhite,
//                             child: Text('Sizes'),
//                           ),
//                           icon: Text('Sizes'),
//                           label: Text('Sizes'),
//                         ),
//                       ],
//                       selectedIndex: selectedIndex,
//                     ),
//                   ),
//                   Expanded(
//                     child: buildBody(),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildBody() {
//     switch (selectedIndex) {
//       case 0:
//         return Container(
//           color: kWhite,
//           child: Column(
//             children: 
//             widget.filters?.colors?.map((e) {
//                   return Column(
//                     children: [
//                       ListTile(
//                         leading: Icon(Icons.check, color: kScaffoldBgColor),
//                         title: Text(
//                           '${e.name_tm}',
//                           style: TextStyle(color: kPrimaryColor),
//                         ),
//                       ),
//                       Divider(
//                         indent: 15,
//                         endIndent: 15,
//                         color: kScaffoldBgColor,
//                         height: .5,
//                         thickness: 1,
//                       )
//                     ],
//                   );
//                 }).toList() ??
//                 [
//                   ListTile(
//                     title: Text('data bosh gelya...'),
//                   )
//                 ],
//           ),
//         );
//       case 1:
//         return Container(
//           color: kWhite,
//           width: double.infinity,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: widget.filters?.sizes?.map((e) {
//                   return Column(
//                     children: [
//                       ListTile(
//                         leading: Icon(Icons.check, color: kScaffoldBgColor),
//                         title: Text(
//                           '${e.name_tm}',
//                           style: TextStyle(color: kPrimaryColor),
//                         ),
//                       ),
//                       Divider(
//                         indent: 15,
//                         endIndent: 15,
//                         color: kScaffoldBgColor,
//                         height: .5,
//                         thickness: 1,
//                       )
//                     ],
//                   );
//                 }).toList() ??
//                 [
//                   ListTile(
//                     title: Text('Boshhhh'),
//                   )
//                 ],
//           ),
//         );
//       default:
//         return SizedBox();
//     }
//   }
// }
