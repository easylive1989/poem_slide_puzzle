import 'package:flutter_test/flutter_test.dart';
import 'package:poem_slide_puzzle/slide_puzzle_controller.dart';

late SlidePuzzleController slidePuzzleController;

main() {
  setUp(() {
    slidePuzzleController = SlidePuzzleController();
  });

  test("display puzzle", () {
    givenPuzzle(["1", "2", "3", "4", "5", "6", "7", "8"]);

    expect(slidePuzzleController.displayPuzzle, [
      ["1", "2", "3", "4"],
      ["5", "6", "7", "8"]
    ]);
  });

  group("move", () {
    test("no way to move", () {
      givenPuzzle(["1", "2", "3", "4", "5", "6", "7", ""]);

      move("6");

      expect(slidePuzzleController.displayPuzzle, [
        ["1", "2", "3", "4"],
        ["5", "6", "7", ""]
      ]);
    });
    test("move down", () {
      givenPuzzle(["1", "2", "3", "4", "5", "6", "7", ""]);

      move("4");

      expect(slidePuzzleController.displayPuzzle, [
        ["1", "2", "3", ""],
        ["5", "6", "7", "4"]
      ]);
    });

    test("move up", () {
      givenPuzzle(["1", "2", "", "4", "5", "6", "3", "7"]);

      move("3");

      expect(slidePuzzleController.displayPuzzle, [
        ["1", "2", "3", "4"],
        ["5", "6", "", "7"]
      ]);
    });

    test("move left", () {
      givenPuzzle(["", "2", "1", "4", "5", "6", "3", "7"]);

      move("2");

      expect(slidePuzzleController.displayPuzzle, [
        ["2", "", "1", "4"],
        ["5", "6", "3", "7"]
      ]);
    });

    test("move right", () {
      givenPuzzle(["2", "7", "1", "4", "5", "6", "3", ""]);

      move("3");

      expect(slidePuzzleController.displayPuzzle, [
        ["2", "7", "1", "4"],
        ["5", "6", "", "3"]
      ]);
    });
  });
}

void move(String number) {
  slidePuzzleController.move(number);
}

void givenPuzzle(List<String> puzzle) {
  slidePuzzleController.puzzle = puzzle;
}
