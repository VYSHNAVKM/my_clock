import 'dart:async';
import 'package:my_clock/utils/color_constant.dart';
import 'package:my_clock/utils/text_style.dart';
import 'package:my_clock/view/bottom_screen/screens/clock_screen/widgets/clock.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:flutter/material.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  DateTime now = DateTime.now();
  Timer? everySec;

  Future<DateTime> fetchClock() async {
    now = DateTime.now();
    return now;
  }

  @override
  void initState() {
    super.initState();

    everySec = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    /* getting time */
    // width:
    // MediaQuery.of(context).size.width * 0.8;
    // height:
    // MediaQuery.of(context).size.height * 0.8;

    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TimerBuilder.periodic(
              Duration(seconds: 1),
              builder: (context) {
                //getting the time
                // String second = DateTime.now().second < 10
                //     ? "0${DateTime.now().second}"
                //     : DateTime.now().second.toString();
                // String minute = DateTime.now().minute < 10
                //     ? "0${DateTime.now().minute}"
                //     : DateTime.now().minute.toString();
                // String hour = DateTime.now().hour < 10
                //     ? "${DateTime.now().hour}"
                //     : DateTime.now().hour.toString();

                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Today", style: TextStyleConstant.mainTextBlack),
                        // TimeText()
                        // Container(
                        //   decoration: BoxDecoration(
                        //       color: Colors.black,
                        //       borderRadius: BorderRadius.circular(20)),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(10.0),
                        //     child: Text("${hour}:${minute}:${second}",
                        //         style: TextStyleConstant.mainTextWhite),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Clock(),
                    SizedBox(
                      height: 50.0,
                    ),
                    Column(
                      children: [
                        Text(
                          'Select another Time Zone',
                          style: TextStyleConstant.mainTextBlack,
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100.0,
                      decoration: BoxDecoration(
                          color: ColorConstant.PrimaryColor,
                          borderRadius: BorderRadius.circular(20)),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    ]);
  }
}
