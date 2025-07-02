// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:biorhytm/main.dart';

void main() {
  testWidgets('Biorhythm app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BiorhythmApp());

    // Verify that our biorhythm app loads properly.
    expect(find.text('Biorhythm Calculator'), findsOneWidget);
    expect(find.text('Birth Date'), findsOneWidget);
    expect(find.text('Analysis Date'), findsOneWidget);
    expect(find.text('Select Birth Date'), findsOneWidget);

    // Verify that the initial state shows "Not selected" for birth date
    expect(find.text('Not selected'), findsOneWidget);
  });
}
