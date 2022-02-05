import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poem_slide_puzzle/slide_puzzle_controller.dart';
import 'package:poem_slide_puzzle/slide_puzzle_view.dart';

late MockSlidePuzzleController mockSlidePuzzleController;
void main() {
  testWidgets('slide puzzle view should correct number',
      (WidgetTester tester) async {
    mockSlidePuzzleController = MockSlidePuzzleController();
    when(() => mockSlidePuzzleController.displayPuzzle).thenReturn([
      ["1", "2", "3", "4"],
      ["5", "6", "7", "8"],
      ["9", "10", "11", "12"],
      ["13", "14", "15", ""],
    ]);

    await tester.pumpWidget(MaterialApp(
      home: SlidePuzzleView(controller: mockSlidePuzzleController),
    ));

    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('5'), findsOneWidget);
    expect(find.text('6'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
    expect(find.text('9'), findsOneWidget);
    expect(find.text('10'), findsOneWidget);
    expect(find.text('11'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);
    expect(find.text('13'), findsOneWidget);
    expect(find.text('14'), findsOneWidget);
    expect(find.text('15'), findsOneWidget);
  });
}

class MockSlidePuzzleController extends Mock implements SlidePuzzleController {}
