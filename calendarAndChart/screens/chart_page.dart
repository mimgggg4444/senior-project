import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

import '../models/HealthData.dart';
import '../providers/health_data_provider.dart';
import '../widgets/chart_widhget.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  void initState() {
    super.initState();
    // 차트 페이지 초기화 시점에 Firebase에서 데이터 로드
    // Provider.of<HealthDataProvider>(context, listen: false).loadDataFromFirebase();
    _loadDataFromFirebase();

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
  Widget build(BuildContext context) {
    final healthDataList = Provider.of<HealthDataProvider>(context).allData;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: healthDataList.isNotEmpty
                    ? ListView(
                  children: [
                    SizedBox(
                      height: 250,
                      child: buildBloodPressureChart(healthDataList, context),
                    ),





                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      color: Colors.green,
                                    ),
                                    const Text('안전 수축기'),
                                    Container(
                                      width: 10,
                                      height: 10,
                                      color: Colors.blue,
                                    ),
                                    const Text('수축기'),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      color: Colors.red,
                                    ),
                                    const Text('안전 이완기'),
                                    Container(
                                      width: 10,
                                      height: 10,
                                      color: Colors.orange,
                                    ),
                                    const Text('이완기'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 250,
                            child: buildBloodSugarChart(healthDataList, context),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      color: Colors.green,
                                    ),
                                    const Text('안전 혈당'),
                                    Container(
                                      width: 10,
                                      height: 10,
                                      color: Colors.purple,
                                    ),
                                    const Text('혈당'),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    : const Center(child: Text('혹시 데이터를 추가하셨나요?')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBloodPressureChart(List<HealthData> healthDataList, BuildContext context) {
    return ChartHelper.buildChart(
      healthDataList: healthDataList,
      context: context,
      lineColors: [Colors.blue, Colors.orange], // 수축기와 이완기 혈압에 대한 색상
      normalValues: [200, 120, 80], // 수축기와 이완기 혈압의 정상값
      valueExtractors: [
        (HealthData data) => data.systolicBP.toDouble(),
        (HealthData data) => data.diastolicBP.toDouble(),
      ],
    );
  }

  Widget buildBloodSugarChart(List<HealthData> healthDataList, BuildContext context) {
    return ChartHelper.buildChart(
      healthDataList: healthDataList,
      context: context,
      lineColors: [Colors.purple],
      normalValues: [300, 100],
      valueExtractors: [
        (HealthData data) => data.bloodSugar.toDouble(),
      ],
    );
  }
}
