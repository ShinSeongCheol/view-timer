import 'package:flutter/material.dart';
import 'package:view_timer/pages/home/index.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.light,
        ),
      ),
      home: HomePage(),
    ),
  );
}