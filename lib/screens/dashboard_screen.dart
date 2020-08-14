import 'package:fitness_app/constants.dart';
import 'package:fitness_app/size_config.dart';
import 'package:fitness_app/widgets/heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 90,
      child: Column(
        children: [
          _buildDaysBar(),
          _buildDashboardCards(),
        ],
      ),
    );
  }

  Expanded _buildDashboardCards() {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: CustomColors.kBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Column(
          children: [
            HeadingWidget(
              text1: 'ACTIVITY',
              text2: 'Show All',
            ),
            _buildActivityCard(
              color1: CustomColors.kLightPinkColor,
              color2: CustomColors.kCyanColor,
              color3: CustomColors.kYellowColor,
              color4: CustomColors.kPurpleColor,
              activityType: 'Running',
              metric1: '2500',
              metric2: '4000',
              iconPath: 'assets/icons/running.svg',
              value: 0.4,
            ),
            _buildActivityCard(
              color1: CustomColors.kCyanColor,
              color2: CustomColors.kYellowColor,
              color3: CustomColors.kPurpleColor,
              color4: CustomColors.kLightPinkColor,
              activityType: 'Steps',
              metric1: '3500',
              metric2: '860',
              iconPath: 'assets/icons/footprints.svg',
              value: 0.8,
            )
          ],
        ),
      ),
    );
  }

  Container _buildDaysBar() {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 2,
        bottom: SizeConfig.blockSizeVertical * 2,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Today',
            style: CustomTextStyle.dayTabBarStyleActive,
          ),
          Text(
            'Week',
            style: CustomTextStyle.dayTabBarStyleInactive,
          ),
          Text(
            'Month',
            style: CustomTextStyle.dayTabBarStyleInactive,
          ),
          Text(
            'Year',
            style: CustomTextStyle.dayTabBarStyleInactive,
          ),
        ],
      ),
    );
  }

  Container _buildActivityCard(
      {Color color1,
      Color color2,
      Color color3,
      Color color4,
      String activityType,
      String metric1,
      String metric2,
      String iconPath,
      double value}) {
    return Container(
      height: SizeConfig.blockSizeVertical * 30,
      width: SizeConfig.blockSizeHorizontal * 90,
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: CustomColors.kPrimaryColor),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: SizeConfig.blockSizeVertical * 12,
              width: SizeConfig.blockSizeHorizontal * 23,
              decoration: BoxDecoration(
                color: color1,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(130),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: CircleAvatar(
                backgroundColor: color2,
                radius: SizeConfig.blockSizeHorizontal * 8,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: SizeConfig.blockSizeVertical * 10,
              width: SizeConfig.blockSizeHorizontal * 10,
              decoration: BoxDecoration(
                  color: color3,
                  borderRadius: BorderRadius.only(
                      topRight:
                          Radius.circular(SizeConfig.blockSizeVertical * 5),
                      bottomRight:
                          Radius.circular(SizeConfig.blockSizeVertical * 5))),
            ),
          ),
          Positioned(
            bottom: SizeConfig.blockSizeVertical * 5,
            right: SizeConfig.blockSizeHorizontal * 10,
            child: CircleAvatar(
              backgroundColor: color4,
              radius: SizeConfig.blockSizeHorizontal * 6,
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * 10,
            left: SizeConfig.blockSizeHorizontal * 16,
            child: CircleAvatar(
              backgroundColor: color4,
              radius: SizeConfig.blockSizeHorizontal * 2,
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * 3,
            left: SizeConfig.blockSizeHorizontal * 6,
            child: Container(
              child: Row(
                children: [
                  SvgPicture.asset(
                    iconPath,
                    height: SizeConfig.blockSizeVertical * 5, //20
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeVertical * 1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activityType,
                        style: TextStyle(color: Color(0xffc4bbcc)),
                      ),
                      Text(
                        metric1,
                        style: CustomTextStyle.metricTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: SizeConfig.blockSizeVertical * 5,
            left: SizeConfig.blockSizeHorizontal * 6,
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    metric2,
                    style: CustomTextStyle.metricTextStyle,
                  ),
                  Text(
                    ' m',
                    style: TextStyle(color: CustomColors.kLightColor),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: SizeConfig.blockSizeVertical * 1,
              width: SizeConfig.blockSizeHorizontal * 75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: LinearProgressIndicator(
                  value: value,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  backgroundColor: Color(0xffc4bbcc).withOpacity(0.2),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
