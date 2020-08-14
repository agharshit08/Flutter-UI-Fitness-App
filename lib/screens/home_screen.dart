import 'package:fitness_app/constants.dart';
import 'package:fitness_app/screens/activity_screen.dart';
import 'package:fitness_app/screens/dashboard_screen.dart';
import 'package:fitness_app/screens/metrics_screen.dart';
import 'package:fitness_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final tabs = [
    DashboardScreen(),
    ActivityScreen(),
    MetricsScreen(),
    Center(
      child: Text('profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: CustomColors.kPrimaryColor,
            size: 30,
          ),
          onPressed: () {},
        ),
        title: SvgPicture.asset(
          'assets/icons/dumbell.svg',
          height: SizeConfig.blockSizeHorizontal * 10,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.notifications,
              size: 30,
              color: CustomColors.kPrimaryColor,
            ),
          )
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/apps.svg',
              height: 30,
              color: CustomColors.kPrimaryColor,
            ),
            icon: SvgPicture.asset(
              'assets/icons/apps.svg',
              height: 30,
              color: Colors.grey,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/clock.svg',
              height: 30,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/clock.svg',
              height: 30,
              color: CustomColors.kPrimaryColor,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/stats.svg',
              height: 30,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/stats.svg',
              height: 30,
              color: CustomColors.kPrimaryColor,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              height: 30,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/user.svg',
              height: 30,
              color: CustomColors.kPrimaryColor,
            ),
            title: Container(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: CustomColors.kPrimaryColor,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
