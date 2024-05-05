import 'package:flutter/material.dart';
import '../navigation_state.dart';

class SchoolScreen extends StatelessWidget {
  const SchoolScreen({super.key, required this.navigationState});

  final NavigationState navigationState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Padding(
            padding: EdgeInsets.only(left: 27),
            child: Text(
              '내 정보',
              style: TextStyle(fontSize: 50.0),
            ),
          ),
          actions:  [
            Padding(
              padding: EdgeInsets.only(right: 27.0),
              child: CircleAvatar(
                backgroundColor: Color(0xFFEFEFEF),
                radius: 22.5,
                child: Icon(
                  Icons.notifications,
                  color: Color(0xFF8E8B8B),
                  size: 22.0,
                ),
              ),
            ),
          ],
        ),
        body:  Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 36.0),
              // _buildUserBox(),
              SizedBox(height: 24.0),
              // _buildHealthPositionBox(context),
              SizedBox(height: 24.0),
              // _buildRecentRecordBox(),
            ],
          ),
        ));

  }
}