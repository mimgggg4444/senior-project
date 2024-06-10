class HealthData {
  final DateTime date; // 추가된 날짜
  final int systolicBP; // 수축기
  final int diastolicBP; // 이완기
  final int bloodSugar; // 혈당

  HealthData({
    required this.date,
    required this.systolicBP,
    required this.diastolicBP,
    required this.bloodSugar,
  });
}



// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:measurement/HealthData.dart';
// import 'package:fl_chart/fl_chart.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<HealthData> healthDataList = []; // HealthData 객체 저장 리스트

//   final _formKey = GlobalKey<FormState>(); // Form 위젯 상태 관리키
//   final systolicBPController = TextEditingController();
//   final diastolicBPController = TextEditingController();
//   final bloodSugarController = TextEditingController();

//   @override
//   void dispose() {
//     systolicBPController.dispose();
//     diastolicBPController.dispose();
//     bloodSugarController.dispose();
//     super.dispose();
//   }

//   /// 건강 데이터 추가 함수.
//   void addHealthData() {
//     // 입력 값 검증
//     if (_formKey.currentState!.validate()) {
//       final now = DateTime.now();
//       final systolicBP = int.tryParse(systolicBPController.text) ?? 0;
//       final diastolicBP = int.tryParse(diastolicBPController.text) ?? 0;
//       final bloodSugar = int.tryParse(bloodSugarController.text) ?? 0;

//       final newData = HealthData(
//         date: now,
//         systolicBP: systolicBP,
//         diastolicBP: diastolicBP,
//         bloodSugar: bloodSugar,
//       );

//       // 새로 생성한 HealthData 객체를 리스트에 추가
//       setState(() {
//         healthDataList.add(newData);
//       });

