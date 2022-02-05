import 'package:flutter/material.dart';
import 'package:poem_slide_puzzle/slide_puzzle_controller.dart';
import 'package:poem_slide_puzzle/slide_puzzle_repository.dart';
import 'package:poem_slide_puzzle/slide_puzzle_service.dart';
import 'package:poem_slide_puzzle/slide_puzzle_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SlidePuzzleView(
        controller:
            SlidePuzzleController(SlidePuzzleService(SlidePuzzleRepository())),
      ),
    );
  }
}
