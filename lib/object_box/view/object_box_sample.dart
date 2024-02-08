import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_flutter/main.dart';
import 'package:sample_flutter/object_box/model/todo.dart';

class ObjectBoxSample extends ConsumerWidget {
  ObjectBoxSample({super.key});
  final TextEditingController addTitleController = TextEditingController();
  final TextEditingController addDescriptionController =
      TextEditingController();
  final TextEditingController addPriorityController = TextEditingController();

  final TextEditingController updateTitleController = TextEditingController();
  final TextEditingController updateDescriptionController =
      TextEditingController();
  final TextEditingController updatePriorityController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        actions: [
          IconButton(
            onPressed: () {
              showAddTodoDialog(context);
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: objectbox.getStreamTodo(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: Text('Todoがありません'),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data![index].title,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(snapshot.data![index].description),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showUpdateTodoDialog(
                                      context: context,
                                      oldTodo: snapshot.data![index],
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    showDeleteTodoDialog(
                                        context: context,
                                        todo: snapshot.data![index]);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            "Todoの情報を入力",
            style: TextStyle(fontSize: 18),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "タイトル"),
                controller: addTitleController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "詳細"),
                controller: addDescriptionController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "優先度"),
                keyboardType: TextInputType.number,
                controller: addPriorityController,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("キャンセル"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                objectbox.addTodo(
                  todo: Todo(
                    title: addTitleController.text,
                    description: addDescriptionController.text,
                    priority: addPriorityController.text,
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void showUpdateTodoDialog(
      {required BuildContext context, required Todo oldTodo}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            "変更するTodoの情報を入力",
            style: TextStyle(fontSize: 18),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "タイトル"),
                controller: updateTitleController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "詳細"),
                controller: updateDescriptionController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "優先度"),
                keyboardType: TextInputType.number,
                controller: updatePriorityController,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("キャンセル"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                objectbox.updateTodo(
                  oldtTodo: oldTodo,
                  title: updateTitleController.text,
                  description: updateDescriptionController.text,
                  priority: updatePriorityController.text,
                );
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void showDeleteTodoDialog(
      {required BuildContext context, required Todo todo}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            "このTodoを削除しますか？",
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              child: const Text("キャンセル"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                objectbox.deleteTodo(todo: todo);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
