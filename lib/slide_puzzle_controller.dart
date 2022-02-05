import 'package:poem_slide_puzzle/slide_puzzle_service.dart';

class SlidePuzzleController {
  final SlidePuzzleService _slidePuzzleService;

  List<List<String>> get displayPuzzle => _slidePuzzleService.puzzle
          .fold<List<List<String>>>([[]], (previous, value) {
        if (previous.last.length == 4) {
          previous.add([value]);
        } else {
          previous.last.add(value);
        }
        return previous;
      }).toList();

  SlidePuzzleController(SlidePuzzleService slidePuzzleService)
      : _slidePuzzleService = slidePuzzleService;

  void move(String value) {
    _slidePuzzleService.move(value);
  }

  bool isWin() {
    return _slidePuzzleService.isWin();
  }
}
