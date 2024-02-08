// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:sample_flutter/object_box/model/todo.dart';
// import 'package:sample_flutter/objectbox.g.dart';

// part 'todo_provider.g.dart';

// @riverpod
// class TodoController extends _$TodoController {
//   late Store store;
//   Box<Todo>? todoBox;

//   @override
//   Future<void> build() async {
//     store = await openStore();
//     todoBox = store.box<Todo>();
//     print('open store fired');
//   }

//   void addTodo({required Todo todo}) {
//     todoBox?.put(todo);
//   }

//   // void updateTodo(
//   //     {required Todo oldTodo,
//   //     required String title,
//   //     required String description,
//   //     int? priority}) {
//   //   final query = todoBox.query(Todo_.id.equals(oldTodo.id)).build();
//   //   final todoNeedUpdate = query.find().first;
//   // }

//   Stream<List<Todo>> getStreamTodo() {
//     if (todoBox == null) return Stream.value([]);
//     final builder =
//         todoBox!.query().order(Todo_.title, flags: Order.descending);
//     return builder.watch(triggerImmediately: false).map(
//           (query) => query.find(),
//         );
//   }

//   List<Todo> getAllTodo() {
//     if (todoBox == null) return [];
//     return todoBox!.getAll();
//   }

//   List<Todo> getImportantTodo() {
//     if (todoBox == null) return [];
//     final query = todoBox?.query(Todo_.priority.equals('1')).build();
//     final result = query!.find();
//     query.close();
//     return result;
//   }

//   void deleteTodo({required Todo todo}) {
//     todoBox?.remove(todo.id);
//   }

//   void deleteAllTodo() {
//     todoBox?.removeAll();
//   }
// }

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_provider.g.dart';

@riverpod
class IsImportantTodoOnlyController extends _$IsImportantTodoOnlyController {
  @override
  bool build() => false;

  void toggle() {
    state = !state;
  }
}
