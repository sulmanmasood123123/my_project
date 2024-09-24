import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350, // Set height to 350
      width: 400,
      margin: EdgeInsets.only(right: 10).r, // Set width to 400
      padding: EdgeInsets.all(16.0).r,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            _buildLine1(),
            _buildLine2(),
          ],
          titlesData: FlTitlesData(
            show: true, // Enable titles
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
            // Disable the right and top titles
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
        FlSpot(0, 30), // January
        FlSpot(1, 60), // February
        FlSpot(2, 50), // March
        FlSpot(3, 80), // April
        FlSpot(4, 90), // May
        FlSpot(5, 70), // June
        FlSpot(6, 60), // July
        FlSpot(7, 40), // August
        FlSpot(8, 30), // September
        FlSpot(9, 50), // October
        FlSpot(10, 80), // November
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
        FlSpot(0, 20), // January
        FlSpot(1, 40), // February
        FlSpot(2, 30), // March
        FlSpot(3, 50), // April
        FlSpot(4, 60), // May
        FlSpot(5, 55), // June
        FlSpot(6, 45), // July
        FlSpot(7, 65), // August
        FlSpot(8, 70), // September
        FlSpot(9, 80), // October
        FlSpot(10, 75), // November
      ],
    );
  }
}
