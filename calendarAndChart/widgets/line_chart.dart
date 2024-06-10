import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/HealthData.dart';

class CustomLineChart {
  /// 입력값 라인을 생성하는 함수
  static LineChartBarData buildLineChartBarData(List<FlSpot> spots, Color color) {
    return LineChartBarData(
      preventCurveOverShooting: true, // 곡선 초과 그리기 방기
      spots: spots, // 데이터 포인트
      isCurved: false, // 곡선 그래프 X
      color: color,
      barWidth: 3,
      dotData: const FlDotData(show: false), // 데이터 점 비표시
    );
  }

  /// 적정 라인을 생성하는 함수
  static LineChartBarData buildNormalLineChartBarData(int dataLength, double value, Color color) {
    return LineChartBarData(
      spots: [
        FlSpot(0, value), // 항상 첫 번째 점은 0
        FlSpot((dataLength > 10 ? 10 : dataLength).toDouble() - 1,
            value), // 10개 이상이면 10, 아니면 dataLength를 끝점으로 설정
      ],
      isCurved: false,
      color: color,
      barWidth: 2,
      dotData: const FlDotData(show: false),
    );
  }

  /// 혈압, 혈당 차트의 설명 view
  static FlTitlesData buildTitlesData(List<HealthData> healthDataList) {
    return (healthDataList.isEmpty)
        ? const FlTitlesData(
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          )
        : FlTitlesData(
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  final index = healthDataList.length == 1
                      ? 0
                      : (value / (healthDataList.length - 1) * (healthDataList.length - 1)).toInt();

                  if (index >= 0 && index < healthDataList.length) {
                    final date = healthDataList[index].date;
                    final hour = date.hour.toString().padLeft(2, '0');
                    final day = date.day.toString().padLeft(2, '0');
                    final formattedDate = '$day/$hour';

                    return SideTitleWidget(
                      space: 0.0,
                      axisSide: meta.axisSide,
                      child: Text(
                        formattedDate,
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ), // X축 타이틀 비표시
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Y축 비표시
            ),
          );
  }
}
