import 'package:flutter/material.dart';
import 'package:flutter_dashboard_mockup/app_colors.dart';

class CustomBarChart extends StatelessWidget {
  final List<int> values = [30, 70, 50, 90, 60, 40, 80];
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final double height;
  final double width;

  CustomBarChart(this.height, this.width, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: BoxDecoration(
        color: AppColors.canary,
        borderRadius: BorderRadius.circular(40),
      ),
      child: CustomPaint(
        painter: BarChartPainter(values, days, height, width)
      ));

  }
}

class BarChartPainter extends CustomPainter {
  final List<int> values;
  final List<String> days;
  final double barWidth = 22;
  final double padding = 0;
  final double borderRadius = 10;
  final double height;
  final double width;

  BarChartPainter(this.values, this.days, this.height, this.width);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint dashedLinePaint = Paint()
      ..color = AppColors.almostBlack2WithAlpa
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final Paint barBackgroundPaint = Paint()..color = AppColors.almostBlack2WithAlpa;
    final Paint barForegroundPaint = Paint()..color = AppColors.almostBlack2;

    final double chartWidth = width * 0.90;
    final double chartHeight = height - padding;
    final double maxY = 90;

    final double spacing = chartWidth / values.length;

    // dotted lines
    for (double yValue in [0, 45, 90]) {
      double y = chartHeight - (yValue / maxY) * chartHeight;
      _drawDashedLine(canvas, Offset(padding, y), Offset(width, y), dashedLinePaint);
    }

    // vertical bars
    for (int i = 0; i < values.length; i++) {
      double x = padding + (i * spacing) + (spacing / 2) - (barWidth / 2);

      // vertical bars (light)
      final rrectBackground = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, 0, barWidth, chartHeight),
        Radius.circular(borderRadius),
      );
      canvas.drawRRect(rrectBackground, barBackgroundPaint);

      // vertical bars height
      double barHeight = (values[i] / maxY) * chartHeight;
      double y = chartHeight - barHeight;

      final rrectForeground = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, barWidth, barHeight),
        Radius.circular(borderRadius),
      );
      canvas.drawRRect(rrectForeground, barForegroundPaint);
    }

    // Y axis
    for (double yValue in [0, 45, 90]) {
      double y = chartHeight - (yValue / maxY) * chartHeight;
      final textSpan = TextSpan(
        text: yValue.toInt().toString(),
        style: TextStyle(color: AppColors.almostBlack2, fontSize: 10),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(canvas,
          Offset(padding - textPainter.width - 5, y - textPainter.height / 2));
    }

    // X axis
    for (int i = 0; i < days.length; i++) {
      double x = padding + (i * spacing) + (spacing / 2) - (barWidth / 2);
      final textSpan = TextSpan(
        text: days[i],
        style: TextStyle(color: AppColors.almostBlack2, fontSize: 12),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(canvas,
          Offset(x + barWidth / 2 - textPainter.width / 2, chartHeight + 5));
    }
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    const double dashWidth = 5;
    const double dashSpace = 3;
    double currentX = start.dx;
    double step = dashWidth + dashSpace;

    while (currentX < end.dx) {
      double nextX = currentX + dashWidth;
      if (nextX > end.dx) nextX = end.dx;
      canvas.drawLine(Offset(currentX, start.dy), Offset(nextX, start.dy), paint);
      currentX += step;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
