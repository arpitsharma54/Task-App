import 'package:flutter/material.dart';
import 'dart:math';

class HourPointer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final hour = DateTime.now().hour.toDouble();
    final angle = (-pi * (hour / -12) * 2);
    return RotatedBox(
      quarterTurns: 2,
      child: Transform.rotate(
        angle: angle,
        child: Transform.translate(
          offset:const Offset(0, 20),
          child: Center(
            child: Container(
              height: height * 0.04,
              width: 3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
