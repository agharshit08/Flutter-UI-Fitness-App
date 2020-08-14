import 'package:fitness_app/constants.dart';
import 'package:fitness_app/size_config.dart';
import 'package:fitness_app/widgets/indicator_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ActivityPieChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ActivityPieChartState();
}

class ActivityPieChartState extends State {
  int _touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: SizeConfig.blockSizeVertical * 25,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 0.0,
        child: Row(
          children: <Widget>[
            Container(
              // color: Colors.red,
              width: SizeConfig.blockSizeHorizontal * 60,
              child: PieChart(
                PieChartData(
                    pieTouchData:
                        PieTouchData(touchCallback: (pieTouchResponse) {
                      setState(() {
                        if (pieTouchResponse.touchInput is FlLongPressEnd ||
                            pieTouchResponse.touchInput is FlPanEnd) {
                          _touchedIndex = -1;
                        } else {
                          _touchedIndex = pieTouchResponse.touchedSectionIndex;
                        }
                      });
                    }),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0.0,
                    centerSpaceRadius: 50,
                    sections: showingSections(),
                    startDegreeOffset: 30),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 3),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Indicator(
                      color: CustomColors.kPrimaryColor,
                      iconPath: 'assets/icons/running.svg',
                      title: 'RUNNING',
                      subtitle: '10 KM',
                    ),
                    
                    Indicator(
                      color: CustomColors.kCyanColor,
                      iconPath: 'assets/icons/bike.svg',
                      title: 'CYCLING',
                      subtitle: '10 KM',
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Indicator(
                      color: CustomColors.kPrimaryColor,
                      iconPath: 'assets/icons/swimmer.svg',
                      title: 'SWIMMING',
                      subtitle: '10 KM',
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == _touchedIndex;
      final double radius = isTouched ? 30 : 20;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: CustomColors.kLightPinkColor,
            value: 33.33,
            title: '',
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: CustomColors.kPrimaryColor,
            value: 33.3,
            title: '',
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: CustomColors.kCyanColor,
            value: 33.3,
            title: '',
            radius: radius,
          );
        default:
          return null;
      }
    });
  }
}