//       // systolicBPController.clear();
//       // diastolicBPController.clear();
//       // bloodSugarController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Health Data'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         // 입력 폼
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               _buildInputFields(),
//               const SizedBox(height: 16.0),
//               _buildAddDataButton(),
//               const SizedBox(height: 16.0),
//               Expanded(
//                 child: healthDataList.isEmpty
//                     ? const Center(child: Text('입력된 데이터가 없어요!'))
//                     : ListView(
//                         children: [
//                           SizedBox(
//                             height: 200,
//                             // 혈압 차트 위젯
//                             child: _buildBloodPressureChart(),
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           SizedBox(
//                             height: 200,
//                             // 혈당 차트 위젯
//                             child: _buildBloodSugarChart(),
//                           ),
//                         ],
//                       ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // 차트 빌드
//   Widget _buildChart(int index) {
//     final startIndex = index * 7;
//     final endIndex = startIndex + 7;
//     final subList = healthDataList.sublist(startIndex, endIndex.clamp(0, healthDataList.length));
//   }

//   /// 혈압, 혈당 위젯
//   Widget _buildInputFields() {
//     return Column(
//       children: [
//         _buildNumberTextField('수축기 혈압', systolicBPController),
//         _buildNumberTextField('이완기 혈압', diastolicBPController),
//         _buildNumberTextField('혈당', bloodSugarController),
//       ],
//     );
//   }

//   /// 입력 필드를 생성하는 위젯함수
//   Widget _buildNumberTextField(String label, TextEditingController controller) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: TextInputType.number,
//       decoration: InputDecoration(labelText: label),
//       // 입력 값 검증 로직
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return '$label을 입력해주세요.';
//         }
//         final number = int.tryParse(value);
//         if (number == null || number < 10 || number > 300) {
//           return '10부터 300 사이의 값을 입력해주세요.';
//         }
//         // 입력 값이 유효하면 null 반환
//         return null;
//       },
//     );
//   }

//   /// ADD Btn
//   Widget _buildAddDataButton() {
//     return ElevatedButton(
//       onPressed: addHealthData,
//       child: const Text('Add Data'),
//     );
//   }

//   /// 혈압 차트 시각화 위젯
//   Widget _buildBloodPressureChart() {
//     if (healthDataList.isEmpty) {
//       return Container();
//     }
//     return LineChart(
//       LineChartData(
//         lineBarsData: [
//           // 수축기 혈압 데이터를 플롯으로 변환
//           _buildLineChartBarData(
//             healthDataList.asMap().entries.map((entry) {
//               final index = entry.key;
//               final data = entry.value;
//               return FlSpot(index.toDouble(), data.systolicBP.toDouble());
//             }).toList(),
//             Colors.blue.withOpacity(0.7),
//           ),
//           // 이완기 혈압 데이터를 플롯으로 변환
//           _buildLineChartBarData(
//             healthDataList.asMap().entries.map((entry) {
//               final index = entry.key;
//               final data = entry.value;
//               return FlSpot(index.toDouble(), data.diastolicBP.toDouble());
//             }).toList(),
//             Colors.red.withOpacity(0.7),
//           ),
//           // 적정 수축기 혈압 라인
//           _buildNormalLineChartBarData(120, Colors.green.withOpacity(0.8)),
//           // 적정 이완기 혈압 라인
//           _buildNormalLineChartBarData(80, const Color.fromARGB(255, 16, 87, 18).withOpacity(0.8)),
//         ],
//         // 차트 축 설정
//         titlesData: _buildTitlesData(),
//       ),
//     );
//   }

//   /// 혈당 차트 시각화 위젯
//   Widget _buildBloodSugarChart() {
//     if (healthDataList.isEmpty) {
//       return Container();
//     }
//     return LineChart(
//       LineChartData(
//         lineBarsData: [
//           _buildLineChartBarData(
//             healthDataList.asMap().entries.map((entry) {
//               final index = entry.key;
//               final data = entry.value;
//               return FlSpot(index.toDouble(), data.bloodSugar.toDouble());
//             }).toList(),
//             Colors.purple.withOpacity(0.8),
//           ),
//           _buildNormalLineChartBarData(100, Colors.green.withOpacity(0.8)),
//         ],
//         titlesData: _buildTitlesData(),
//       ),
//     );
//   }

//   /// 입력값 라인을 생성하는 함수
//   LineChartBarData _buildLineChartBarData(List<FlSpot> spots, Color color) {
//     return LineChartBarData(
//       preventCurveOverShooting: true, // 곡선 초과 그리기 방기
//       spots: spots, // 데이터 포인트
//       isCurved: false, // 곡선 그래프 X
//       color: color,
//       barWidth: 3,
//       dotData: const FlDotData(show: false), // 데이터 점 비표시
//     );
//   }

//   /// 적정 라인을 생성하는 함수
//   LineChartBarData _buildNormalLineChartBarData(double value, Color color) {
//     if (healthDataList.isEmpty) {
//       return LineChartBarData(
//         spots: [],
//         isCurved: false,
//         color: color,
//         barWidth: 2,
//         dotData: const FlDotData(show: false),
//       );
//     }
//     return LineChartBarData(
//       spots: [
//         FlSpot(0, value), // 시작점
//         FlSpot(healthDataList.length.toDouble() - 1, value), // 끝점
//       ],
//       isCurved: false,
//       color: color,
//       barWidth: 2,
//       dotData: const FlDotData(show: false),
//     );
//   }

//   /// 혈압, 혈당 차트의 설명 view
//   FlTitlesData _buildTitlesData() {
//     return FlTitlesData(
//       topTitles: const AxisTitles(
//         sideTitles: SideTitles(showTitles: false),
//       ),
//       bottomTitles: AxisTitles(
//         sideTitles: SideTitles(
//           showTitles: true,
//           interval: 1,
//           getTitlesWidget: (value, meta) {
//             final index = healthDataList.length == 1
//                 ? 0
//                 : (value / (healthDataList.length - 1) * (healthDataList.length - 1)).toInt();

//             if (index >= 0 && index < healthDataList.length) {
//               final date = healthDataList[index].date;
//               final formattedDate = DateFormat('MM/dd').format(date);

//               return SideTitleWidget(
//                 space: 0.0,
//                 axisSide: meta.axisSide,
//                 child: Text(formattedDate),
//               );
//             }
//             return SideTitleWidget(
//               axisSide: meta.axisSide,
//               child: const Text(''),
//             );
//           },
//         ), // X축 타이틀 비표시
//       ),
//       leftTitles: const AxisTitles(
//         sideTitles: SideTitles(showTitles: false), // Y축 비표시
//       ),
//     );
//   }
// }
