import 'package:fitness_app/constants.dart';
import 'package:fitness_app/size_config.dart';
import 'package:fitness_app/widgets/activity_pie_chart.dart';
import 'package:fitness_app/widgets/heading_widget.dart';
import 'package:fitness_app/widgets/hourly_bar_chart_widget.dart';
import 'package:fitness_app/widgets/weekly_bar_chart_widget.dart';
import 'package:flutter/material.dart';

class MetricsScreen extends StatelessWidget {
  final List<int> weeklyData = [10, 12, 4, 16, 20, 16, 14];
  final List<int> hourlyData = [
    5,7,10,11,17,18,14,15,12,11,8,7,11,19,6,8,10,12,18,16,14,17,11,13
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 82,
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColors.kBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeadingWidget(text1: 'EXERCISE', text2: '',),
            ActivityPieChart(),
            HeadingWidget(text1: 'GOAL COMPLIANCE', text2: '',),
            WeeklyBarChartWidget(
              weeklyData: weeklyData,
              maximumValueOnYAxis: 22,
            ),
            HeadingWidget(text1: 'EXERCISE AVG', text2: '',),
            HourlyBarChartWidget(
              hourlyData: hourlyData,
              maximumValueOnYAxis: 22,
            ),
          ],
        ),
      ),
    );
  }
}
