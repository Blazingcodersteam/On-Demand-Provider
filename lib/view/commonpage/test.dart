// import 'package:flutter/material.dart';
// import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Drawer Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   final GlobalKey<AdvancedDrawerState> advancedDrawerKey =
//   GlobalKey<AdvancedDrawerState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return AdvancedDrawer(
//       key: advancedDrawerKey,
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               child: Text('Drawer Header'),
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//             ),
//             ListTile(
//               title: Text('Item 1'),
//               onTap: () {
//                 // Update the UI here as needed
//                 // Close the drawer
//                 advancedDrawerKey.currentState?.close();
//               },
//             ),
//             ListTile(
//               title: Text('Logout'),
//               onTap: () {
//                 // Perform logout logic here
//                 // Close the drawer
//                 advancedDrawerKey.currentState?.close();
//               },
//             ),
//           ],
//         ),
//       ),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Drawer Demo'),
//         ),
//         body: Center(
//           child: Text('Home Page'),
//         ),
//       ),
//     );
//   }
// }
