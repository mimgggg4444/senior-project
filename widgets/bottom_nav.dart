import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildIcon(0, 'assets/robot.svg'),
        _buildIcon(1, Icons.home_outlined),
        _buildIcon(2, Icons.person_2_outlined),
      ],
    );
  }

  Widget _buildIcon(int index, dynamic icon) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: index == 0
            ? SvgPicture.asset(
          icon,
          width: 30,
          height: 30,
          color: index == currentIndex ? Colors.white : Colors.white70,
        )
            : Icon(
          icon,
          size: 30,
          color: index == currentIndex ? Colors.white : Colors.white70,
        ),
      ),
    );
  }
}
