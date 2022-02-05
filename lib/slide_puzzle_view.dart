import 'package:flutter/material.dart';
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
        children: widget.controller.displayPuzzle.map((rowOfPuzzle) {
          return Row(
            children: rowOfPuzzle
                .map(
                  (value) => Expanded(
                    child: GestureDetector(
                      onTap: () {
                        widget.controller.move(value);
                        setState(() {});
                      },
                      child: Text(
                        value,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        }).toList(),
      ),
    );
  }
}
