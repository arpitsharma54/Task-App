import 'package:flutter/material.dart';
import 'dart:math';

class MinutePointer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final minute = DateTime.now().minute.toDouble();
    final angle = (-pi * (minute / -60) * 2);
    return RotatedBox(
      quarterTurns: 2,
      child: Transform.rotate(
        angle: angle,
        child: Transform.translate(
          offset: const Offset(0, 15),
          child: Center(
            child: Container(
              height: height * 0.072,
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
