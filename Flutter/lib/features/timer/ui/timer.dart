import 'package:flutter/material.dart';
import 'package:view_timer/entities/clock/index.dart';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _Timer();
}

class _Timer extends State<Timer> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Clock(),
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
