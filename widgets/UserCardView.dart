// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../models/user_model.dart';
//
// class UserCardView extends StatelessWidget {
//   final UserModel user;
//
//   const UserCardView({Key? key, required this.user}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Card View'),
//       ),
//       body: Card(
//         margin: const EdgeInsets.all(16.0),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 '${user.nickname} 님의 정보',
//                 style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 16.0),
//               Text('혈압: ${user.systolic}', style: TextStyle(fontSize: 18.0)),
//               Text('혈당: ${user.bloodSugar}', style: TextStyle(fontSize: 18.0)),
//               SizedBox(height: 16.0),
//               Text(
//                 '이런 음식이 좋아요!',
//                 style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 16.0),
//               Text(
//                 '이런 음식이 나빠요!',
//                 style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }