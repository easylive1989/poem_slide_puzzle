import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poem_slide_puzzle/slide_puzzle_controller.dart';
import 'package:poem_slide_puzzle/slide_puzzle_service.dart';

late SlidePuzzleController slidePuzzleController;
late MockSlidePuzzleService mockSlidePuzzleService;

main() {
  setUp(() {
    mockSlidePuzzleService = MockSlidePuzzleService();
    slidePuzzleController = SlidePuzzleController(mockSlidePuzzleService);
  });

  test("display puzzle", () {
    givenPuzzle(["1", "2", "3", "4", "5", "6", "7", "8"]);

    expect(slidePuzzleController.displayPuzzle, [
      ["1", "2", "3", "4"],
      ["5", "6", "7", "8"]
    ]);
  });
}

void move(String number) {
  slidePuzzleController.move(number);
}

void givenPuzzle(List<String> puzzle) {
  when(() => mockSlidePuzzleService.puzzle).thenReturn(puzzle);
}

class MockSlidePuzzleService extends Mock implements SlidePuzzleService {}
