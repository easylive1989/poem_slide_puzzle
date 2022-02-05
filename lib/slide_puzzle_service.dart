import 'package:poem_slide_puzzle/slide_puzzle_repository.dart';

class SlidePuzzleService {
  final SlidePuzzleRepository _slidePuzzleRepository;

  List<String> get puzzle => _slidePuzzleRepository.getPuzzle();

  SlidePuzzleService(SlidePuzzleRepository slidePuzzleRepository)
      : _slidePuzzleRepository = slidePuzzleRepository;

  void move(String number) {
    var index = puzzle.indexOf(number);

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
    if (targetIndex < puzzle.length &&
        targetIndex >= 0 &&
        puzzle[targetIndex] == "") {
      _swap(puzzle, targetIndex, index);
    }
  }

  void _swap(List<String> puzzle, int aIndex, int bIndex) {
    String temp = puzzle[aIndex];
    puzzle[aIndex] = puzzle[bIndex];
    puzzle[bIndex] = temp;
  }

  int _top(int index) => index - 4;

  int _bottom(int index) => index + 4;

  int _left(int index) => index - 1;

  int _right(int index) => index + 1;

  bool isWin() {
    return _slidePuzzleRepository.isWin();
  }
}
