import 'dart:math';
import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    double width = 300;
    double height = 300;

    return Stack(
      alignment: Alignment.center,
      children: [
        // 1) 배경 원
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(4, 2),
                blurRadius: 2,
              ),
            ],
          ),
        ),

        // 2) 원형 진행바
        SizedBox(
          width: width,
          height: height,
          child: CircularProgressIndicator(
            value: 0.3,
            strokeWidth: 12,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),

        // 3) 0~55분 숫자 표시
        SizedBox(
          width: width,
          height: height,
          child: CustomPaint(
            painter: MinuteTextPainter(),
          ),
        ),
      ],
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
