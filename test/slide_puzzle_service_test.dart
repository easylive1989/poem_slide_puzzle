import 'package:flutter_test/flutter_test.dart';
import 'package:poem_slide_puzzle/slide_puzzle_service.dart';

late SlidePuzzleService slidePuzzleService;

main() {
  test("no way to move", () {
    givenPuzzle(["1", "2", "3", "4", "5", "6", "7", ""]);

    move("6");

    expect(slidePuzzleService.puzzle, [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "",
    ]);
  });
  test("move down", () {
    givenPuzzle(["1", "2", "3", "4", "5", "6", "7", ""]);

    move("4");

    expect(slidePuzzleService.puzzle, [
      "1",
      "2",
      "3",
      "",
      "5",
      "6",
      "7",
      "4",
    ]);
  });

  test("move up", () {
    givenPuzzle(["1", "2", "", "4", "5", "6", "3", "7"]);

    move("3");

    expect(slidePuzzleService.puzzle, [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "",
      "7",
    ]);
  });

  test("move left", () {
    givenPuzzle(["", "2", "1", "4", "5", "6", "3", "7"]);

    move("2");

    expect(slidePuzzleService.puzzle, [
      "2",
      "",
      "1",
      "4",
      "5",
      "6",
      "3",
      "7",
    ]);
  });

  test("move right", () {
    givenPuzzle(["2", "7", "1", "4", "5", "6", "3", ""]);

    move("3");

    expect(slidePuzzleService.puzzle, [
      "2",
      "7",
      "1",
      "4",
      "5",
      "6",
      "",
      "3",
    ]);
  });
}

void move(String number) {
  slidePuzzleService.move(number);
}

void givenPuzzle(List<String> puzzle) {
  slidePuzzleService = SlidePuzzleService(puzzle);
}
