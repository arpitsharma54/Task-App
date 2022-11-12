import 'dart:io';

import 'package:challenge_01/store/app.state.dart';
import 'package:challenge_01/store/task/task.actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../store/task/task.state.dart';

class AddTasks extends StatefulWidget {
  const AddTasks({Key? key}) : super(key: key);

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  final _tasktext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: (store) => _ViewModel.create(store, context),
        builder: (context, viewModel) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
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
                            onSubmitted: (_) {
                              viewModel.addNewTask(_);
                            },
                            autofocus: true,
                            decoration: const InputDecoration(
                              label: Text('Enter your task here'),
                            ),
                          ),
                          const Divider(),
                          TextButton(
                            onPressed: () {
                              viewModel.addNewTask(_tasktext.text);
                            },
                            child: const Text('Add Task'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}

class _ViewModel {
  final TasksState tasksState;
  final Function addNewTask;

  _ViewModel({required this.tasksState, required this.addNewTask});

  factory _ViewModel.create(Store<AppState> store, BuildContext context) {
    addNewTask(String title) {
      store.dispatch(AddTaskAction(taskTitle: title));
      Navigator.of(context).pop();
    }

    return _ViewModel(
        tasksState: store.state.taskState, addNewTask: addNewTask);
  }
}
