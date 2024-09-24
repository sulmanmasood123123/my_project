import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/Utils/app_constant.dart';
import 'package:my_project/Widgets/custom_text.dart';

import '../../../Utils/app_colors.dart';

class FullGraphScreen extends StatelessWidget {
  const FullGraphScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              color: AppColors.white,
            )),
        title: CustomText(text: AppConstants.fullGraph, color: AppColors.white),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: RotatedBox(
          quarterTurns: 1,
          child: LineChart(
            LineChartData(
              lineBarsData: [
                _buildLine1(),
                _buildLine2(),
              ],
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const style = TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      );
                      switch (value.toInt()) {
                        case 0:
                          return Text('Jan', style: style);
                        case 1:
                          return Text('Feb', style: style);
                        case 2:
                          return Text('Mar', style: style);
                        case 3:
                          return Text('Apr', style: style);
                        case 4:
                          return Text('May', style: style);
                        case 5:
                          return Text('Jun', style: style);
                        case 6:
                          return Text('Jul', style: style);
                        case 7:
                          return Text('Aug', style: style);
                        case 8:
                          return Text('Sep', style: style);
                        case 9:
                          return Text('Oct', style: style);
                        case 10:
                          return Text('Nov', style: style);
                        default:
                          return Text('');
                      }
                    },
                    reservedSize: 40,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 10,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      );
                    },
                    reservedSize: 40,
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(show: true),
              borderData: FlBorderData(
                show: true,
                border: const Border(
                  bottom: BorderSide(color: Colors.black, width: 2),
                  left: BorderSide(color: Colors.black, width: 2),
                  right: BorderSide(color: Colors.transparent),
                  top: BorderSide(color: Colors.transparent),
                ),
              ),
              minX: 0,
              maxX: 10,
              minY: 0,
              maxY: 100,
            ),
          ),
        ),
      ),
    );
  }

  LineChartBarData _buildLine1() {
    return LineChartBarData(
      isCurved: true,
      color: Colors.blue,
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
      spots: const [
        FlSpot(0, 30),
        FlSpot(1, 60),
        FlSpot(2, 50),
        FlSpot(3, 80),
        FlSpot(4, 90),
        FlSpot(5, 70),
        FlSpot(6, 60),
        FlSpot(7, 40),
        FlSpot(8, 30),
        FlSpot(9, 50),
        FlSpot(10, 80),
      ],
    );
  }

  LineChartBarData _buildLine2() {
    return LineChartBarData(
      isCurved: true,
      color: Colors.red,
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
      spots: const [
        FlSpot(0, 20),
        FlSpot(1, 40),
        FlSpot(2, 30),
        FlSpot(3, 50),
        FlSpot(4, 60),
        FlSpot(5, 55),
        FlSpot(6, 45),
        FlSpot(7, 65),
        FlSpot(8, 70),
        FlSpot(9, 80),
        FlSpot(10, 75),
      ],
    );
  }
}
