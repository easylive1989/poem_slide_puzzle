class SlidePuzzleController {
  List<List<String>> get displayPuzzle =>
      _puzzle.fold<List<List<String>>>([[]], (previous, value) {
        if (previous.last.length == 4) {
          previous.add([value]);
        } else {
          previous.last.add(value);
        }
        return previous;
      }).toList();

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
    ""
  ];

  set puzzle(value) => _puzzle = value;

  void move(String number) {
    var index = _puzzle.indexOf(number);
    var rowIndex = index ~/ 4;
    var columnIndex = index % 4;
    var rightIndex = _right(rowIndex, columnIndex);
    var leftIndex = _left(rowIndex, columnIndex);
    var bottomIndex = _bottom(rowIndex, columnIndex);
    var topIndex = _top(rowIndex, columnIndex);

    if (rightIndex < _puzzle.length &&
        rightIndex >= 0 &&
        _puzzle[rightIndex] == "") {
      _swap(rightIndex, index);
    }
    if (leftIndex < _puzzle.length &&
        leftIndex >= 0 &&
        _puzzle[leftIndex] == "") {
      _swap(leftIndex, index);
    }
    if (bottomIndex < _puzzle.length &&
        bottomIndex >= 0 &&
        _puzzle[bottomIndex] == "") {
      _swap(bottomIndex, index);
    }
    if (topIndex < _puzzle.length && topIndex >= 0 && _puzzle[topIndex] == "") {
      _swap(topIndex, index);
    }
  }

  void _swap(int aIndex, int bIndex) {
    String temp = _puzzle[aIndex];
    _puzzle[aIndex] = _puzzle[bIndex];
    _puzzle[bIndex] = temp;
  }

  int _top(int rowIndex, int columnIndex) => (rowIndex - 1) * 4 + columnIndex;

  int _bottom(int rowIndex, int columnIndex) =>
      (rowIndex + 1) * 4 + columnIndex;

  int _left(int rowIndex, int columnIndex) => rowIndex * 4 + columnIndex - 1;

  int _right(int rowIndex, int columnIndex) => rowIndex * 4 + columnIndex + 1;
}
