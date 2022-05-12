import 'package:flutter/material.dart';
import 'dart:math';

class SecondPointer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final second = DateTime.now().second.toDouble();
    final angle = (-pi * (second / -60) * 2);
    return RotatedBox(
      quarterTurns: 2,
      child: Transform.rotate(
        angle: angle,
        child: Transform.translate(
          offset: const Offset(0, 19),
          child: Center(
            child: Container(
              height: height * 0.09,
              width: 3,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
