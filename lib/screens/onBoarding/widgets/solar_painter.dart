import 'dart:ui' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:friendzy_app/entity/solar.dart';
import 'package:friendzy_app/utils/colours.dart';
import 'package:flutter/material.dart';

class SolarPainter extends CustomPainter {
  late final List<Solar> solars;
  late final Animation animation;
  SolarPainter({required this.solars, required this.animation});

  Paint imagePaint = Paint();
  final Paint orbitWhitePaint = Paint()..color = Colors.white;
  final Paint orbitPinkPaint = Paint()
    ..color = Colours.kSecondary1.withOpacity(0.15);
  final Paint dottedLinePaint = Paint()
    ..color = Colours.kSecondary1.withOpacity(0.16)
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..shader = null
    ..strokeJoin = StrokeJoin.round;

  @override
  paint(Canvas canvas, Size size) {
    final Offset center = Offset(0.5.sw, 205.h);
    // 绘制粉色轨道
    canvas.drawCircle(center, 100.w, orbitPinkPaint);
    // 绘制白色轨道
    canvas.drawCircle(center, 60.w, orbitWhitePaint);
    // 绘制虚线轨道
    drawDottedLine(canvas, center);
    if (solars.isNotEmpty) {
      drawSolar(canvas, solars.first, Offset(center.dx, center.dy));
    }

    //循环solars绘制图片
    for (var i = 0; i < solars.length - 1; i++) {
      var firstAxis = Path()
        ..addOval(
            Rect.fromCircle(center: center, radius: solars[i + 1].radius));
      ui.PathMetrics pathMetrics = firstAxis.computeMetrics();
      for (ui.PathMetric pathMetric in pathMetrics) {
        Path extractPath = pathMetric.extractPath(
            0.0, pathMetric.length * solars[i + 1].begin,
            startWithMoveTo: false);
        try {
          var metric = extractPath.computeMetrics().first;
          final offset = metric.getTangentForOffset(metric.length)!.position;
          drawSolar(canvas, solars[i + 1], offset);
        } catch (e) {
          print(e);
        }
      }
    }
  }

  drawSolar(Canvas canvas, Solar solar, Offset offset) {
    //定义源矩形
    Rect srcRect = Rect.fromLTWH(
        0, 0, solar.imageInfo.width + 0, solar.imageInfo.height + 0);
    // 定义目标矩形
    Rect dstRect = Rect.fromLTWH(offset.dx - solar.size.width / 2,
        offset.dy - solar.size.height / 2, solar.size.width, solar.size.height);

    // 裁剪为圆形
    RRect rRect = RRect.fromRectAndRadius(dstRect, Radius.circular(40.r));
    Path roundPath = Path()..addRRect(rRect);
    canvas.save();
    canvas.clipPath(roundPath);
    canvas.drawImageRect(solar.imageInfo, srcRect, dstRect, Paint());
    canvas.restore();
  }

  drawDottedLine(Canvas canvas, Offset center) {
    Path path = Path();
    path.addOval(Rect.fromCircle(center: center, radius: 145.r));
    ui.PathMetrics pathMetrics = path.computeMetrics();
    ui.PathMetric pathMetric = pathMetrics.elementAt(0);
    double length = pathMetric.length;
    double dashWidth = 12;
    double dashSpace = 8;
    double currentDistance = 0;

    while (currentDistance < length) {
      double start = currentDistance;
      double end = currentDistance + dashWidth;
      if (end > length) {
        end = length;
      }

      Path dashPath = pathMetric.extractPath(start, end);
      canvas.drawPath(dashPath, dottedLinePaint);
      currentDistance += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
