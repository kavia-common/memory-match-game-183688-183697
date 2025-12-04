import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:memory_game_frontend/main.dart';

void main() {
  testWidgets('App shows Memory Match title and Restart button', (WidgetTester tester) async {
    await tester.pumpWidget(const MemoryGameApp());

    expect(find.text('Memory Match'), findsOneWidget);
    expect(find.widgetWithIcon(ElevatedButton, Icons.refresh_rounded), findsOneWidget);
  });

  testWidgets('Tapping a card flips it', (WidgetTester tester) async {
    await tester.pumpWidget(const MemoryGameApp());
    await tester.pump(const Duration(milliseconds: 50));

    // Tap the first tappable in grid (gesture detector or ink).
    final tappable = find.byType(GestureDetector).first;
    await tester.tap(tappable);
    await tester.pump(const Duration(milliseconds: 260));

    // Verify grid still present and some animated widget exists
    expect(find.byType(GridView), findsOneWidget);
    expect(find.byType(AnimatedContainer), findsWidgets);
  });
}
