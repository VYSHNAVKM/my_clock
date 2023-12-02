import 'package:flutter/material.dart';
import 'package:my_clock/utils/text_style.dart';
import 'package:my_clock/view/bottom_screen/screens/clock_screen/clock_screen.dart';
import 'package:my_clock/view/bottom_screen/screens/stopwatch_screen/stopwatch_screen.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    ClockScreen(),
    StopwatchScreen(),
    Text('hi'),
  ];
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Alarm', style: TextStyleConstant.mainTextBlack),
      ),
      body: _pages.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        selectedFontSize: 15,
        selectedIconTheme: IconThemeData(color: Colors.black, size: 30),
        unselectedIconTheme: IconThemeData(size: 30),
        unselectedLabelStyle: TextStyleConstant.subTextBlack,
        selectedLabelStyle: TextStyleConstant.mainTextBlack,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_rounded),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_outlined),
            label: 'Stopwatch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Alarm',
          ),
        ],
      ),
    );
  }
}
