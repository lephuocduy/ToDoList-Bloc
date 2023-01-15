import 'package:flutter/material.dart';
import 'package:to_do_list/blocs/bloc_exports.dart';

import '../models/task.dart';
import '../screens/add_task_screen.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  void _editTask(BuildContext context, Task task) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(
                  addTask: false,
                  oldTask: task,
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            var task = tasksList[index];
            return Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(
                        fontSize: 24,
                        decoration:
                            task.isDone! ? TextDecoration.lineThrough : null),
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: task.isDone,
                          onChanged: (value) {
                            context
                                .read<TasksBloc>()
                                .add(UpdateTask(task: task));
                          }),
                      IconButton(
                          onPressed: () => _editTask(context, task),
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () => context
                              .read<TasksBloc>()
                              .add(DeleteTask(task: task)),
                          icon: Icon(Icons.delete)),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
