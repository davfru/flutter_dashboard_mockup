import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dashboard_mockup/app_colors.dart';

class DonutWidget extends StatelessWidget {
  final double percentage;
  final int number;

  const DonutWidget(
      {super.key, required this.percentage, required this.number});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 140,
            height: 140,
            child: CustomPaint(
              painter: DonutPainter(percentage),
            ),
          ),
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              color: AppColors.almostBlack3,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DonutPainter extends CustomPainter {
  final double percentage;

  DonutPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 30.0;
    final rect = Offset.zero & size;
    final startAngle = -pi / 2;

    final blackPaint = Paint()
      ..color = AppColors.almostBlack3
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(rect, startAngle, 2 * pi, false, blackPaint);

    final yellowPaint = Paint()
      ..color = AppColors.canary
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(rect, startAngle, 2 * pi * percentage, false, yellowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
