import 'package:flutter/material.dart';

class PuzzleView extends StatelessWidget {
  final List<List<String>> puzzle;
  final Function(String) onMove;

  const PuzzleView({
    Key? key,
    required this.puzzle,
    required this.onMove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: puzzle.map((rowOfPuzzle) {
        return Row(
          children: rowOfPuzzle
              .map(
                (value) => Expanded(
                  child: GestureDetector(
                    onTap: () => onMove(value),
                    child: SizedBox(
                      height: 30,
                      child: Text(
                        value,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        );
      }).toList(),
    );
  }
}
