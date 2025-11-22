import 'package:flutter/material.dart';
import 'package:view_timer/entities/clock/index.dart';
import 'package:view_timer/entities/timer/ui/timer.dart';

class TimerFeature extends StatefulWidget {
  const TimerFeature({super.key});

  @override
  State<TimerFeature> createState() => _TimerFeature();
}

class _TimerFeature extends State<TimerFeature> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Timer(),
        Text('11:00:00'),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              isPlaying = !isPlaying;
            });
          },
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          shape: CircleBorder(),
          child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
        ),
      ],
    );
  }
}
