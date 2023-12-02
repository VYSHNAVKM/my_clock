import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_clock/utils/color_constant.dart';
import 'package:my_clock/utils/text_style.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;
  List laps = [];

  //Creating the stop function
  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  //Creating the reset function
  void reset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = "00";
      digitMinutes = "00";
      digitHours = "00";

      started = false;
    });
  }

  //delete laps

  void addLaps() {
    String lap = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      laps.add(lap);
    });
  }

  //Creating the Start timer function
  void start() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMintues = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMintues > 59) {
          localHours++;
          localMintues = 0;
        } else {
          localMintues++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMintues;
        hours = localHours;
        digitSeconds = (seconds >= 10) ? "$seconds" : "$seconds";
        digitHours = (hours >= 10) ? "$hours" : "$hours";
        digitMinutes = (minutes >= 10) ? "$minutes" : "$minutes";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Center(
              child: Text(
            '$digitHours:$digitMinutes:$digitSeconds',
            style:
                GoogleFonts.dhurjati(fontSize: 50, fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 400,
            decoration: BoxDecoration(
                color: ColorConstant.PrimaryColor,
                borderRadius: BorderRadius.circular(20)),
            //now let's add list builder
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: ListView.separated(
                  itemCount: laps.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 5,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lap number${index + 1}',
                          style: TextStyleConstant.mainTextWhite,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 24,
                        ),
                        Text(
                          '${laps[index]}',
                          style: TextStyleConstant.mainTextWhite,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ))
                      ],
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  onPressed: () {
                    (!started) ? start() : stop();
                  },
                  child: Text(
                    (!started) ? "Start" : "Pause",
                    style: TextStyleConstant.mainTextWhite,
                  )),
              IconButton(
                  onPressed: () {
                    addLaps();
                  },
                  icon: Icon(Icons.add)),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  onPressed: () {
                    reset();
                  },
                  child: Text(
                    'Reset',
                    style: TextStyleConstant.mainTextWhite,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
