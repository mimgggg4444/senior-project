// import 'package:flutter/material.dart';

// import '../navigation_state.dart';
// import '../screens/Home_screen.dart';
// import '../screens/business_screen.dart';
// import '../screens/profile_screen.dart';

// class BottomNavigationBarExample extends StatefulWidget {
//   const BottomNavigationBarExample({super.key});

//   @override
//   State<BottomNavigationBarExample> createState() => _BottomNavigationBarExampleState();
// }

// class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
//   final NavigationState navigationState = NavigationState();
//   int _selectedIndex = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _buildWidgetOptions().elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: _bottomNavigationBar(),
//     );
//   }

//   List<Widget> _buildWidgetOptions() {
//     return [
//       BusinessScreen(navigationState: navigationState),
//       HomeScreen(navigationState: navigationState),
//       ProfileScreen(navigationState: navigationState),
//     ];
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   Widget _bottomNavigationBar() {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;

//     final double verticalOffset = screenHeight * 0.1; // 상하 위치를 화면 높이의 10%로 조절
//     final double horizontalMargin = screenWidth * 0.15; // 좌우 마진을 화면 너비의 15%로 조절

//     return Transform.translate(
//       offset: Offset(0.0, -verticalOffset),
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(26.0),

//           // border: Border.all(color: const Color(0xFF707070), width: 1.0),

//           boxShadow: const [
//             BoxShadow(
//               color: Colors.black,
//               offset: Offset(0, 3),
//               blurRadius: 6.0,
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(26.0),
//           child: BottomNavigationBar(
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.android),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: '',
//               ),
//             ],
//             currentIndex: _selectedIndex,
//             selectedItemColor: const Color(0xFF276AEE),
//             unselectedItemColor: Colors.white,
//             onTap: _onItemTapped,
//             showSelectedLabels: false,
//             showUnselectedLabels: false,
//             iconSize: 38,
//             backgroundColor: const Color(0xFF276AEE),
//           ),
//         ),
//       ),
//     );
//   }
// }
