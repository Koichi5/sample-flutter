import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_flutter/widget_test/todo_screen.dart';

void main() {
  group('TodoScreen のテスト', () {
    testWidgets('初期状態でTodoが表示されない', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: TodoScreen()));

      expect(find.text('No todos yet.'), findsOneWidget);
      expect(find.byType(ListTile), findsNothing);
    });

    testWidgets('Todoの追加が正しく行われる', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: TodoScreen()));

      await tester.enterText(find.byType(TextField), '新しいTodo');
      await tester.tap(find.text('Add'));
      await tester.pump();

      expect(find.text('新しいTodo'), findsOneWidget);
      expect(find.text('No todos yet.'), findsNothing);
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('Todoの削除が正しく行われる', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: TodoScreen()));

      await tester.enterText(find.byType(TextField), '削除するTodo');
      await tester.tap(find.text('Add'));
      await tester.pump();

      expect(find.text('削除するTodo'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete));
      await tester.pump();

      expect(find.text('削除するTodo'), findsNothing);
      expect(find.text('No todos yet.'), findsOneWidget);
    });

    testWidgets('空のTodoが追加されない', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: TodoScreen()));

      await tester.tap(find.text('Add'));
      await tester.pump();

      expect(find.text('No todos yet.'), findsOneWidget);
      expect(find.byType(ListTile), findsNothing);
    });
  });
}
