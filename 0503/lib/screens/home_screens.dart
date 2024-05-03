import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    Center(child: Text('Page 1')),
    Center(child: Text('Page 2')),
    Center(child: Text('Page 3')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 27),
          child: Text(
            '홈',
            style: TextStyle(fontSize: 50.0),
          ),
        ),
        actions: [
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 36.0),
            _buildUserBox(),
            SizedBox(height: 24.0),
            _buildHealthPositionBox(),
            SizedBox(height: 24.0),
            _buildRecentRecordBox(),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      //
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: Builder(
      //   builder: (BuildContext context) {
      //     final double screenHeight = MediaQuery.of(context).size.height;
      //     final double screenWidth = MediaQuery.of(context).size.width;
      //
      //     final double verticalOffset =
      //         screenHeight * 0.1; // 상하 위치를 화면 높이의 3%로 조절
      //     final double horizontalMargin =
      //         screenWidth * 0.15; // 좌우 마진을 화면 너비의 10%로 조절
      //
      //     return Transform.translate(
      //       offset: Offset(0.0, -verticalOffset),
      //       child: Container(
      //         margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
      //         child: _bottomNavigationBar(),
      //       ),
      //     );
      //   },
      // ),
    );
  }

  Widget _buildUserBox() {
    return Container(
      padding: EdgeInsets.all(27.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Color(0x29000000),
            blurRadius: 6.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none, // 패딩으로 인해 잘리는 부분이 있을 때 잘리지 않도록 설정
        children: [
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.person,
                      color: Color(0xFF276AEE),
                      size: 56.49,
                    ),
                    Text(
                      '테스트님',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 1.0,
                  width: 32.0,
                ),
                SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '혈압',
                            style: TextStyle(fontSize: 15.0),
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            '120',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            '혈당',
                            style: TextStyle(fontSize: 15.0),
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            '70',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '이런 음식이 좋아요!',
                        style: TextStyle(fontSize: 17.0),
                      ),
                      Text(
                        '당근, 호박, 고구마',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '이런 음식이 나빠요!',
                        style: TextStyle(fontSize: 17.0),
                      ),
                      Text(
                        '치킨, 햄버거',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -40,
            top: 70.0, // 패딩만큼 위로 올려줌
            child: Container(
              width: 31,
              height: 31,
              decoration: BoxDecoration(
                color: Color(0xCC888888),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthPositionBox() {
    double progress = 0.8; // 초기 진행 비율은 30%로 설정
    double screenWidth = MediaQuery.of(context).size.width;
    double gaugeWidth = screenWidth * 0.8; // 화면 너비의 80%를 게이지 너비로 설정

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Color(0x29000000),
            blurRadius: 6.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '나의 건강 위치',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Text(
                '평균',
                style: TextStyle(fontSize: 30, color: Color(0xFF276AEE)),
              ),
              Text(
                '이에요',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Container(
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color(0x29000000),
                  blurRadius: 6.0,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 20,
                  width: gaugeWidth * progress, // 진행 비율과 화면 너비에 따라 너비 조절
                  decoration: BoxDecoration(
                    color: Color(0xFF276AEE),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentRecordBox() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Color(0x29000000),
            blurRadius: 6.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '나의 최근 기록',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // 이 줄을 추가합니다.
            children: [
              Text(
                '2024.04.24',
                style: TextStyle(fontSize: 30.0),
              ),
              SizedBox(width: 16.0),
              Container(
                height: 30.0,
                width: 1.0,
                color: Colors.grey,
              ),
              SizedBox(width: 16.0),
              Text(
                '15:30',
                style: TextStyle(fontSize: 30.0, color: Color(0xFF276AEE)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    final double verticalOffset = screenHeight * 0.1; // 상하 위치를 화면 높이의 10%로 조절
    final double horizontalMargin = screenWidth * 0.15; // 좌우 마진을 화면 너비의 15%로 조절

    return Transform.translate(
      offset: Offset(0.0, -verticalOffset),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26.0),
          border: Border.all(color: Color(0xFF707070), width: 1.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26.0),
          child: GestureDetector(
            onTap: () {
              // 탭 이벤트 처리
            },
            child: BottomNavigationBar(

              items: const <BottomNavigationBarItem>[

                BottomNavigationBarItem(
                  icon: Icon(Icons.android),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Color(0xFF276AEE),
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 38,  // 아이콘 크기 설정


            ),
          ),
        ),
      ),
    );
  }
}
