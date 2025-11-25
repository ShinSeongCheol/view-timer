import 'package:flutter/material.dart';
import 'package:view_timer/features/timer/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TimerFeature()
      );
  }
}
