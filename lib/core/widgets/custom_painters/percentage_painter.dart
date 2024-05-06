import 'package:dummy_json/core/utils/constants/colors_constants.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

// class PercentagePainter extends CustomPainter {
//   final double percentage;

//   PercentagePainter({required this.percentage});

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint fillPaint = Paint()
//       ..color = Color(0xFF4A29BF)
//       ..strokeCap = StrokeCap.round
//       ..style = PaintingStyle.fill;

//     Paint unfilledPaint = Paint()
//       ..color = kColorPrimary
//       ..strokeCap = StrokeCap.round
//       ..style = PaintingStyle.fill;

//     Paint borderPaint = Paint()
//       ..color = kColorFontWhite
//       ..strokeCap = StrokeCap.round
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1.0;

//     double radius = size.width / 2.0;
//     double angle = 2 * math.pi * (percentage / 100);

//     canvas.drawCircle(
//       Offset(radius, radius),
//       radius,
//       unfilledPaint,
//     );

//     Path path = Path();
//     path.moveTo(radius, radius);
//     path.arcTo(
//       Rect.fromCircle(center: Offset(radius, radius), radius: radius),
//       -math.pi /
//           2, // Start angle (90 degrees offset for the starting position at the top)
//       -angle, // Use negative angle for counter-clockwise direction
//       false,
//     );
//     path.lineTo(radius, radius);

//     canvas.drawPath(path, fillPaint);

//     // Draw the border
//     canvas.drawCircle(
//       Offset(radius, radius),
//       radius,
//       borderPaint,
//     );
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }

class PercentagePainter extends CustomPainter {
  final double percentage;

  PercentagePainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    Paint fillPaint = Paint()
      ..color = const Color(0xFF4A29BF)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    Paint unfilledPaint = Paint()
      ..color = kColorPrimary
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    Paint borderPaint = Paint()
      ..color = kColorFontWhite
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    double radius = size.width / 2.0;
    double angle = 2 * math.pi * (percentage / 100);

    // Draw the unfilled background
    canvas.drawCircle(
      Offset(radius, radius),
      radius,
      unfilledPaint,
    );

    // Draw the filled portion
    Path path = Path();
    path.moveTo(radius, radius);
    path.arcTo(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius),
      -math.pi / 2,
      angle,
      false,
    );
    path.lineTo(radius, radius);

    canvas.drawPath(path, fillPaint);

    // Draw the border
    canvas.drawCircle(
      Offset(radius, radius),
      radius,
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
