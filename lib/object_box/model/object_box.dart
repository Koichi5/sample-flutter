import 'package:sample_flutter/object_box/model/todo.dart';
import 'package:sample_flutter/objectbox.g.dart';

class ObjectBox {
  late final Store store;
  late final Box<Todo> todoBox;

  ObjectBox._create(this.store) {
    todoBox = Box<Todo>(store);
  }

  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }

  void addTodo({required Todo todo}) {
    todoBox.put(todo);
  }

  Stream<List<Todo>> getStreamTodo() {
    final builder = todoBox.query().order(Todo_.title, flags: Order.descending);
    return builder.watch(triggerImmediately: false).map(
          (query) => query.find(),
        );
  }

  List<Todo> getAllTodo() {
    return todoBox.getAll();
  }

  List<Todo> getImportantTodo() {
    final query = todoBox.query(Todo_.priority.equals('1')).build();
    final result = query.find();
    query.close();
    return result;
  }

  void updateTodo(
      {required Todo oldtTodo,
      required String title,
      required String description,
      required String priority}) {
    final todo = todoBox.get(oldtTodo.id);
    if (todo != null) {
      todo.title = title;
      todo.description = description;
      todo.priority = priority;
      todoBox.put(todo);
    }
  }

  void deleteTodo({required Todo todo}) {
    todoBox.remove(todo.id);
  }

  void deleteAllTodo() {
    todoBox.removeAll();
  }
}
