import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
class DashedArc extends CustomPainter {
  final Color color;

  DashedArc({Color color}) : color = color ?? Colors.white;

  @override
  void paint(Canvas canvas, Size size) {
    double dashSize = 6;
    double gapSize = 10.0;
    final redPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final yellowPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0;

    final path =         Path()
    // tell the path where to start
      ..moveTo(0,size.height)

      ..quadraticBezierTo(size.width / 2, 0, size.width, size.height);
    canvas.drawPath(
        dashPath(
            path,
            // dash is `dashSize` long followed by a gap `gapSize` long
            dashArray: CircularIntervalList<double>([dashSize, gapSize]),
            dashOffset: DashOffset.percentage(0.005)),
        redPaint);
    PathMetrics pathMetrics = path.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      Path extractPath = pathMetric.extractPath(
        0.0,
        pathMetric.length * 0.25,
      );
      try {
        var metric = extractPath.computeMetrics().first;
        final offset = metric.getTangentForOffset(metric.length).position;
        canvas.drawCircle(offset, 12.0, yellowPaint);
      } catch (e) {}
    }



  }

  @override
  bool shouldRepaint(DashedArc oldDelegate) {
    return false;  }
}