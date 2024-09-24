import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_project/Utils/app_constant.dart';
import 'package:my_project/Views/DashboardScreen/Screen/fullGraph_screen.dart';
import 'package:my_project/Widgets/custom_button.dart';
import 'package:my_project/Widgets/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Utils/app_colors.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isButtonDisabled = false;
  DateTime? _disabledUntil;

  @override
  void initState() {
    super.initState();
    _checkButtonStatus();
  }

  Future<void> _checkButtonStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? disabledUntilTimestamp = prefs.getInt('disabledUntil');
    if (disabledUntilTimestamp != null) {
      DateTime disabledUntil =
          DateTime.fromMillisecondsSinceEpoch(disabledUntilTimestamp);
      if (DateTime.now().isBefore(disabledUntil)) {
        setState(() {
          _isButtonDisabled = true;
          _disabledUntil = disabledUntil;
        });
      }
    }
  }

  Future<void> _onSubmit() async {
    setState(() {
      _isButtonDisabled = true;
      _disabledUntil = DateTime.now().add(Duration(hours: 24));
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('disabledUntil', _disabledUntil!.millisecondsSinceEpoch);

    await Future.delayed(Duration(hours: 24));
    _checkButtonStatus();
  }

  double _currentMedicineValue = 0;
  double _currentDietValue = 0;
  double _currentExerciseValue = 0;
  double _scaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.0).r,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: CustomText(
                      text: "Welcome to KGC",
                      color: AppColors.black,
                      size: 18.sp,
                      weight: FontWeight.bold)),
              SizedBox(height: 30.h),
              Container(
                height: 350.h,
                width: 400.w,
                margin: EdgeInsets.only(right: 10).r,
                child: Transform.scale(
                  scale: _scaleFactor,
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
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _scaleFactor -= 0.1;
                        });
                      },
                      icon: Icon(Icons.zoom_out)),
                  GestureDetector(
                    onTap: () {
                      Get.to(FullGraphScreen());
                    },
                    child: Container(
                      height: 40.h,
                      width: 120.w,
                      alignment: Alignment.center,
                      child: CustomText(
                          text: AppConstants.fullGraph, color: AppColors.white),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(25).w),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _scaleFactor += 0.1;
                        });
                      },
                      icon: Icon(Icons.zoom_in)),
                ],
              ),
              SizedBox(height: 15.h),
              _buildSliders(),
              SizedBox(height: 35.h),
              GestureDetector(
                onTap: () {
                  if (!_isButtonDisabled) {
                    _onSubmit();
                    print("Submitted");
                  }
                },
                child: CustomButton(
                    text: _isButtonDisabled ? "Submitted" : "Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliders() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSliderSection(AppConstants.Medicine, _currentMedicineValue,
            (value) => setState(() => _currentMedicineValue = value)),
        _buildSliderSection(AppConstants.Diet, _currentDietValue,
            (value) => setState(() => _currentDietValue = value)),
        _buildSliderSection(AppConstants.Exercise, _currentExerciseValue,
            (value) => setState(() => _currentExerciseValue = value)),
      ],
    );
  }

  Widget _buildSliderSection(
      String title, double currentValue, Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
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
                  value: currentValue,
                  min: 0,
                  max: 10,
                  divisions: 100,
                  label: currentValue.round().toString(),
                  onChanged: onChanged,
                ),
              ),
            ),
            SizedBox(width: 40.w),
            CustomText(
              text: currentValue.round().toString(),
              weight: FontWeight.w600,
              color: AppColors.black,
              size: 18.sp,
            ),
          ],
        ),
        SizedBox(height: 15.h),
      ],
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
        FlSpot(0, 40),
        FlSpot(1, 50),
        FlSpot(2, 60),
        FlSpot(3, 70),
        FlSpot(4, 40),
        FlSpot(5, 30),
        FlSpot(6, 60),
        FlSpot(7, 70),
        FlSpot(8, 80),
        FlSpot(9, 50),
        FlSpot(10, 60),
      ],
    );
  }
}
