import 'package:flutter/material.dart';

import 'analogic_circle.dart';
import 'hour_pointer.dart';
import 'minute_pointer.dart';
import 'second_pointer.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
        const Duration(seconds: 1),
      ),
      builder: (context, snapshot) {
        return Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                AnalogicCircle(),
                HourPointer(),
                MinutePointer(),
                SecondPointer(),
                Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
