import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_project/Widgets/custom_text.dart';

import '../../../Utils/app_colors.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double _currentMedicineValue = 0;
  double _currentDietValue = 0;
  double _currentExerciseValue = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0).r,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350, // Set height to 350
              width: 400,
              margin: EdgeInsets.only(right: 10).r, // Set width to 400
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
            ),
            SizedBox(height: 15.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Medicine",
                  color: AppColors.black,
                  weight: FontWeight.bold,
                  size: 16.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 250.w,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(trackHeight: 2),
                        child: Slider(
                          activeColor: AppColors.blue,
                          value: _currentMedicineValue,
                          min: 0,
                          max: 10,
                          divisions: 100,
                          label: _currentMedicineValue.round().toString(),
                          onChanged: (value) {
                            setState(() {
                              _currentMedicineValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 40.w),
                    CustomText(
                      text: _currentMedicineValue.round().toString(),
                      weight: FontWeight.w600,
                      color: AppColors.black,
                      size: 18.sp,
                    )
                  ],
                ),
                SizedBox(height: 15.h),
                CustomText(
                  text: "Diet",
                  color: AppColors.black,
                  weight: FontWeight.bold,
                  size: 16.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 250.w,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(trackHeight: 2),
                        child: Slider(
                          activeColor: AppColors.blue,
                          value: _currentDietValue,
                          min: 0,
                          max: 10,
                          divisions: 100,
                          label: _currentDietValue.round().toString(),
                          onChanged: (value) {
                            setState(() {
                              _currentDietValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 40.w),
                    CustomText(
                      text: _currentDietValue.round().toString(),
                      weight: FontWeight.w600,
                      color: AppColors.black,
                      size: 18.sp,
                    )
                  ],
                ),
              ],
            ),
            CustomText(
              text: "Exercise",
              color: AppColors.black,
              weight: FontWeight.bold,
              size: 18.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 250.w,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(trackHeight: 2),
                    child: Slider(
                      activeColor: AppColors.blue,
                      value: _currentExerciseValue,
                      min: 0,
                      max: 10,
                      divisions: 100,
                      label: _currentExerciseValue.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          _currentExerciseValue = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 40.w),
                CustomText(
                  text: _currentExerciseValue.round().toString(),
                  weight: FontWeight.w600,
                  color: AppColors.black,
                  size: 18.sp,
                )
              ],
            ),
          ],
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
