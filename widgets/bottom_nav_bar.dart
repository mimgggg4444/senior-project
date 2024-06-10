import 'package:ocare/router/app_router.dart';
import 'package:ocare/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 85,
      color: Colors.transparent,
      elevation: 0,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(26),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
            child: CustomBottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (int idx) => _onItemTapped(idx, context),
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(AppScreen.business);
        break;
      case 1:
        context.go(AppScreen.home);
        break;
      case 2:
        context.go(AppScreen.profile);
        break;
    }
  }
}
