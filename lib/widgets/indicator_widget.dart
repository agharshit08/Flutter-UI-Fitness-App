import 'package:fitness_app/constants.dart';
import 'package:fitness_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Indicator extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String iconPath;

  const Indicator({this.color, this.title, this.subtitle, this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(
          iconPath,
          height: SizeConfig.blockSizeVertical * 4,
          color: color,
        ),
        SizedBox(
          width: SizeConfig.blockSizeHorizontal * 1,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              style: TextStyle(
                  color: CustomColors.kLightColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
