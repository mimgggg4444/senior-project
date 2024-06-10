import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/services.dart';

import '../providers/health_data_provider.dart'; // SystemChrome을 사용하기 위해 필요

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime? _selectedDay;
  DateTime? _focusedDay;

  @override
  void initState() {
    super.initState();
    // 화면을 세로 모드로 고정
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    _loadDataFromFirebase();

    //firebase 저장로직 초기화

  }
  Future<void> _loadDataFromFirebase() async {
    try {
      await Provider.of<HealthDataProvider>(context, listen: false).loadDataFromFirebase();
    } catch (e) {
      // 에러 처리 로직 추가
      print('Error loading data from Firebase: $e');
    }
  }

  @override
  void dispose() {
    // 다른 화면에서는 가로 모드와 세로 모드를 모두 허용
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              _customTableCalendar(context),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: _selectedDayDetails(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customTableCalendar(BuildContext context) {
    return Consumer<HealthDataProvider>(
      builder: (context, healthDataProvider, _) {
        return TableCalendar(
          locale: "ko_KR",
          focusedDay: _focusedDay ?? DateTime.now(),
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          rowHeight: 60.0,
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: TextStyle(
              color: Color(0xFF276AEE),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            headerPadding: EdgeInsets.symmetric(vertical: 3),
          ),
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekendStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
          daysOfWeekHeight: 30.0,
          calendarStyle: CalendarStyle(
            cellAlignment: Alignment.topCenter,
            weekendTextStyle: const TextStyle(color: Colors.red),
            cellMargin: EdgeInsets.zero,
            defaultDecoration: const BoxDecoration(shape: BoxShape.rectangle),
            weekendDecoration: const BoxDecoration(shape: BoxShape.rectangle),
            selectedDecoration: const BoxDecoration(
              color: Color(0xFF276AEE),
              shape: BoxShape.rectangle,
            ),
            todayDecoration: BoxDecoration(
              color: Colors.green.withOpacity(0.6),
              shape: BoxShape.rectangle,
            ),
          ),
          eventLoader: (day) => healthDataProvider.getDataForDay(day),
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay) || !isSameDay(_focusedDay, focusedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            }
          },
          calendarFormat: CalendarFormat.month,
          onPageChanged: (focusedDay) {
            if (!isSameDay(_focusedDay, focusedDay)) {
              setState(() {
                _focusedDay = focusedDay;
              });
            }
          },
          calendarBuilders: CalendarBuilders(
            markerBuilder: (context, day, events) {
              if (events.isNotEmpty) {
                return Positioned(
                  right: 1,
                  bottom: 1,
                  child: buildEventMarker(events.length),
                );
              }
              return null;
            },
          ),
        );
      },
    );
  }

  Widget buildEventMarker(int count) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.red,
      ),
      padding: const EdgeInsets.all(4.0),
      child: Text(
        '$count',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 10.0,
        ),
      ),
    );
  }

  /// 선택날짜 컬럼뷰
  Widget _selectedDayDetails() {
    return Consumer<HealthDataProvider>(
      builder: (context, provider, child) {
        final data = _selectedDay == null ? [] : provider.getDataForDay(_selectedDay!);
        return data.isEmpty
            ? const Center(child: Text('입력된 데이터가 없어요!'))
            : ListView.separated(
                itemCount: data.length,
                itemBuilder: (_, index) => SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '측정시간\n',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF276AEE),
                          ),
                          children: [
                            TextSpan(
                              text: '${data[index].date.hour}시${data[index].date.minute}분',
                              style: const TextStyle(
                                color: Color(0xFF606060),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 80,
                        width: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: '혈압 \n',
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xFF606060),
                              ),
                              children: [
                                TextSpan(
                                  text: '수축 / 이완',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '혈당',
                            style: TextStyle(
                              fontSize: 17,
                              color: Color(0xFF606060),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data[index].systolicBP} / ${data[index].diastolicBP}',
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${data[index].bloodSugar}',
                            style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (_, __) => const Divider(),
              );
      },
    );
  }
}
