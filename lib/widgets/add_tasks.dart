import 'package:challenge_01/models/tasks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tasks_list_data.dart';

class AddTasks extends StatefulWidget {
  const AddTasks({Key? key}) : super(key: key);

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  final _tasktext = TextEditingController();

  void _submitTask() {
    final newTask = Tasks(tasksTitle: _tasktext.text, id: 'null');
    if (_tasktext.text.isNotEmpty) {
      Provider.of<TasksListData>(context, listen: false).addNew(newTask);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.only(
                top: 5,
                left: 5,
                right: 5,
                bottom: 5,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _tasktext,
                    onSubmitted: (_) => _submitTask(),
                    autofocus: true,
                    decoration: const InputDecoration(
                      label: Text('Enter your task here'),
                    ),
                  ),
                  const Divider(),
                  TextButton(
                    onPressed: () {
                      _submitTask();
                    },
                    child: const Text('Add Task'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
