import 'dart:math';

import 'package:flutter/foundation.dart';

class SlidePuzzleRepository {
  final List<String> _answer;
  List<String> _puzzle;

  factory SlidePuzzleRepository.number() {
    return SlidePuzzleRepository([
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
      "12",
      "13",
      "14",
      "15",
    ]);
  }

  SlidePuzzleRepository(List<String> answer)
      : _answer = answer,
        _puzzle = List.of(answer)
          ..shuffle(Random())
          ..add("");

  List<String> getPuzzle() {
    return _puzzle;
  }

  void set(List<String> puzzle) {
    _puzzle = puzzle;
  }

  bool isWin() {
    return listEquals(_puzzle, _answer);
  }
}
