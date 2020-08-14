import 'package:fitness_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

// Chart to display weekly steps count of user.
class WeeklyBarChartWidget extends StatelessWidget {

  final List<int> weeklyData;
  final double maximumValueOnYAxis;
  WeeklyBarChartWidget(
      {this.weeklyData, this.maximumValueOnYAxis});

  // Card containing the bar graph.
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          color: Colors.white,
          elevation: 0.0,
          child: Container(
            margin: EdgeInsets.only(top: 15.0),
            child: BarChart(
              mainBarData(),
            ),
          ),
        ),
      ),
    );
  }

  // Function to draw the bar.
  BarChartGroupData makeGroupData(
    int x, // data to show on x - axis
    double y, // value for y axis
    ) {
    return BarChartGroupData(
      x: x,
      /// bar rods is an array and is helpful in case of charts need two bars for same x axis value.
      barRods: [
        BarChartRodData(
          y: y,
          color: CustomColors.kCyanColor,
          width: 15.0,
          // Background bar.
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            color: CustomColors.kCyanColor.withOpacity(0.2),
            y: maximumValueOnYAxis
          ),
        ),
      ],
    );
  }

  // Generate the data responsible for displaying the graph of steps count of user.
  List<BarChartGroupData> showingGroups() {
    return List.generate(weeklyData.length, (index) {
      return makeGroupData(index, weeklyData[index].toDouble());
    });
  }

  /// To build x and y axis for graph.
  FlTitlesData _buildAxes() {
    return FlTitlesData(
      show: true,
      // Build X Axis here.
      bottomTitles: SideTitles(
        showTitles: true,
        textStyle: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
        margin: 12,
        getTitles: (double value) {
          switch (value.toInt()) {
            case 0:
              return 'Mon';
            case 1:
              return 'Tue';
            case 2:
              return 'Wed';
            case 3:
              return 'Thu';
            case 4:
              return 'Fri';
            case 5:
              return 'Sat';
            case 6:
              return 'Sun';
            default:
              return '';
          }
        },
      ),
      leftTitles: SideTitles(showTitles: false),
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      maxY: maximumValueOnYAxis,
      alignment: BarChartAlignment.center,
      groupsSpace: 40.0,
      /// To add x-axis and y-axis in the graph we use titlesData.
      titlesData: _buildAxes(),
      borderData: FlBorderData(
        show: false,
      ),
      // Function responsible for data bars.
      barGroups: showingGroups(),
    );
  }
}
