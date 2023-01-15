import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final bool addTask;
  final Task oldTask;
  const AddTaskScreen({
    Key? key,
    this.addTask = true,
    required this.oldTask
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTask.title);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Text(
          addTask ? 'Add Task' : 'Edit Task',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          autofocus: true,
          controller: titleController,
          decoration: const InputDecoration(
            label: Text('Title'),
            border: OutlineInputBorder(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                var task = Task(title: titleController.text, isDone: oldTask.isDone);
                context.read<TasksBloc>().add(addTask
                    ? AddTask(task: task)
                    : EditTask(oldTask: oldTask, newTask: task));
                Navigator.pop(context);
              },
              child: Text(addTask ? 'Add' : 'Update'),
            )
          ],
        ),
      ]),
    );
  }
}
