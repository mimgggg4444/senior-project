import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


import '../models/HealthData.dart';
import 'line_chart.dart';

class ChartHelper {
  // 차트를 생성하는 static 메서드
  static Widget buildChart({
    required List<HealthData> healthDataList,
    required BuildContext context,
    required List<Color> lineColors, // 차트 라인 색상 배열
    required List<double> normalValues, // 각 데이터 세트의 적정 값 배열
    required List<double Function(HealthData)> valueExtractors, // 데이터에서 값을 추출하는 함수배열
  }) {
    if (healthDataList.isEmpty) {
      return Container();
    }

    final width = MediaQuery.of(context).size.width;
    final chartWidth = healthDataList.length * 80.0;
    final isScrollable = chartWidth > width;
    // 최근 10개 데이터 또는 전체 데이터를 저장
    final recentDataList = healthDataList.length > 10
        ? healthDataList.sublist(healthDataList.length - 10)
        : healthDataList;

    // 각 데이터 세트에 대한 LineChartBarData 객체 생성
    // List.generate 함수를 사용하여 valueExtractors의 길이만큼 LineChartBarData 객체들의 리스트를 생성
    List<LineChartBarData> lineBarsData = List.generate(valueExtractors.length, (index) {
      final spots = recentDataList.asMap().entries.map(
        (entry) {
          final value = valueExtractors[index](entry.value);
          return FlSpot(
            // entry.key는 데이터의 인덱스로 나타냄 double 형으로 변환하여 FlSpot의 x 좌표로 사용
            entry.key.toDouble(),
            // value는 valueExtractors를 통해 추출된 실제 데이터 값으로 FlSpot의 y 좌표로 사용
            value,
          );
        },
      ).toList();

      /// <LineChartBarData>
      return CustomLineChart.buildLineChartBarData(
        spots,
        lineColors[index].withOpacity(0.7),
      );
    });

    // 적정 값을 나타내는 라인 추가
    lineBarsData.addAll(
      List.generate(
        normalValues.length,
        (i) {
          final color = i == 2
              ? Colors.red.withOpacity(0.8)
              : i == 1
                  ? Colors.green.withOpacity(0.8)
                  : Colors.black;
          return CustomLineChart.buildNormalLineChartBarData(
            recentDataList.length,
            normalValues[i],
            color,
          );
        },
      ),
    );
    // // 적정 값을 나타내는 라인 추가
    // for (int i = 0; i < normalValues.length; i++) {
    //   final color = i == 0 ? Colors.black : Colors.green.withOpacity(0.8);
    //   lineBarsData.add(
    //     CustomLineChart.buildNormalLineChartBarData(
    //       recentDataList.length,
    //       normalValues[i],
    //       color,
    //     ),
    //   );
    // }

    // 생성된 데이터를 통해 LineChart 반환
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: isScrollable ? chartWidth : width,
        child: LineChart(
          LineChartData(
            lineBarsData: lineBarsData,
            titlesData: CustomLineChart.buildTitlesData(recentDataList),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:measurement/models/HealthData.dart';
// import 'package:measurement/widgets/line_chart.dart';

// class ChartWidget {
//   static Widget buildChart({
//     required List<HealthData> healthDataList,
//     required BuildContext context,
//     required List<LineChartBarData> lineBarsData,
//     required double normalValue,
//   }) {
//     if (healthDataList.isEmpty) {
//       return Container();
//     }
//     final width = MediaQuery.of(context).size.width;
//     final chartWidth = healthDataList.length * 60.0;
//     final isScrollable = chartWidth > width;
//     final recentDataList = healthDataList.length > 10
//         ? healthDataList.sublist(healthDataList.length - 10)
//         : healthDataList;

//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: SizedBox(
//         width: isScrollable ? chartWidth : width,
//         child: LineChart(
//           LineChartData(
//             lineBarsData: [
//               ...lineBarsData,
//               CustomLineChart.buildNormalLineChartBarData(
//                 recentDataList.length,
//                 normalValue,
//                 Colors.green.withOpacity(0.8),
//               ),
//             ],
//             titlesData: CustomLineChart.buildTitlesData(recentDataList),
//           ),
//         ),
//       ),
//     );
//   }

//   static Widget buildBloodPressureChart(List<HealthData> healthDataList, BuildContext context) {
//     return buildChart(
//       healthDataList: healthDataList,
//       context: context,
//       lineBarsData: [
//         CustomLineChart.buildLineChartBarData(
//           healthDataList.asMap().entries.map((entry) {
//             final index = entry.key;
//             final data = entry.value;
//             return FlSpot(index.toDouble(), data.systolicBP.toDouble());
//           }).toList(),
//           Colors.blue.withOpacity(0.7),
//         ),
//         CustomLineChart.buildLineChartBarData(
//           healthDataList.asMap().entries.map((entry) {
//             final index = entry.key;
//             final data = entry.value;
//             return FlSpot(index.toDouble(), data.diastolicBP.toDouble());
//           }).toList(),
//           Colors.red.withOpacity(0.7),
//         ),
//       ],
//       normalValue: 120,
//     );
//   }

//   static Widget buildBloodSugarChart(List<HealthData> healthDataList, BuildContext context) {
//     return buildChart(
//       healthDataList: healthDataList,
//       context: context,
//       lineBarsData: [
//         CustomLineChart.buildLineChartBarData(
//           healthDataList.asMap().entries.map((entry) {
//             final index = entry.key;
//             final data = entry.value;
//             return FlSpot(index.toDouble(), data.bloodSugar.toDouble());
//           }).toList(),
//           Colors.purple.withOpacity(0.8),
//         ),
//       ],
//       normalValue: 100,
//     );
//   }
// }
