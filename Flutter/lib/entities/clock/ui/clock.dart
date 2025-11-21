import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: CircularProgressIndicator(
        value: 0.50,
        strokeWidth: 10,
        backgroundColor: Colors.grey[300],
        valueColor: AlwaysStoppedAnimation(Colors.red),
      ),
    );
  }

}