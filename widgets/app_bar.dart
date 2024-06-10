import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/app_router.dart';

class AppbarWidget extends StatelessWidget {
  final String title;
  final double size;

  const AppbarWidget({
    super.key,
    required this.title,
    this.size = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: size,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.push(AppScreen.notificationList);
          },
          child: const CircleAvatar(
            backgroundColor: Color(0xFFEFEFEF),
            radius: 22.5,
            child: Icon(
              Icons.notifications,
              color: Color(0xFF8E8B8B),
              size: 32.0,
            ),
          ),
        ),
      ],
    );
  }
}
