import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_flutter/widget_test/my_widget.dart';

void main() {
  testWidgets('SimpleWidget has a title and message', (tester) async {
    await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));

    final titleFinder = find.text('T');
    final messageFinder = find.text('M');
    final appBarFinder = find.byType(AppBar);

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
    expect(appBarFinder, findsOneWidget);
  });
}
