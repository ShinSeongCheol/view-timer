import 'dart:math';

import 'package:flutter/material.dart';

class Timer extends StatelessWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = 300;
    double height = 300;

    double centerY;
    double px;
    double py;
    double dx;
    double dy;
    double centerX;
    return Stack(
      children: [
        CircleContainer(width: width, height: height),
        CircularProgressIndicatorBox(width: width, height: height),
        SizedBox(
          width: width,
          height: height,
          child: Listener(
            onPointerMove: (e) {
              final centerX = width / 2;
              final centerY = height / 2;

              final px = e.localPosition.dx;
              final py = e.localPosition.dy;

              final dx = px - centerX;
              final dy = py - centerY;

              double angleDeg = atan2(dy, dx) * 180 / pi + 90;

              angleDeg %= 360;
              if (angleDeg < 0) angleDeg += 360;
            },
            child: CustomPaint(painter: MinuteTextPainter()),
          ),
        ),
        SizedBox(
          width: 200,
          height: 200,
          child: BackgroundCirclePainter()
        ),
      ],
    );
  }
}

class CircleContainer extends StatelessWidget {
  final double width;
  final double height;

  const CircleContainer({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(color: Colors.grey, offset: Offset(4, 2), blurRadius: 2),
        ],
      ),
      child: Center(child: Text("Timer")),
    );
  }
}

class CircularProgressIndicatorBox extends StatelessWidget {
  final double width;
  final double height;

  const CircularProgressIndicatorBox({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CircularProgressIndicator(
        value: 0.9,
        strokeWidth: 12,
        backgroundColor: Colors.transparent,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      ),
    );
  }
}

class MinuteTextPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 30; // 숫자 위치 반지름(조절 가능)
    final textStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    for (int i = 0; i < 12; i++) {
      int minute = i * 5; // 0,5,10...55

      // 각도(라디안)
      double angle = -pi / 2 + (2 * pi / 12) * i;

      // 표시 좌표
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);

      final textPainter = TextPainter(
        text: TextSpan(text: "$minute", style: textStyle),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      // 중앙 정렬
      canvas.save();
      canvas.translate(x - textPainter.width / 2, y - textPainter.height / 2);
      textPainter.paint(canvas, Offset.zero);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// class BackgroundCirclePainter extends CustomPainter {
//   double angle = pi / 4;
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint();
//     Offset p1 = Offset(150, 150);
//     Offset p2 = Offset(150 + 150 * cos(angle), 150 + 150 * sin(angle));
//     canvas.drawLine(p1, p2, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

class BackgroundCirclePainter extends StatefulWidget {
  const BackgroundCirclePainter({super.key});

  @override
  State<BackgroundCirclePainter> createState() => _BackgroundCirclePainter();
}

class _BackgroundCirclePainter extends State<BackgroundCirclePainter> {
  double angle = 0;
  double width = 300;
  double height = 300;

  late double centerX = width / 2;
  late double centerY = height / 2;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (e) {
        final px = e.localPosition.dx;
        final py = e.localPosition.dy;

        final dx = px - centerX;
        final dy = py - centerY;

        setState(() {
          angle = atan2(dy, dx);
        });
      },
      onPointerDown: (e) {
        final px = e.localPosition.dx;
        final py = e.localPosition.dy;

        final dx = px - centerX;
        final dy = py - centerY;

        setState(() {
          angle = atan2(dy, dx);
        });
      },
      child: CustomPaint(
          painter: BackgroundPainter(width: width, height: height, angle: angle)
      )
    );
  }

}

class BackgroundPainter extends CustomPainter {

  double width = 300;
  double height = 300;
  double angle = 0;
  late double r = width / 2;

  BackgroundPainter({required this.width, required this.height, required this.angle});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.strokeWidth = 3;

    canvas.drawLine(Offset(width / 2, height / 2), Offset(r + r * cos(angle), r + r * sin(angle)), paint);
  }

  @override
  bool shouldRepaint(covariant BackgroundPainter oldDelegate) {
    return oldDelegate.angle != angle;
  }

}