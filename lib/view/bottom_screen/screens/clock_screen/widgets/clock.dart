import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width - 100,
          height: MediaQuery.of(context).size.width - 100,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width),
          ),
        ),
        const Positioned(
            top: 10,
            left: 10,
            right: 10,
            bottom: 10,
            child: AnalogClock(
              isLive: true,
              hourHandColor: Colors.black,
              minuteHandColor: Colors.black54,
              numberColor: Colors.black45,
              secondHandColor: Colors.pinkAccent,
              showNumbers: true,
              showAllNumbers: true,
              showDigitalClock: false,
            )),
      ],
    );
  }
}
