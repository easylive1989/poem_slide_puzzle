import 'dart:math';

class SlidePuzzleRepository {
  List<String> _puzzle = [
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
  ]
    ..shuffle(Random())
    ..add("");

  List<String> get() {
    return _puzzle;
  }

  void set(List<String> puzzle) {
    _puzzle = puzzle;
  }
}
