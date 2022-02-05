class SlidePuzzleService {
  final List<String> _puzzle;

  List<String> get puzzle => _puzzle;

  SlidePuzzleService(List<String> puzzle) : _puzzle = puzzle;

  void move(String number) {
    var index = _puzzle.indexOf(number);

    _moveRightWhenMovable(index);

    _moveLeftWhenMovable(index);

    _moveBottomWhenMovable(index);

    _moveTopWhenMovable(index);
  }

  void _moveTopWhenMovable(int index) {
    var topIndex = _top(index);
    _swapWhenMovable(topIndex, index);
  }

  void _moveBottomWhenMovable(int index) {
    var bottomIndex = _bottom(index);
    _swapWhenMovable(bottomIndex, index);
  }

  void _moveLeftWhenMovable(int index) {
    var leftIndex = _left(index);
    _swapWhenMovable(leftIndex, index);
  }

  void _moveRightWhenMovable(int index) {
    var rightIndex = _right(index);
    _swapWhenMovable(rightIndex, index);
  }

  void _swapWhenMovable(int targetIndex, int index) {
    if (targetIndex < _puzzle.length &&
        targetIndex >= 0 &&
        _puzzle[targetIndex] == "") {
      _swap(targetIndex, index);
    }
  }

  void _swap(int aIndex, int bIndex) {
    String temp = _puzzle[aIndex];
    _puzzle[aIndex] = _puzzle[bIndex];
    _puzzle[bIndex] = temp;
  }

  int _top(int index) => index - 4;

  int _bottom(int index) => index + 4;

  int _left(int index) => index - 1;

  int _right(int index) => index + 1;
}
