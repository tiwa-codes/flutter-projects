import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/todo_provider.dart';
import 'package:flutter_application_1/widgets/todo_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoScreen extends ConsumerWidget {
  TodoScreen({super.key});

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    final todoNotifier = ref.read(todoProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      labelText: 'New Task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (textController.text.isNotEmpty) {
                      todoNotifier.addTodo(textController.text);
                      textController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return TodoItem(
                  todo: todo,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
