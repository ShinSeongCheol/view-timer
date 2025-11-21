import 'package:flutter/material.dart';
import 'package:view_timer/entities/clock/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Clock()
            ],
          )
      ),
    );
  }
}
