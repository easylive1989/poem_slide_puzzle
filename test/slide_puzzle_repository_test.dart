import 'package:flutter_test/flutter_test.dart';
import 'package:poem_slide_puzzle/slide_puzzle_repository.dart';

main() {
  test("is win", () {
    var slidePuzzleRepository = SlidePuzzleRepository(["1", "2", "3"]);

    slidePuzzleRepository.set(["1", "2", "3"]);

    expect(slidePuzzleRepository.isWin(), true);
  });

  test("is not win", () {
    var slidePuzzleRepository = SlidePuzzleRepository(["1", "2", "3"]);

    slidePuzzleRepository.set(["1", "3", "2"]);

    expect(slidePuzzleRepository.isWin(), false);
  });
}
