import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/todo.dart';
import 'package:flutter_application_1/providers/todo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoItem extends ConsumerWidget {
  const TodoItem({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoNotifier = ref.read(todoProvider.notifier);
    return ListTile(
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (_) {
          todoNotifier.toggleTodo(todo.id);
        },
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () {
          todoNotifier.removeTodo(todo.id);
        },
      ),
    );
  }
}