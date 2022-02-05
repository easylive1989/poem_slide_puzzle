import 'package:flutter/material.dart';
import 'package:poem_slide_puzzle/puzzle_view.dart';
import 'package:poem_slide_puzzle/slide_puzzle_controller.dart';

class SlidePuzzleView extends StatefulWidget {
  final SlidePuzzleController controller;

  const SlidePuzzleView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<SlidePuzzleView> createState() => _SlidePuzzleViewState();
}

class _SlidePuzzleViewState extends State<SlidePuzzleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PuzzleView(
        puzzle: widget.controller.displayPuzzle,
        onMove: _onMove,
      ),
    );
  }

  void _onMove(String value) {
    widget.controller.move(value);
    setState(() {});
  }
}
