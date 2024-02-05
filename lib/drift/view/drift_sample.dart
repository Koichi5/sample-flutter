import 'package:flutter/material.dart';
import 'package:sample_flutter/drift/database.dart';

class DriftSample extends StatelessWidget {
  DriftSample({super.key, required this.database});

  final AppDatabase database;
  final TextEditingController addTitleController = TextEditingController();
  final TextEditingController addContentController = TextEditingController();

  final TextEditingController updateTitleController = TextEditingController();
  final TextEditingController updateContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                stream: database.watchTodoItems(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<TodoItem>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
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
                                Text(snapshot.data![index].content),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showUpdateTodoDialog(
                                      context: context,
                                      oldTodoItem: snapshot.data![index],
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
                                        todoItem: snapshot.data![index]);
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
                controller: addContentController,
              )
            ],
          ),
          actions: [
            TextButton(
              child: const Text("キャンセル"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("OK"),
              onPressed: () async {
                database.addTodoItem(
                  title: addTitleController.text,
                  content: addContentController.text,
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
      {required BuildContext context, required TodoItem oldTodoItem}) {
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
                controller: updateContentController,
              )
            ],
          ),
          actions: [
            TextButton(
              child: const Text("キャンセル"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("OK"),
              onPressed: () async {
                database.updateTodoItems(
                  todoItem: oldTodoItem,
                  title: updateTitleController.text,
                  content: updateContentController.text,
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
      {required BuildContext context, required TodoItem todoItem}) {
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
              onPressed: () async {
                database.deleteTodoItem(todoItem);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
