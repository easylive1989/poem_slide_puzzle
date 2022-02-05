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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PuzzleView(
            puzzle: widget.controller.displayPuzzle,
            onMove: _onMove,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("You win!"),
              const SizedBox(width: 10),
              OutlinedButton(
                onPressed: () {},
                child: const Text("Retry"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onMove(String value) {
    widget.controller.move(value);
    setState(() {});
  }
}
